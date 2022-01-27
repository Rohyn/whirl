
-- balances and cooldowns we need to track
-- many important ones are not here because they run on gmcp.Char.Vitals
-- .ability_bal, .balance, .elixir, .equilibrium, .focus, .herb (pill), .moss (anabiotic),
-- .pipe, .renew, .salve (poultice), .tree,
whr.balance = {
crystal = true, -- crystal tattoo
nimbleness = true, -- avoidance nimbleness
fitness = true,
rage = true,
conjoin = true,
madness = true,
syncopate = true,
}

-- 'waiting' variables prevent spam - we've sent a command and are waiting to lose this balance
whr.waiting = {
balance = false,
equilibrium = false,
lighting = false, -- lighting pipes
parry = false,
queue = false, -- updating our queued action
melting = false, -- calling to wt when in danger
pk = false,
loot = false, -- looting items on the ground
path = false, -- speedwalk 'cooldown'
}

whr.base_status = {
class = "none",
city = "none",
tether = "none",
parrying = "none", -- what we are currently parrying
pipes_lit = false, -- are pipes currently lit?
empty_pipe = "none", -- which pipe ran out
smoked_pipe = "none", -- for determining which pipe ran out
-- what are we wielding?
wielded = {left =  {name="", id=""}, right = {name="", id=""}},
-- track % damage to all our limbs
limb_damage = {
  head = 0,
  torso = 0,
  ["left arm"] = 0,
  ["right arm"] = 0,
  ["left leg"] = 0,
  ["right leg"] = 0
  },
affs = {}, -- what affs do we have?
defs = {}, -- what defs do we have?
hp = 6000, -- current raw hp value
mp = 6000, -- current raw mp value
hpp = 100, -- current hp %
mpp = 100, -- current mp %
bleeding = 0, -- current bleeding
room = 0, -- current room vnum
room_name = "none", -- current room name
exits = {}, -- exits leading from current room
area = "none", -- current room's area
room_items = {}, -- all items in current room
players_here = {}, -- players in current room
talker = "none",
last_channel = "none",
pathing = false,
}

whr.status = whr.status or whr.base_status

whr.target = "none"
whr.target_gone = false -- target is out of the room
whr.moving_to = "none"

whr.new_area = false
whr.new_room = false

whr.fish_tick = 0