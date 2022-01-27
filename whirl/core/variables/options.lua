
whr.sep = whr.sep or "&&" -- CONFIG SEPARATOR value


whr.settings = whr.settings or {
mount = "117145", -- your mount's ID number
pack = "none", -- your pack's ID number
}

whr.toggles = whr.toggles or {
active = true, -- pause system entirely
parrying = true, -- parry limbs
grouped = true, -- working in a group, calling affs, supporting allies, etc
attacking = false, -- currently running an offense
listening = false, -- listening to target calls
calling = false, -- calling targets
bashing = false, -- attacking denizens
fasthunt = false, -- run bashing on room movement
generics = false, -- target bashing by word instead of number
vermin = false,
fishing = false,
questing = false, -- are we doing quest stuff
lighting = true, -- light pipes
gags = true, -- gag and replace lines
debug = false, -- shows commands sent by the system if true
goggles = true,
goggle_level = 0,
gauntlet = true,
gauntlet_level = 0,
gallop = true, -- for the pather
dash = false, -- also for the pather
}

whr.toggle_list = {
"active", -- pause system entirely
"parrying", -- parry limbs
"grouped", -- working in a group, calling affs, supporting allies, etc
"attacking", -- currently running an offense
"listening", -- listening to target calls
"calling", -- calling targets
"bashing", -- attacking denizens
"fasthunt", -- run bashing on room movement
"generics", -- target bashing by word instead of number
"vermin",
"fishing",
"questing", -- are we doing quest stuff
"lighting", -- light pipes
"gags", -- gag and replace lines
"debug", -- shows commands sent by the system if true
"goggles",
"gauntlet",
"gallop", -- for the pather
"dash", -- also for the pather
}

-- function to toggle options for quick recall
function whr.toggle(toggle)
  if whr.toggles[toggle] then -- if it's true
    whr.toggles[toggle] = false -- set to false
    whr.message(toggle .. " OFF!", "toggle")
  else -- if it's not true
    whr.toggles[toggle] = true -- set to true
    whr.message(toggle .. " ON!", "toggle")
  end
end
