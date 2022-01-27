
function whr.loadTargets(area)
  whr.area_found = false
  whr.possible_targets = {}
  whr.possible_items = {}
  if whr.areas[area] ~= nil then
    whr.bashing.target_type = "long"
    whr.possible_targets = whr.areas[area].targets
    Note("Targets loaded!")
  else
    Note("No targets loaded.")
  end
end

function whr.bashingFunction()
  if not whr.room_clear then return end
  if not whr.waiting.queue then
    if not whr.bashing.targeted then
      whr.runBasher()
    else
      battack = "none"
      if not whr.counterattack_active then
        if whr.class_list[whr.status.class] ~= nil then
          whr.class_list[whr.status.class]()
        end
      end
      if tonumber(whr.toggles.gauntlet_level) >= 2 then battack = battack..whr.sep.."absorb ylem" end
      if battack ~= whr.last_attack and whr.ylem_mist == false then
        whr.last_attack = battack
        whr.send("qeb stand"..whr.sep..whr.last_attack)
        whr.waiting.queue = true
        DoAfter(whr.delay(), [[whr.waiting.queue = false]])
      end
    end
  end
end

function whr.runBasher()
  whr.gathering = {}
  whr.bashing.targeted = false
  whr.bashing.target_priority = 10000
  whr.bashing.target = "none"
  for item in pairs(whr.status.room_items) do
    if item == "some gold sovereigns" and #whr.status.room_items[item] >= 1 then
      table.insert(whr.gathering, "sovereigns")
    elseif
      (string.find(item, "the corpse of") and not string.find(item, "staked")) or
      whr.contains(whr.possible_items, item) or
      whr.contains(whr.global_items, item)
    then
      for id in pairs(whr.status.room_items[item]) do
        table.insert(whr.gathering, whr.status.room_items[item][id])
      end
    elseif
      (whr.contains(whr.possible_targets, item) or whr.contains(whr.global_targets, item)) and
      #whr.status.room_items[item] >= 1
    then
      for targ in pairs(whr.possible_targets) do
        if whr.possible_targets[targ] == item and targ < whr.bashing.target_priority then
          whr.bashing.targeted = true
          if whr.toggles.generics then
            whr.bashing.target = generic_bashing_name(whr.possible_targets[targ])
            if whr.bashing.target ~= whr.bashing.old_target then
              if whr.toggles.calling then whr.send("wt target: "..whr.bashing.target) end
              whr.bashing.old_target = whr.bashing.target
            end
          else
            whr.bashing.target = whr.status.room_items[item][1]
            whr.bashing.target_priority = targ
          end   
        end
      end
      for targ in pairs(whr.global_targets) do
        if whr.global_targets[targ] == item and targ < whr.bashing.target_priority then
          whr.bashing.targeted = true
          whr.bashing.target = whr.status.room_items[item][1]
          whr.bashing.target_priority = targ
        end        --if
      end      --for
    end    --elseif
  end  --for
  if not whr.bashing.targeted then
    -- we did not find a target
    whr.toggles.bashing = false
    whr.updateToggles() -- save new settings
    --if whr.bot.going then
    --  whr.botMove()
    --end
  else
    whr.counterattack_active = false
    if whr.toggles.calling and whr.bashing.old_target ~= whr.bashing.target and whr.bashing.target ~= "none" then
      whr.send("wt target: " .. whr.bashing.target)
    end
  end
  whr.core()
end

function whr.doLoot()
  if #whr.gathering >= 1 then
    if whr.canCast() and not whr.waiting.loot then
      whr.lootIt()
    end
  end
end

function whr.lootIt()
  for i in ipairs(whr.gathering) do
    whr.send("get "..whr.gathering[i])
  end
  whr.gathering = {}
end