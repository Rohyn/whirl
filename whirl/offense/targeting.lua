
whr.target_list = {}
whr.target_index = 1
whr.target_search = false

function whr.pickTarget()
  if #whr.target_list < 1 then
    -- we have no targets
    whr.message("No target list!", "echo")
  else -- we do have targets in the list
    whr.target_index = 1
    whr.target_search = true
    whr.getTarget()
  end
end

function whr.getTarget()
  if whr.target_index > #whr.target_list then
    -- we've run out of targets to try for
    whr.target_search = false
    whr.target_index = 1
    whr.message("No more targets!", "echo")
  else
    whr.send("qa "..whr.target_list[whr.target_index])
  end
end