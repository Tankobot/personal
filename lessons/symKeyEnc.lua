--XOR Encryption Method 

local arg = {...}
assert(#arg==2, "Usage: xor <string> <key>")

local bit = bit32
local oldStr = arg[1]
local newStr = ""
local masterKey = arg[2]
local key = masterKey

local strChar
local keyChar
local newChar

while #oldStr>0 do
	if #key==0 then
		key = masterKey
	end
	strChar = string.byte(string.sub(oldStr, 1, 1))
	keyChar = string.byte(string.sub(key, 1, 1))
	oldStr = oldStr:sub(2, -1)
	key = key:sub(2, -1)
	newChar = bit.bxor(strChar, keyChar)
	newStr = newStr..string.char(newChar)
end

print(newStr)
return newStr