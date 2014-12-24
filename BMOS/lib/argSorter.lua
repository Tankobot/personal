--#lib
--[[
Title: Argument Sorting Function 
Author: Tankobot (Michael Bradley) 
--]]

local function argSort(argA)
	local argB = {}
	local i=1
	while i < #argA do 
		if not string.fing("-",argA[i]) then 
			argB[tostring(argA[i])]=argA[i+1]
			i=i+3
			j=j+1
		else
			argB[j]=argA[i]
			i=i+1
			j=j+1
		end
	end
	return argB
end
