--[[
Title: Matrix Library 
Reason: Lua does not natively support matrices without excessive programming. 
Author: Tankobot (Michael Bradley) 
--]] 

local function bool(a, ...)
	if a then
		return true, bool(...)
	elseif a == nil then
		return false
	end
end

local meta = {}
local matrix = {}
local mt = matrix
local eval = luaL_dostring

function a.create(dim) --Create matrix object. 
	--TODO
end

function mt:getIndex(dim) --Retrieve index of all objects based on a certain dimension. 
	--TODO
end

function mt:index(entry, ...) --Add an object to the indexes of the matrix. 
	local arg = {...}
	local num
	local function check(tab1, tab2, i)
		
	end
	assert(#arg==#self.dim, "The number of indexes is not equal to the number of arguments.")
	--TODO
end

function mt:set(entry, ...) --Set data object in matrix. must have #arguments equal to of dims. 
	--TODO
end