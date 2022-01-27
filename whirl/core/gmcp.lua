require "tprint"
require "json"

local IAC, SB, SE, DO = 0xFF, 0xFA, 0xF0, 0xFD
local GMCP      = 201
 
---------------------------------------------------------------------------------------------------
-- Mushclient callback function when telnet SB data received.
---------------------------------------------------------------------------------------------------
function OnPluginTelnetSubnegotiation (msg_type, data)
   if msg_type ~= GMCP then
      return
   end -- if not GMCP
  
   message, params = string.match (data, "([%a.]+)%s+(.*)")
  
   -- if valid format, broadcast to all interested plugins
   if message then
     handleGMCP(data)
   end -- if
   
end -- function OnPluginTelnetSubnegotiation
function OnPluginTelnetRequest (msg_type, data)
   if msg_type == GMCP and data == "WILL" then
      return true
   end -- if
  
   if msg_type == GMCP and data == "SENT_DO" then
      Note ("Enabling GMCP.") 
      -- This hard-coded block may need to be made into a config table as we add more message types.
      Send_GMCP_Packet (string.format ('Core.Hello { "client": "MUSHclient", "version": "%s" }', Version()))
      Send_GMCP_Packet ('Core.Supports.Set [ "Char 1", "Char.Skills 1", "Char.Items 1", "Char.Vitals 1", "Char.Status 1", "Char.Defences 1", "Char.Afflictions 1", "Comm 1", "Room 1" ]')
      return true
   end -- if GMCP login needed (just sent DO)
   return false
end -- function OnPluginTelnetRequest
function OnPluginDisable()
   EnablePlugin(GetPluginID(), true)
   ColourNote("white", "blue", "You are not allowed to disable the "..
   GetPluginInfo(GetPluginID(), 1).." plugin. It is necessary for other plugins.")
end
---------------------------------------------------------------------------------------------------
-- Helper function to send GMCP data.
---------------------------------------------------------------------------------------------------
function Send_GMCP_Packet (what)
   assert (what, "Send_GMCP_Packet passed a nil message.")
   SendPkt (string.char (IAC, SB, GMCP) .. 
           (string.gsub (what, "\255", "\255\255")) ..  -- IAC becomes IAC IAC
            string.char (IAC, SE))
end -- Send_GMCP_Packet
  
gmcp = gmcp or {}
gmcp.Char = gmcp.Char or {}
gmcp.Room = gmcp.Room or {}
gmcp.Char.Items = gmcp.Char.Items or {}

function getStats (what)
  result, value = CallPlugin("3e7dedbe37e44942dd46d264", "gmcpval", what)
  if result ~= 0 then
    ColourNote ("orange", "", "Warning: Could not get stats for " .. what)
    return nil
  end -- if
  return value
end -- getStats
function gotCharacterVitals (vitals)
  gmcp.Char.Vitals = vitals
  -- calculate and store some gmcp stats
  whr.status.hp = tonumber(gmcp.Char.Vitals.hp)
  whr.status.mp = tonumber(gmcp.Char.Vitals.mp)
  whr.status.hpp = 100 * (whr.status.hp / tonumber(gmcp.Char.Vitals.maxhp))
  whr.status.mpp = 100 * (whr.status.mp / tonumber(gmcp.Char.Vitals.maxmp))
  whr.status.bleeding = tonumber(gmcp.Char.Vitals.bleeding)
  -- handle any logic we want to run every prompt
  if whr.canCast() and whr.last_attack ~= "none" then
    whr.last_attack = "none"
  end
  whr.rebounded = false
  whr.called_affs = {}
  whr.last_affs = {}
  if whr.new_area then
    Note("Entering "..whr.status.area)
    if whr.status.area == "the Shattered Vortex" then
      if whr.status.tether == "shadow" then
        whr.loadTargets("the Shattered Vortex (Shadow)")
      else
        whr.loadTargets("the Shattered Vortex (Spirit)")
      end
    else
      whr.loadTargets(whr.status.area)
    end
    --if whr.bot.routes[whr.status.area] then
    --  Note("Have a route.")
    --else
    --  Note("No route yet!")
    --end
    whr.new_area = false
  end
  if whr.new_room then
    --if whr.bot.going and whr.status.pathing then
    --  return
    --end
    if whr.toggles.fasthunt or whr.toggles.fastwalk then
      if whr.toggles.fasthunt and whr.withGroup() then
        whr.toggles.bashing = true
        whr.room_clear = true
        whr.runBasher()
      --elseif whr.bot.going then
      --  whr.move()
      end
    end
    whr.new_room = false
  end
  --whr.core()
end  -- gotCharacterVitals
function gotCharacterStatus (status)
--  tprint (status)
end  -- gotCharacterStatus
function gotCharacterSkills (skills)

