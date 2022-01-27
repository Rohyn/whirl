
-- functions related to system messaging

function whr.message(string, msgtype)
  local line = "\n"
  if msgtype == "toggle" or msgtype == "echo" then
    line = ""
  end
  Note(line..string)
end
