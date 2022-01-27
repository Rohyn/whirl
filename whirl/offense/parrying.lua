
function whr.pickParry()
  return "parry"
end


function whr.parry()
  -- we primarily want to set whr.parry here, and if we can parry now, do so
  whr.toparry = "none"
  hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
  -- check what class we're fighting and run parry logic based on class
  if whr.cureset == "group" then
    -- we're being hit by multiple people, just parry whatever was hit last
    if whr.my_last_limb_damaged ~= "none" then
      -- this should prevent jugular spam at least...
      whr.toparry = whr.my_last_limb_damaged
    end
  elseif whr.cureset == "carnifex" then
    if hp <= 40 then
      whr.toparry = "head"
    else
      whr.genericParryLogic()
    end
    if whr.toparry == "none" then
      whr.toparry = "torso"
    end
  elseif whr.cureset == "templar" then
    if gmcp.Char.Vitals.prone == "0" then
    -- we are not prone
      whr.genericParryLogic()
    else -- we are prone and they are trying to finish us with bruises
      whr.genericParryLogic()
    end
  elseif whr.cureset == "shifter" then
    if gmcp.Char.Vitals.prone == "0" then
    -- we are not prone, we want to keep it that way!
      if whr.status.limb_damage["left leg"] >= 33.3 then
        whr.toparry = "left leg"
      elseif whr.status.limb_damage["right leg"] >= 33.3 then
        whr.toparry = "right leg"
      end
    end
    if whr.toparry == "none" then
    -- we didn't find something more important to parry
      if whr.haveAff("right_leg_broken") then
        whr.toparry = "right leg"
      elseif whr.haveAff("left_leg_broken") then
        whr.toparry = "left leg"
      elseif whr.haveAff("left_arm_broken") then
        whr.toparry = "left arm"
      elseif whr.haveAff("right_arm_broken") then
        whr.toparry = "right arm"
      end
    end
    if whr.toparry == "none" then
    -- still nothing!
      whr.genericParryLogic()
    end
  elseif whr.cureset == "zealot" then
    whr.genericParryLogic()
    if whr.toparry == "none" then
      whr.toparry = "torso"
    end
  elseif whr.cureset == "sentinel" then
    whr.toparry = "head"
  end
  -- if we meet no conditions for the class we're fighting, run generic parry logic
  if whr.toparry == "none" then
    whr.genericParryLogic()
  end
  -- if we're able to actually use parry now...
  if whr.toparry ~= "none" and whr.toparry ~= whr.status.parrying and whr.canCast() and not whr.waiting.parry then
    whr.send(whr.pickParry().." "..whr.toparry)
    whr.waiting.parry = true
    DoAfter(whr.delay(), [[whr.waiting.parry = false]])
  end
end

function whr.genericParryLogic()
  local highest = 0
  for limb in pairs(whr.status.limb_damage) do
    if string.find(limb, " ") then
      x = string.gsub(limb, " ", "_")
      aff = "pre_restore_"..x
    else
      aff = "pre_restore_"..limb
    end
    if whr.status.limb_damage[limb] > highest and whr.status.limb_damage[limb] < 33.33 and not (limb == whr.my_resto) then
      highest = whr.status.limb_damage[limb]
      whr.toparry = limb
    end
    if whr.status.limb_damage[limb] > 25 then
      whr.affHave(aff)
    else
      whr.affRemove(aff)
    end
  end
end