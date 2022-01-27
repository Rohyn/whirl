
function whr.attackFunction()
  -- this should be defined in offense route aliases
  Note("\nYou haven't set up an attack alias yet!") -- this /should/ never be seen
end

function whr.startingRoute()
  -- this should be called at the top of each offense route alias
  -- we want to clear or reset or check important things here.
  whr.pkUpdate(whr.target) -- make sure we have a status sheet for our target, first of all
  whr.send("target nothing with left"..whr.sep.."target nothing with right")
  whr.send("leading off") -- we don't want to get stuck with leading on in PvP
  whr.waiting.queue = false -- make sure we can queue an attack right away
  if not whr.toggles.attacking then whr.toggle("attacking") end -- make sure we're queuing attacks
end

function whr.attack(attack)
  -- this function is called at the end of the attack_function()
  -- we should receive a string containing the attack we want to send
  local string = ""
  -- there may be some conditions that /replace/ our attack string
  if whr.needFitness() and whr.canFitness() then
    -- we have asthma, slickness, anorexia, and paresis - let's cure them all at once
    string = "fitness"..whr.sep.."smoke yarrow"..whr.sep.."apply epidermal"..whr.sep.."eat opiate"
  elseif whr.needFitness() and gmcp.Char.Vitals.renew == "1" then
    -- renew doesn't replace our attack, but we want to hold it for when fitness is down and we're in trouble
    string = "renew"..whr.sep..attack
  else
    string = attack
  end
  -- now we may want to prepend some things to your attack
  string = "stand"..whr.sep.."g body"..whr.sep.."g husk"..whr.sep..string
  -- see if we need to parry
  if whr.toggles.parrying and whr.toparry ~= "none" and whr.status.parrying ~= whr.toparry then
    string = whr.pickParry().." "..whr.toparry..whr.sep..string
  end
  -- refill and light pipes
  if whr.status.empty_pipe ~= "none" then
    string = "outc "..whr.status.empty_pipe..whr.sep.."put "..whr.status.empty_pipe.." in emptypipe"..whr.sep..string
  end
  if not whr.status.pipes_lit and whr.toggles.lighting then
    string = "light pipes"..whr.sep..string
  end
  -- finally, queue it up
  whr.send("qeb "..string)
end