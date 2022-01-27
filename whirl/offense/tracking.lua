
whr.pk = {} -- this will be filled out with players we are tracking

function whr.pkUpdate(player)
  -- this is called whenever a player is hit or receives or cures an effect in our presence
  if whr.pk[player] then -- first check if we're tracking this person
    -- we are tracking them, so refresh their timeout ticker
    
  else -- we're not tracking them yet
    -- make them a new status sheet
    whr.pk[player] = {
      class = "none",
      affs = {}, -- what affs do they have?
      limb_dmg = { -- 33% is damaged, 66% is mangled
        head = 0,
        torso = 0,
        ["left arm"] = 0,
        ["right arm"] = 0,
        ["left leg"] = 0,
        ["right leg"] = 0,
        },
      bruising = { -- 0 is none, 1 is light, 2 is moderate, 3 is critical
        head = 0,
        torso = 0,
        ["left arm"] = 0,
        ["right arm"] = 0,
        ["left leg"] = 0,
        ["right leg"] = 0,
        },
      parrying = "none", -- what are they parrying?
      last_limb = "none", -- which of their limbs was hit last?
      resto_limb = "none", -- which limb did they resto?
      tumbling = false, -- are they tumbling?
      impaled = false, -- has anyone impaled them?
      we_impaled = false, -- have /we/ impaled them?
      shield = false, -- are they shielded?
      rebounding = false, -- do they have rebounding?
      paste = true, -- do they have fangbarrier?
    }
  end
end

function whr.pkRemove(player)
  -- called by whr.playerCheck() if someone's status sheet has timed out
  if whr.people_hitting_me[player] then
    whr.people_hitting_me[player] = nil
  end
  if player == whr.target then
    return -- we don't want to remove our target info
  elseif whr.pk[player] ~= nil then -- this is not our target
    --whr.message("Removing "..player.."!")
    whr.pk[player] = nil -- just take them out of the list
  end
end

function whr.playerCheck()
  -- we run this on the prompt, to remove old status entries
  if not whr.waiting.pk then -- we don't want to run every prompt, so throttle
    for i in pairs(whr.pk) do -- iterate over all status sheets
      
    end
    whr.waiting.pk = true -- set our throttle
    DoAfter(3, [[whr.waiting.pk = false]])
  end
end

function whr.checkAff(person, affliction)
  -- this is called when we want to see if a person has an affliction
  if whr.pk[person] == nil then -- make sure we're tracking this person, first
    return false -- if we're not, they don't have this aff
  end
  if affliction == "paresis" then
    -- paralysis also counts
    if whr.contains(whr.pk[person].affs, affliction) or whr.contains(whr.pk[person].affs, "paralysis") then
      return true
    else
      return false
    end
  -- or for any other aff...
  elseif whr.contains(whr.pk[person].affs, affliction) then
    return true -- check passed, the person has this aff
  else
    return false -- check failed, person does not have this aff
  end
end

function whr.countAffs(person, kind)
  local tally = 0
  local aff_list = {}
  whr.pkUpdate(person)
  if kind == "physical" then
    aff_list = whr.physical_affs
  elseif kind == "mental" then
    aff_list = whr.mental_affs
  end
  for _,aff in pairs(whr.pk[person].affs) do
    if whr.contains(aff_list, aff) then
      tally = tally + 1
    end
  end
  return tally
end

function whr.pkStatus(person, status, state)
  -- someone's status has changed in some way
  whr.pkUpdate(person) -- make sure we're tracking this person
  if whr.pk[person][status] == nil then -- we received an invalid status
    whr.message("No such status as "..status.."!")
  else
    local symbol = ">"
    whr.pk[person][status] = state
    if state == true then
      symbol = "+"
    elseif state == false then
      symbol = "-"
    end
    cecho(symbol..status)
  end
end

function whr.curativeUsed(person, curative)
  -- someone has used a curative
  whr.pkUpdate(person) -- make sure we're tracking this person first
  if whr.cures[curative] ~= nil then -- make sure this curative exists
    -- iterate affs this curative can cure, until we find one this person has
    for affliction in pairs(whr.cures[curative]) do
      if whr.contains(whr.pk[person].affs, whr.cures[curative][affliction]) then
        -- we found the highest priority aff that this person has
        whr.effectCured(person, whr.cures[curative][affliction])
        break -- stop iterating, they can only cure one thing
      end
    end
  end
