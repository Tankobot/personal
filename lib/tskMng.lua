--[[
Title: Task Manager Library
--]]

function new(value, mode)
	assert(type(value)=="number", "The value agument should be a number.")
	if mode then 
		assert(type(mode)=="string", "The mode argument must be a string.")
		--TODO
	else
		mode = 0
	end
end