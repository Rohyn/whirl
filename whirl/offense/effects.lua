
function whr.venomEffect(person, venom)
  local aff = ""
  if venom == "epseth" then
    if whr.checkAff(person, "left_leg_broken") then
      aff = "right_leg_broken"
    else
      aff = "left_leg_broken"
    end
  elseif venom == "epteth" then
    if whr.checkAff(person, "left_arm_broken") then
      aff = "right_arm_broken"
    else
      aff = "left_arm_broken"
    end
  elseif venom == "prefarar" then
    if whr.checkAff(person, "hearing") then
      aff = "sensitivity"
    else
      aff = "hearing"
    end
  elseif venom == "oculus" then
    if whr.checkAff(person, "sight") then
      aff = "blurry_vision"
    else
      aff = "sight"
    end
  elseif venom == "cripple" then
    if whr.checkAff(person, "crippled") then
      aff = "crippled_body"
    else
      aff = "crippled"
    end
  elseif venom == "disrupt" then
    if whr.checkAff(person, "physical_disruption") then
      aff = "mental_disruption"
    else
      aff = "physical_disruption"
    end
  else
    for i in pairs(whr.effects) do
      if whr.effects[i] == venom then
        aff = i
      end
    end
  end
  return aff
end

whr.attacks = {
  ["Spirituality Strike"] = {"paresis"},
  ["Dhuriv Throatcrush"] = {"destroyed_throat"},
  ["Dhuriv Gouge"] = {"impatience"},
  ["Dhuriv Twirl"] = {"confusion"},
  ["Dhuriv Heartbreaker"] = {"heartflutter"},
  ["Dhuriv Slit"] = {"crippled_throat"},
  ["Dhuriv Slam"] = {"epilepsy", "laxity"},
  ["Geometrics Crescent"] = {"crescent"},
  ["Geometrics Pattern"] = {"patterns"},
  ["Numerology Madness"] = {"dementia", "hallucinations", "paranoia"},
  ["Bioessence Ethereal"] = {"ethereal"},
  ["Bioessence Infection"] = {"mutagen"},
}

whr.conditional_attacks = {
  ["Righteousness Contort"] = "affliction",
  ["Dhuriv Weaken"] = "limb",
}

whr.stage_attacks = {
  ["Dhuriv Crosscut"] = {"impairment", "addiction"},
  ["Dhuriv Blind"] = {"sight", "blurry_vision"}
}

whr.venom_attacks = {
  "Dhuriv Stab",
  "Dhuriv Slash",
  "Dhuriv Slice",
  "Dhuriv Thrust",
  "Dhuriv Flourish",
}