end
function gotRoomInfo (info)
  gmcp.Room.Info = info
  local zone = string.gsub(gmcp.Room.Info.area, "an unstable section of ", "")
  if whr.status.room ~= gmcp.Room.Info.num then
    -- we are in a new room, update our status
    whr.status.room = gmcp.Room.Info.num
    whr.status.room_name = gmcp.Room.Info.name
    whr.status.exits = {}
    for ex in pairs(gmcp.Room.Info.exits) do
      table.insert(whr.status.exits, ex)
    end
    -- handle any logic that needs to happen on new room
    whr.vermin = 0
    whr.eld = 0
    whr.ylem_mist = false
    if whr.toggles.vermin then
      --enableTimer("moveroom")
    end
    whr.waiting.balance = false
    whr.waiting.equilibrium = false
    whr.waiting.queue = false
    whr.new_room = true
    whr.people_hitting_me = {}
  end
  if whr.status.area ~= zone then
    -- we are in a new area, update our status
    whr.status.area = zone
    -- handle any logic upon entering a new zone
    whr.new_area = true
    if whr.status.area == "the Underhalls" then
      whr.resetMe()
    end
    --if whr.bot.going then
    --  if whr.bot.routes[whr.status.area] then
    --    whr.bot.path = whr.bot.routes[whr.status.area]
    --  end
    --end
  end
end  -- gotRoomInfo
function gotRoomPlayers (players)
  whr.status.players_here = {}
  for k,v in ipairs(players) do
    if not whr.contains(whr.status.players_here, players[k].name) then
      table.insert(whr.status.players_here, players[k].name)
    end
  end
  whr.people_update()
end  -- gotRoomPlayers
function gotWrongDirection (dir)
--  print ("Could not head: ", dir [1])
  --Sound ("ding.wav")
end -- gotWrongDirection
function gotAddPlayer (which)
  local newPlayer = which.name
  if not table.contains(whr.status.players_here, newPlayer) then
    table.insert(whr.status.players_here, newPlayer)
  end
  people_update()
end -- gotAddPlayer
function gotRemovePlayer (which)
  local removePlayer = which
  if whr.contains(whr.status.players_here, removePlayer) then
    for k,v in pairs(whr.status.players_here) do
      if v == RemovePlayer then
        table.remove(whr.status.players_here, k)
      end
    end
  end
  people_update()
end -- gotRemovePlayer
function gotCharacterName (name)
  --tprint (name)
end -- gotCharacterName
function gotCharacterStatusVars (status)
  -- tprint (status)
end -- gotCharacterStatusVars
function gotCharacterAfflictionsList (affs)
  --tprint (affs)
end -- gotCharacterAfflictionsList
function gotCharacterAfflictionsAdd (what)
  --tprint (what)
end -- gotCharacterAfflictionsAdd
function gotCharacterDefencesList (defs)
  --tprint (defs)
end -- gotCharacterDefencesList
function gotCharacterDefencesAdd (add)
  --tprint (add)
end -- gotCharacterDefencesAdd
function gotCharacterAfflictionsRemove (what)
  --tprint (what)
end -- gotCharacterAfflictionsRemove
function gotItemList (items)
  gmcp.Char.Items.List = items
  if gmcp.Char.Items.List.location == "room" then
    -- we have looked in a room and gotten a list of items in it
    whr.status.room_items = {}
    for _, v in ipairs(gmcp.Char.Items.List.items) do
      if not whr.status.room_items[v.name] then whr.status.room_items[v.name] = {} end
      table.insert(whr.status.room_items[v.name], v.id)
    end
  elseif gmcp.Char.Items.List.location == "inv" then
    whr.status.wielded = {left =  {name="", id=""}, right = {name="", id=""}}
    if gmcp.Char.Vitals.wield_left ~= "empty" then
      whr.status.wielded.left.name = string.match(gmcp.Char.Vitals.wield_left, "%a+")
      whr.status.wielded.left.id = string.match(gmcp.Char.Vitals.wield_left, "%d+")
    end
    if gmcp.Char.Vitals.wield_right ~= "empty" then
      whr.status.wielded.right.name = string.match(gmcp.Char.Vitals.wield_right, "%a+")
      whr.status.wielded.right.id = string.match(gmcp.Char.Vitals.wield_right, "%d+")
    end
  end
end
function gotItemAdd (item)
  gmcp.Char.Items.Add = item
  v = gmcp.Char.Items.Add.item
  if gmcp.Char.Items.Add.location == "room" then
    if not whr.status.room_items[v.name] then whr.status.room_items[v.name] = {} end
    table.insert(whr.status.room_items[v.name], v.id)
    if whr.toggles.fasthunt and not whr.toggles.bashing and not (whr.status.pathing) then
      -- an item entered the room and we're fasthunting but not currently bashing, check if it's a target
      whr.toggles.bashing = true
      whr.runBasher()
    end
  elseif gmcp.Char.Items.List ~= nil then
    if gmcp.Char.Vitals.wield_left ~= "empty" then
      whr.status.wielded.left.name = string.match(gmcp.Char.Vitals.wield_left, "%a+")
      whr.status.wielded.left.id = string.match(gmcp.Char.Vitals.wield_left, "%d+")
    end
    if gmcp.Char.Vitals.wield_right ~= "empty" then
      whr.status.wielded.right.name = string.match(gmcp.Char.Vitals.wield_right, "%a+")
      whr.status.wielded.right.id = string.match(gmcp.Char.Vitals.wield_right, "%d+")
    end
  end
