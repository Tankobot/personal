--[[
Title: Encode
Author: Michael Bradley (Tankobot)
Description: A function that should be used to encrypt a file or string of text. 
Make sure your text only includes characters specified in the alphabet. 
--]]

arg = {...}

if #arg < 2 then
  error(0,"Encode usage: encode <string> <key> \[table\]")
end

file = arg[1]

if arg[3] ~= nil then 
  alpha = arg[3] 
else 
  alpha = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890~!@#$%^&*()-=_+"
  function cutUp(oldString) 
    local newString = ""
    local newTable = {}
    for i=1,string.len(oldString) do
      newString = string.sub(oldString,i,i+1)
      newTable[i] = newString
    end
    return newTable
  end
end

alpha = cutUp(alpha)

key = arg[2]

function encode() 
  --TODO
end
