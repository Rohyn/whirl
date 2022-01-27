
function whr.send(action)
  Send(action)
end

function whr.delay()
  -- the amount of time to wait for anti-spam
  if whr.haveAff("aeon") then
    return 1.5
  else
    return 0.5
  end
end

function whr.parseDir(direction)
  -- convert directions to shorthand
  if direction == "north" then
    return "n"
  elseif direction == "south" then
    return "s"
  elseif direction == "east" then
    return "e"
  elseif direction == "west" then
    return "w"
  elseif direction == "northeast" then
    return "ne"
  elseif direction == "northwest" then
    return "nw"
  elseif direction == "southeast" then
    return "se"
  elseif direction == "southwest" then
    return "sw"
  elseif direction == "up" then
    return "up"
  elseif direction == "down" then
    return "d"
  else
    return direction
  end
end

function whr.swapDir(direction)
  local directions = {
    north = "south",
    south = "north",
    east = "west",
    west = "east",
    northeast = "southwest",
    southwest = "northeast",
    northwest = "southeast",
    southeast = "northwest",
    ["in"] = "out",
    out = "in",
    up = "down",
    down = "up",
  }
  return directions[direction]
end

function table.isMember(table, member)
  for i, m in ipairs(table) do
    if m == member then
      return true
    end
  end
  return false
end

function whr.count(table)
  local count = 0
  for i, v in ipairs(table) do
    count = count + 1
  end
  return count
end

function whr.weaponType(weapon)
  for wtype in pairs(whr.weapon_types) do
    if string.find(weapon, whr.weapon_types[wtype]) then
      return whr.weapon_types[wtype]
    end
  end
  return weapon
end

function whr.skillrankcheck(rank)
  local skillranks = {
    "Transcendent",
    "Mythical",
    "Fabled",
    "Virtuoso",
  }

  for _, v in pairs(skillranks) do
    if string.find(rank, v) then
      return true
    end
  end
end