end
function gotItemRemove (item)
  gmcp.Char.Items.Remove = item
  v = gmcp.Char.Items.Remove.item
  if gmcp.Char.Items.Remove.location == "room" then
    -- an item has left our room, was it our bashing target?
    if v == whr.bashing.target and whr.toggles.bashing then
      whr.runBasher()
    end
    -- update our in-room items list
    for item in pairs(whr.status.room_items) do
      for id in pairs(whr.status.room_items[item]) do
        if whr.status.room_items[item][id] == v.id then
          table.remove(whr.status.room_items[item], id)
          if #whr.status.room_items[item] == 0 then whr.status.room_items[item] = nil end
        end
      end
    end
  elseif gmcp.Char.Items.List ~= nil then
    if gmcp.Char.Items.List.location == "inv" then
      if gmcp.Char.Vitals.wield_left ~= "empty" then
        whr.status.wielded.left.name = string.match(gmcp.Char.Vitals.wield_left, "%a+")
        whr.status.wielded.left.id = string.match(gmcp.Char.Vitals.wield_left, "%d+")
      end
      if gmcp.Char.Vitals.wield_right ~= "empty" then
        whr.status.wielded.right.name = string.match(gmcp.Char.Vitals.wield_right, "%a+")
        whr.status.wielded.right.id = string.match(gmcp.Char.Vitals.wield_right, "%d+")
      end
    end
  end
end
function gotItemUpdate (item)
  gmcp.Char.Items.Update = item
  v = gmcp.Char.Items.Update.item
  if gmcp.Char.Items.Update.location == "inv" then
    -- this item was updated in our inventory, was it a wielding change?
    if gmcp.Char.Vitals.wield_left ~= "empty" then
      whr.status.wielded.left.name = string.match(gmcp.Char.Vitals.wield_left, "%a+")
      whr.status.wielded.left.id = string.match(gmcp.Char.Vitals.wield_left, "%d+")
    end
    if gmcp.Char.Vitals.wield_left ~= "empty" then
      whr.status.wielded.right.name = string.match(gmcp.Char.Vitals.wield_right, "%a+")
      whr.status.wielded.right.id = string.match(gmcp.Char.Vitals.wield_right, "%d+")
    end
  else
    if whr.status.wielded.left.id == v.id then
      whr.status.wielded.left.name = ""
      whr.status.wielded.left.id = ""
    elseif whr.status.wielded.right.id == v.id then
      whr.status.wielded.right.name = ""
      whr.status.wielded.right.id = ""
    end
  end
end
-- WARNING: Put handlers table AFTER the handler functions
--          Make names lower case, as we do a lower-case conversion for the lookup
handlers = {
  ["char.vitals"]           = gotCharacterVitals,
  ["char.status"]           = gotCharacterStatus,
  ["char.name"]             = gotCharacterName,
  ["char.statusvars"]       = gotCharacterStatusVars,
  ["char.skills"]           = gotCharacterSkills,
  ["char.afflictions.list"] = gotCharacterAfflictionsList,
  ["char.afflictions.add"]  = gotCharacterAfflictionsAdd,
  ["char.afflictions.remove"] = gotCharacterAfflictionsRemove,
  ["char.defences.list"]    = gotCharacterDefencesList,
  ["char.defences.add"]     = gotCharacterDefencesAdd,
  ["char.items.list"]       = gotItemList,
  ["char.items.add"]        = gotItemAdd,
  ["char.items.remove"]     = gotItemRemove,
  ["char.items.update"]     = gotItemUpdate,
  
  ["room.info"]             = gotRoomInfo,
  ["room.players"]          = gotRoomPlayers,
  ["room.wrongdir"]         = gotWrongDirection,
  ["room.removeplayer"]     = gotRemovePlayer,
  ["room.addplayer"]        = gotAddPlayer,
  
  } -- end of handlers
  
function handleGMCP (text)
  
   -- pull out GMCP message, plus the data belonging to it
   message, params = string.match (text, "([%a.]+)%s+(.*)")

   -- no match? oops!
   if not message then
      return
   end -- if
           
   -- ensure we have an array or object
   if not string.match (params, "^[%[{]") then
      params =  "[" .. params .. "]"  -- JSON hack, make msg first element of an array.
   end -- if 
   
   -- decode it
   result = assert (json.decode (params))
   
   -- debugging
   ColourNote ("yellow", "", "GMCP: " .. message)
   
   -- find a handler for this message type
   local handler = handlers [message:lower ()]
   
   -- warn if not found
   if not handler then
     ColourNote ("red", "", "Warning: No handler for: " .. message)
     return
   end -- no handler
   
   -- call the handler, pass in whatever we got
   handler (result)
end -- handleGMCP