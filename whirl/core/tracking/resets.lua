
function whr.resetMe()
  whr.status = whr.base_status
  for i in pairs(whr.balance) do
    whr.balance[i] = true
  end
  whr.setStatus()
end

function whr.setStatus()
  -- this should run when we change or fetch our class for any reason
  whr.status.class = gmcp.Char.Status.class
  -- store city
  if gmcp.Char.Status.city == "none" then
    whr.status.city = "no city"
  else
    whr.status.city = gmcp.Char.Status.city
  end
  -- set tether
  if whr.status.city == "Spinesreach" or whr.status.city == "Bloodloch" then
    whr.status.tether = "shadow"
  elseif whr.status.city == "Enorian" or whr.status.city == "Duiran" then
    whr.status.tether = "spirit"
  else
    whr.status.tether = "neutral"
  end
  -- class defenses
  if whr.status.class == "Luminary" then
    whr.defenses.constitution = whr.alternative_class_defenses.Luminary_constitution
  elseif whr.status.class == "Earthcaller" then
    whr.defenses.constitution = whr.alternative_class_defenses.Earthcaller_constitution
  elseif whr.status.class == "Syssin" then
    whr.defenses.shroud = whr.alternative_class_defenses.Syssin_shroud
  elseif whr.status.class == "Carnifex" then
    whr.defenses.shroud = whr.alternative_class_defenses.Carnifex_shroud
  elseif whr.status.class == "Warden" then
    whr.defenses.shroud = whr.alternative_class_defenses.Warden_shroud
    whr.defenses.fearless = whr.alternative_class_defenses.Warden_fearless
  elseif whr.status.class == "Indorani" or whr.status.class == "Oneiromancer" then
    whr.defenses.shroud = whr.alternative_class_defenses.Indorani_shroud
  elseif whr.status.class == "Revenant" then
    whr.defenses.maingauche = whr.alternative_class_defenses.Revenant_maingauche
  elseif whr.status.class == "Sciomancer" then
    whr.send("qeb channel shadow")
  else
    -- support artifact shroud
    whr.defenses.shroud = whr.alternative_class_defenses.Artifact_shroud
  end
  whr.loadDef("none")
end

function whr.noTarget()
  -- we've gotten a line saying what we were trying to hit isn't there anymore
  if whr.toggles.attacking then
    -- we were trying to attack a player
    -- handle player reset logic
  end
  if whr.toggles.bashing then
    -- we were trying to hit a denizen
    -- handle bashing reset logic
  end
end