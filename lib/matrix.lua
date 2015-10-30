--[[
Title: Matrix Library 
Author: Tankobot (Michael Bradley) 
--]] 

local matrix = {}
local version = "1.0.13"

<<<<<<< HEAD
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
=======
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
>>>>>>> origin/HEAD
	--TODO
end