end

function whr.attackLanded(person, attack)
  -- someone was hit with an attack
  whr.pkUpdate(person)
  
end

function whr.effectGiven(person, effect)
  -- someone received an effect
  whr.pkUpdate(person) -- make sure we're tracking this person
  -- check for cases where we may be doubling up
  if whr.checkAff(person, effect) and effect ~= "a_broken_leg" and effect ~= "a_broken_arm" then
    return
  end
  if effect == "cold" then
    -- they got some stack of cold, so we'll check for the first one they're missing
    if not whr.checkAff(person, "no_caloric") then effect = "no_caloric"
    elseif not whr.checkAff(person, "shivering") then effect = "shivering"
    elseif not whr.checkAff(person, "frozen") then effect = "frozen"
    elseif not whr.checkAff(person, "ice_encased") and whr.checkAff("frostbrand") then effect = "ice_encased"
    else return -- they can't get any more cold stacks, just stop here
    end
  end
  -- some effects replace other effects without explicitly saying so
  if effect == "crippled_body" then
    whr.effectCured(person, "crippled")
  end
  table.insert(whr.pk[person].affs, effect) -- give them the effect
  cecho(" +"..effect) -- echo the effect
  if person == whr.target then -- if this is our target
    whr.waiting.queue = false -- we may need to update our queued attack, since target status changed
  end
end

function whr.effectCured(person, effect)
  -- someone cured an effect
  whr.pkUpdate(person) -- start by making sure we're tracking this person
  -- some cures indicate other afflictions were removed
  if effect == "paralysis" then
    whr.effectCured(person, "paresis")
  elseif effect == "shivering" then
    whr.effectCured(person, "frozen")
  elseif effect == "accursed" then
    whr.effectCured(person, "agony")
  elseif effect == "cold" then
    if whr.checkAff(person, "ice_encased") then whr.effectCured(person, "ice_encased")
    elseif whr.checkAff(person, "frozen") then whr.effectCured(person, "frozen")
    elseif whr.checkAff(person, "shivering") then whr.effectCured(person, "shivering")
    elseif whr.checkAff(person, "no_caloric") then whr.effectCured(person, "no_caloric")
    end
  elseif effect == "right_arm_broken" or effect == "left_arm_broken" then
    -- it's possible we didn't know which arm was broken
    if not whr.checkAff(person, effect) then -- yeah we didn't have this arm listed...
      effect = "a_broken_arm"
    end
  elseif effect == "right_leg_broken" or effect == "left_leg_broken" then
    -- same thing, just to check
    if not whr.checkAff(person, effect) then
      effect = "a_broken_leg"
    end
  end
  -- go ahead and actually cure it now
  for i in pairs(whr.pk[person].affs) do
    if whr.pk[person].affs[i] == effect then
      table.remove(whr.pk[person].affs, i) -- remove the effect from their list
      cecho(" -"..effect) -- echo the change
    end
  end
  if person == whr.target then -- if this is our target
    whr.waiting.queue = false -- we may need to update our queued attack, since target status changed
  end
end

function whr.attackHit(attack, attacker, target)
  if string.lower(attacker) == "you" then
    -- we have hit with an attack
    whr.message("You: HIT "..attack.." "..target.."!")
    whr.target_index = 1
    whr.target_search = false
  elseif string.lower(target) == "you" then
    -- we have gotten hit with an attack
    whr.message(attacker..": HIT "..attack.." you!")
  elseif string.title(target) == whr.target then
    -- our target has been hit with an attack
    whr.message(attacker..": HIT "..attack.." "..target.."!")
  else
    whr.message(attacker..": HIT "..attack.." "..target.."!")
  end
  if not string.lower(target) == "you" then
    whr.attackLanded(target, attack)
  end
  if not string.lower(attacker) == "you" then
    whr.pkUpdate(attacker)
  end
end

function whr.attackUndo(target)
  for _,aff in pairs(whr.last_affs) do
    whr.effectCured(target, aff)
  end
end