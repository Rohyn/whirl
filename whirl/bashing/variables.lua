
whr.room_clear = true

whr.bashing = {
target = "none",
target_type = "long",
target_word = "",
old_target = "",
target_number = "",
target_desc = "",
corpse_word = "",
corpse_number = "",
corpse_desc = "",
target_priority = 10000,
engaged = false,
targeted = false,
stopping = false
}

whr.possible_targets = {}
whr.possible_items = {}
whr.gathering = {}
whr.ylem_mist = false
whr.vermin = 0

whr.class_list = {
["Templar"] = function(current) whr.templarBash() end,
["Luminary"] = function(current) whr.luminaryBash() end, 
["Ascendril"] = function(current) whr.ascendrilBash() end,
["Zealot"] = function(current) whr.zealotBash() end, 
["Shaman"] = function(current) whr.shamanBash() end, 
["Sentinel"] = function(current) whr.sentinelBash() end, 
["Monk"] = function(current) whr.monkBash() end, 
["Wayfarer"] = function(current) whr.wayfarerBash() end,
["Syssin"] = function(current) whr.syssinBash() end, 
["Shapeshifter"] = function(current) whr.shifterBash() end, 
["Archivist"] = function(current) whr.archivistBash() end, 
["Sciomancer"] = function(current) whr.sciomancerBash() end, 
["Teradrim"] = function(current) whr.teradrimBash() end, 
["Praenomen"] = function(current) whr.praenomenBash() end, 
["Indorani"] = function(current) whr.indoraniBash() end, 
["Carnifex"] = function(current) whr.carnifexBash() end,
["Revenant"] = function(current) whr.revenantBash() end,
["Warden"] = function(current) whr.wardenBash() end,
["Oneiromancer"] = function(current) whr.oneiromancerBash() end,
["Earthcaller"] = function(current) whr.earthcallerBash() end,
}