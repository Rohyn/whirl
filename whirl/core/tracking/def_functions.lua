
-- functions related to tracking what afflictions we have

function whr.defGain(defense)
  -- we just gained a new affliction, probably saw the 'You are now X' line
  whr.message("You: GAIN "..defense..".", "def")
  whr.defHave(defense)
end

function whr.defHave(defense)
  -- we just realized we have an affliction that may not be new, such as something hidden or a voyria tick
  table.insert(whr.status.defs, defense)
  if whr.contains(whr.less_defs, defense) and whr.contains(whr.defs_wanted, defense) then
    for i in pairs(whr.less_defs) do
      if whr.less_defs[i] == defense then
        table.remove(whr.less_defs, i)
      end
    end
    for h in pairs(whr.defs_wanted) do
      if whr.defs_wanted[h] == defense then
        table.remove(whr.defs_wanted, h)
      end
    end
  end
end

function whr.defDef(defense)
  -- we have sent DEF and found a line
  if whr.toggles.gags then
    if whr.defenses[defense] then
      deleteLine()
      cecho("\n"..defense)
      whr.defHave(defense)
    end
  end
end

function whr.defTake(defense)
  -- we just cured an affliction, probably saw the 'You are no longer X' line
  whr.message("You: LOSE "..defense..".", "def")
  whr.defRemove(defense)
end

function whr.defRemove(defense)
  -- we just realized we don't have an affliction we thought we did, likely a false predict or passed hidden check
  for k,v in pairs(whr.status.defs) do
    if v == defense then
      table.remove(whr.status.defs, k)
      if v == "conjoin" then
        whr.waiting.queue = false
        whr.waiting.balance = false
        whr.waiting.equilibrium = false
      end
    end
  end
end

function whr.goggleUpdate()
  local goggle_defenses = {
    --heatsight = {level = 1, non_goggle_method = {takey = "heatsight"}, non_goggle_skill = "Heatsight"},
    nightsight = {level = 1, non_goggle = {special = "nightsight"} , non_goggle_skill = "Nightsight"},
    mindseye = {level = 2, non_goggle = {takey = "touch allsight"}, non_goggle_skill = "Generic"},
    thirdeye = {level = 2, non_goggle = {eat = "acuity"}, non_goggle_skill = "Generic"},
    overwatch = {level = 5, non_goggle = {""}, non_goggle_skill = "Generic"},
    insight = {level = 8, non_goggle = {takey = "mind insight on"}, non_goggle_skill = "Insight"},
    lifevision = {level = 9, non_goggle = {takey = "lifevision"}, non_goggle_skill = "Lifevision"},
    lipreading = {level = 17, non_goggle = {takey = "lipread"}, non_goggle_skill = "Lipread"},
  }
  for k, v in pairs(goggle_defenses) do
    if tonumber(whr.toggles.goggle_level) >= v.level and whr.toggles.goggles then
      whr.def_options.general_defs[k] = "on"
      whr.defenses[k].skill = "Goggle"
      if k:find("mindseye") then
        whr.defenses[k].balance = {special = "goggle toggle mindseye"}
      else
        whr.defenses[k].balance = {special = "goggle toggle "..k}
      end
    else
      whr.defenses[k].balance = goggle_defenses[k].non_goggle
      whr.defenses[k].skill = goggle_defenses[k].non_goggle_skill
    end
  end
end 