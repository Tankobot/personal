--[[
Title: Encode
Author: Michael Bradley (Tankobot)
Description: A function that should be used to encrypt a file or string of text. 
Make sure your text only includes characters specified in the alphabet. 
--]]

arg = {...}
file = arg[1]

alpha = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
function cutUp(oldString) 
  local newString = ""
  local newTable = {}
  for i=1,string.len(oldString) do
    newString = string.sub(oldString,i,i+1)
    newTable[i] = newString
  end
  return newTable
end
