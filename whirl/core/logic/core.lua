
-- the meat and potatoes logic of the entire system
function whr.core()
  if whr.toggles.active then
    --whr.defCheck()
    --whr.playerCheck()
    if not whr.stunned() then
      if whr.canCast() then
        if whr.status.empty_pipe ~= "none" and not whr.waiting.lighting then
          whr.send("outc "..whr.status.empty_pipe..whr.sep.."put "..whr.status.empty_pipe.." in emptypipe")
          whr.waiting.lighting = true
          DoAfter(whr.delay(), [[whr.waiting.lighting = false]])
        end
      end
      whr.doQueue()
      whr.doStuff()
    end
  end
end

-- this function should build a list of all the actions we want the system to take
function whr.doQueue()
  whr.queue = {}
  if whr.toggles.active then
    if not whr.status.pipes_lit and whr.toggles.lighting then
      table.insert(whr.queue, "lighting")
    end
    if whr.toggles.attacking then
      table.insert(whr.queue, "attack")
    end
    if whr.toggles.bashing then
      table.insert(whr.queue, "bashing")
    end
    if #whr.gathering >= 1 then
      table.insert(whr.queue, "loot")
    end
    if whr.moving_to ~= "none" then
      table.insert(whr.queue, "movement")
    end
    if whr.needFitness() then
      table.insert(whr.queue, "fitness")
    end
    if whr.needRage() then
      table.insert(whr.queue, "rage")
    end
    for _, k in pairs(whr.defs_wanted) do
      if not whr.contains(whr.status.defs, k) then
        if k == "shroud" or k == "ghost" or k == "hiding" then
          if not whr.haveDef("phased") then
            table.insert(whr.queue, k)
          end
        elseif k == "miasma" or k == "safeguard" or k == "warmth" then
          if not whr.haveDef("miasma") and
             not whr.haveDef("safeguard") and
             not whr.haveDef("warmth") then
            table.insert(whr.queue, k)
          end
        else
          table.insert(whr.queue, k)
        end
      end
    end
  end
end

-- now go through and call functions for each item in the queue
function whr.doStuff()
  for _,i in ipairs(whr.priorities) do
    if whr.contains(whr.queue, i) then
      if i == "lighting" then
        whr.do_lighting()
      elseif i == "attack" then
        whr.attackFunction()
      elseif i == "bashing" then
        whr.bashingFunction()
      elseif i == "loot" then
        whr.doLoot()
      elseif i == "movement" then
        whr.getMoving()
      elseif i == "fitness" then
        whr.do_fitness()
      elseif i == "rage" then
        whr.do_rage()
      else
        if whr.defenses[i] ~= nil then
          if not whr.contains(whr.defs_waiting, i) then
            for _,z in pairs(whr.method_priority) do
              if whr.defenses[i].balance[z.balance] ~= nil then
                z.func(i)
              end
            end
          end
        --else -- to add affs?
        end
      end
    end
  end
end