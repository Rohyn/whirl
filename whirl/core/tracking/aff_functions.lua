
-- functions related to tracking what afflictions we have

function whr.affGain(affliction)
  -- we just gained a new affliction, probably saw the 'You are now X' line
  whr.message("You: GOT "..affliction..".", "aff")
  whr.affHave(affliction)
end

function whr.affHave(affliction)
  -- we just realized we have an affliction that may not be new, such as something hidden or a voyria tick
  if not whr.contains(whr.status.affs, affliction) then
    table.insert(whr.status.affs, affliction)
  end
  if not affliction:find("pre_restore") then
    whr.parry()
  end
end

function whr.affDiag(affliction)
  -- we have sent DIAGNOSE and found a line

end

function whr.affCure(affliction)
  -- we just cured an affliction, probably saw the 'You are no longer X' line
  whr.message("You: HEAL "..affliction..".", "aff")
  whr.affRemove(affliction)
end

function whr.affRemove(affliction)
  -- we just realized we don't have an affliction we thought we did, likely a false predict or hidden check
  for k,v in pairs(whr.status.affs) do
    if v == affliction then
      table.remove(whr.status.affs, k)
    end
  end
  if affliction == "stun" or affliction == "paralysis" or affliction == "fallen" or string.find(affliction, "writhe") then
    whr.waiting.queue = false
    whr.waiting.balance = false
    whr.waiting.equilibrium = false
  end
  if not affliction:find("pre_restore") then
    whr.parry()
  end
end

function whr.affCount(afftype)
  -- we want to count affs we have of a given type
  -- physical, mental, all

end