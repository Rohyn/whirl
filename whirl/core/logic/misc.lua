
function whr.untarget()
  whr.bashing.engaged = false
  whr.bashing.targeted = false
  whr.last_attack = "none"
  whr.bashing.target_priority = 10000
  whr.waiting.queue = false
  whr.waiting.balance = false
  whr.waiting.equilibrium = false
end

function whr.withGroup()
  for _, name in pairs(whr.status.players_here) do
    if not whr.contains(whr.group, name) and name ~= gmcp.Char.Status.name then
      return false
    end
  end
  return true
end

function whr.getMoving()
  if not whr.waiting.path and whr.canCast() and whr.moving_to ~= "none" then
    if gmcp.Char.Vitals.mounted == "0" then whr.mount() end
    if whr.toggles.gallop then
      whr.send("path find "..whr.moving_to..whr.sep.."path go gallop")
    elseif whr.toggles.dash then
      whr.send("path find "..whr.moving_to..whr.sep.."path go dash")
    else
      whr.send("path track "..whr.moving_to)
    end
    whr.moving_to = "none"
  end
end

function whr.haveSkill(skill, tree)
  return true -- can't figure out gmcp skill tracking, just assume yes for now
  --if not whr.skills then return false end
  --if skill == "Generic" or skill == "Goggle" then return true end
  
  --if tree then
  --  if whr.skills[tree:lower()] and whr.contains(whr.skills[tree:lower()], skill) then
  --    return true
  --  else
  --    return false
  --  end
  --else
  --  if whr.contains(whr.skills, skill) then
  --    return true
  --  else
  --    return false
  --  end
  --end
end

function whr.populateSkills()
  local group = gmcp.Char.Skills.List.group
  local list = gmcp.Char.Skills.List.list
  local newlist = {}
  for i, val in ipairs(list) do
    list[i] = val:gsub("* ", "")
  end
  
  if group then
    if not whr.skills then whr.skills = {} end
    whr.skills[group] = list
  end
end

function whr.contains(table, item)
  for _,thing in pairs(table) do
    if thing == item then
      return true
    end
  end
  return false
end

function whr.people_update()
  -- function to update people in room display
  -- if this was called, the people in room changed, so reset the target finder
  whr.target_index = 1
  whr.target_search = false
  -- then set some variables...
  whr.spirit_people = {}
  whr.shadow_people = {}
  
  -- check tether of present players
  --for player in pairs(whr.status.players_here) do
  --  whr.ndbCheck(player)
  --end

end

function whr.mount()
  whr.send("qeb recall "..whr.settings.mount..whr.sep.."recall mount"..whr.sep.."quickmount "..whr.settings.mount)
end

function whr.dismount()
  whr.send("qeb quickdismount "..whr.settings.mount..whr.sep.."order "..whr.settings.mount.." follow me")
end