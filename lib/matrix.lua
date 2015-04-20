--[[
Title: Matrix Library 
Author: Tankobot (Michael Bradley) 
--]] 

local matrix = {}
local version = "1.0.13"

local function matrix:create(dim) --Create matrix object. 
	local obj = {}
	local obj["index"] = {}
	local obj["data"] = {}
	local obj["type"] = "Matrix: "..version
	local obj["dim"] = dim
end

local function matrix:getIndex(dim) --Retrieve index of all objects based on a certain dimension. 
	--TODO
end

local function matrix:index(entry, ...) --Assign an object to the indexes of the matrix. 
	local arg = {...}
	self[arg[1]]--TODO
end

local function matrix:set(entry, ...) --Set data object in matrix. (...) must have #arguments equal to of dims. 
	--TODO
end