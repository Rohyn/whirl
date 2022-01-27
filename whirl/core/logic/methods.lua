
whr.method_priority = {
{balance = "special", func = function(current) whr.do_special(current) end},
{balance = "needy", func = function(current) whr.do_needy(current) end},
{balance = "tattoo", func = function(current) whr.do_tattoo(current) end},
{balance = "takey", func = function(current) whr.do_takey(current) end},
{balance = "eat", func = function(current) whr.do_eat(current) end},
}

function whr.do_lighting()
  if whr.canCast() and not whr.status.pipes_lit and not whr.waiting.lighting then
    whr.light_up()
  end
end

function whr.light_up()
  whr.send("light pipes")
  whr.waiting.lighting = true
  DoAfter(whr.delay(), [[whr.waiting.lighting = false]])
end

function whr.do_fitness()
  if whr.canCast() and whr.canFitness() and whr.needFitness() then
    whr.send("fitness"..whr.sep.."smoke yarrow"..whr.sep.."apply epidermal"..whr.sep.."eat opiate")
    whr.waiting.balance = true
    DoAfter(whr.delay(), [[whr.waiting.balance = false]])
  end
end

function whr.do_rage()
  if whr.canRage() and whr.needRage() then
    whr.send("rage")
    whr.waiting.rage = true
    DoAfter(whr.delay(), [[whr.waiting.rage = false]])
  end
end

function whr.do_special(current)
  if whr.defenses[current] ~= nil then
    if current == "fangbarrier" and whr.haveAff("slickness") then
      return
    else
      if not whr.contains(whr.status.defs, current) and whr.contains(whr.defs_wanted, current) then
        whr.send(whr.defenses[current].balance.special)
        table.insert(whr.defs_waiting, current)
      end
    end
  end
end

function whr.do_needy(current)
  if whr.canCast() then
    if whr.defenses[current] ~= nil then
      if not whr.contains(whr.status.defs, current) and whr.contains(whr.defs_wanted, current) then
        whr.send(whr.defenses[current].balance.needy)
        table.insert(whr.defs_waiting, current)
      end
    end
  end
end

function whr.do_takey(current)
  if whr.canCast() and not whr.contains(whr.status.defs, current) and whr.contains(whr.defs_wanted, current) then
    if whr.class == "Teradrim" and current:find("swelter") then
      if not table.isMember(gmcp.Room.Info.details, "sandy") then
        whr.send("sand flood")
      end
    end        
    whr.send(whr.defenses[current].balance.takey)
    table.insert(whr.defs_waiting, current)
    whr.waiting.balance = true
    DoAfter(whr.delay(), [[whr.waiting.balance = false]])
    whr.waiting.equilibrium = true
    DoAfter(whr.delay(), [[whr.waiting.equilibrium = false]])
  end
end

function whr.do_tattoo(current)
  if whr.canCast() and not whr.contains(whr.status.defs, current) and whr.contains(whr.defs_wanted, current) then
    whr.send("touch "..whr.defenses[current].balance.tattoo.." tattoo")
    table.insert(whr.defs_waiting, current)
    whr.waiting.equilibrium = true
    DoAfter(whr.delay(), [[whr.waiting.equilibrium = false]])
  end
end

function whr.do_eat(current)
  if whr.defenses[current] ~= nil then
    if not whr.contains(whr.status.defs, current) and whr.contains(whr.defs_wanted, current) and whr.canEat() then
      whr.send("eat "..whr.defenses[current].balance.eat)
      table.insert(whr.defs_waiting, current)
    end
  end
end