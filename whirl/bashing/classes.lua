
function whr.archivistBash()
  hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
  local bioessence = tonumber(gmcp.Char.Vitals.bio) 
  if hp <= 70 and bioessence > 0 and whr.haveSkill("Knitting") and not whr.haveDef("knitting") then
    battack = "bio knitting"
  --elseif hp <= 60 and bioessence > 1 then
  --  battack = "bio ethereal"
  else
    if bioessence > 1 and whr.haveSkill("Stimulant") then
      battack = "incite crux "..whr.bashing.target..whr.sep.."bio stimulant"
    else
      battack = "incite crux " ..whr.bashing.target
    end
  end
end

function whr.sciomancerBash()
  if whr.haveSkill("Fever") then
    if tonumber(gmcp.Char.Vitals.shadowprice) < 2 then
      battack = "shadowprice fever "..whr.bashing.target
    else
      battack = "cast fever "..whr.bashing.target
    end
  else
    if whr.haveSkill("Shadowprice") and tonumber(gmcp.Char.Vitals.shadowprice) < 2 then
      battack = "shadowprice ruin "..whr.bashing.target
    else
      battack = "cast ruin "..whr.bashing.target
    end
  end
end

function whr.revenantBash()
  hp = 100*(gmcp.Char.Vitals.hp/gmcp.Char.Vitals.maxhp)
  if whr.wielding("shield") then
    -- we're wielding a shield in at least one hand
    battack = "rivebash "..whr.bashing.target
  elseif whr.status.wielded.id == whr.status.wielded.right.id then
    -- we are wielding a 2h weapon
    battack = "fell "..whr.bashing.target
  else
    -- we are hopefully wielding two 1h weapons
    battack = "dpl "..whr.bashing.target
  end
  if hp > 60 then
    battack = battack.." duskosa duskosa"
  else
    battack = "annul left"..whr.sep.."annul right"..whr.sep..battack
  end
end

function whr.syssinBash()
  battack = ""
  if whr.haveSkill("Garrote") then
    if not whr.wielding("whip") then
      battack = "quickwield left whip"..whr.sep
    end
    battack = battack.."garrote "..whr.bashing.target
  else
    if not whr.wielding("dirk") and not whr.wielding("dagger") then
      battack = "quickwield left dirk"..whr.sep
    end
    battack = battack.."stagger "..whr.bashing.target
  end
end

function whr.shifterBash()
  battack = "combo "..whr.bashing.target.." slash slash"
end