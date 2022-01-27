
-- functions that should return true/false to check certain conditions

function whr.haveAff(affliction)
  if whr.contains(whr.status.affs, affliction) then
    return true
  elseif affliction == "paresis" and whr.contains(whr.status.affs, "paralysis") then
    -- paralysis does everything paresis does and more
    return true
  else
    return false
  end
end

function whr.haveDef(defense)
  if whr.contains(whr.status.defs, defense) then
    return true
  else
    return false
  end
end

function whr.wielding(weapon)
  if whr.weaponType(whr.status.wielded.left.name) == weapon or
     whr.weaponType(whr.status.wielded.right.name) == weapon then
    return true
  else
    return false
  end
end

function whr.prone()
  if gmcp.Char.Vitals.prone == "1" then
    return true
  else
    return false
  end
end

function whr.stunned()
  if whr.haveAff("stun") or
     whr.haveAff("petrified") or
     whr.haveAff("unconsciousness") or
     whr.haveAff("disabled") or
     whr.haveAff("asleep") then
    return true
  else
    return false
  end
end

function whr.entangled()
  if whr.haveAff("writhe_armpitlock") or
     whr.haveAff("writhe_bind") or
     whr.haveAff("writhe_grappled") or
     whr.haveAff("writhe_gunk") or
     whr.haveAff("writhe_hoist") or
     whr.haveAff("writhe_impaled") or
     whr.haveAff("writhe_lure") or
     whr.haveAff("writhe_necklock") or
     whr.haveAff("writhe_ropes") or
     whr.haveAff("writhe_stasis") or
     whr.haveAff("writhe_thighlock") or
     whr.haveAff("writhe_transfix") or
     whr.haveAff("writhe_vines") or
     whr.haveAff("writhe_web") then
    return true
  else
    return false
  end
end

function whr.canEat()
  if whr.haveAff("anorexia") or
     whr.haveAff("destroyed_throat") then
    return false
  else
    return true
  end
end

function whr.canSmoke()
  if whr.haveAff("asthma") then
    return false
  else
    return true
  end
end

function whr.canApply()
  if whr.haveAff("slickness") then
    return false
  else
    return true
  end
end

function whr.canTree()
  if whr.haveAff("paresis") or
     whr.haveAff("faulted") or
     whr.haveAff("tree_seared") then
    return false
  else
    return true
  end
end

function whr.canFocus()
  if whr.haveAff("muddled") or
     whr.haveAff("gloom") or
     whr.haveAff("impatience") then
    return false
  else
    return true
  end
end

function whr.canRenew()
  if whr.haveAff("impairment") then
    return false
  else
    return true
  end
end

function whr.canFitness()
  local fitness_classes = {
    "Templar",
    "Carnifex",
    "Monk",
    "Revenant",
    "Warden",
  }
  if not whr.haveAff("destroyed_throat") and
     whr.haveSkill("Fitness") and
     whr.balance.fitness and
     whr.contains(fitness_classes, whr.status.class) then
    return true
  else
    return false
  end
end

function whr.needFitness()
  if whr.haveAff("asthma") and whr.haveAff("anorexia") and whr.haveAff("slickness") and whr.haveAff("paresis") then
    return true
  else
    return false
  end
end

function whr.canRage()
  local rage_classes = {
    "Templar",
    "Revenant",
    "Shapeshifter",
  }
  if whr.haveSkill("Rage") and
     whr.balance.rage and
     whr.contains(rage_classes, whr.status.class) then
    return true
  else
    return false
  end
end

function whr.needRage()
  local rage_affs = {
    "hubris",
    "pacifism",
    "peace",
    "agony",
    "accursed",
    "limp_veins",
    "lovers_effect",
    "laxity",
    "superstition",
    "generosity",
    "justice",
    "magnanimity"
  }
  local rage_tally = 0
  for aff in pairs(whr.status.affs) do
    if whr.contains(rage_affs, aff) then
      rage_tally = rage_tally + 1
    end
  end
  if rage_tally >= 2 and gmcp.Char.Vitals.tree == "0" then
    return true
  else
    return false
  end
end

function whr.limbOK(side, limb)
  if whr.haveAff(side.."_"..limb.."_broken") or
     whr.haveAff(side.."_"..limb.."_damaged") or
     whr.haveAff(side.."_"..limb.."_mangled") or
     whr.haveAff(side.."_"..limb.."_amputated") then
    return false
  else
    return true
  end
end

function whr.canArms()
  if whr.limbOK("left", "arm") and
     whr.limbOK("right", "arm") then
    return true
  else
    return false
  end
end

function whr.canLegs()
  if whr.limbOK("left", "leg") and
     whr.limbOK("right", "leg") then
    return true
  else
    return false
  end
end

function whr.fullBalance()
  if gmcp.Char == nil then return false end
  if gmcp.Char.Vitals.balance == "1" and
     gmcp.Char.Vitals.equilibrium == "1" and
     not whr.waiting.balance and
     not whr.waiting.equilibrium then
    return true
  else
    return false
  end
end

function whr.canCast()
  if whr.fullBalance() and
     not whr.stunned() and
     not whr.haveAff("paralysis") and
     not whr.entangled() then
    return true
  else
    return false
  end
end