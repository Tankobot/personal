--[[
Title: Graphical User Interface API 
Description: A generic API that can be used in order to build a simple to complex user interface and handle events associated with such. 
--]]

local function draw(self) --Redraws the screen including any changes to the gui set. 
	--TODO
end

local function add(self, x, y, X, Y) --Allows for the addition of a new gui object into the set. 
	local button = {
		id = #self.obj+1,
		x = x,
		y = y,
		X = X,
		Y = Y
	}
	self.obj[id] = button
end

local function rm(self, id) --Allows for the removal of a gui object. 
	self.obj[id] = nil
end

local function set(self, id, text, bg, fg, cc) --Allows for the setting of a gui object. 
	self.obj[id].text = text
	self.obj[id].bg = bg
	self.obj[id].fg = fg
	self.obj[id].cc = cc --CC stands for Click Color. 
end

local function move(self, id, x, y) --Allows for the translocation of a gui object. 
end

local function clear(self) --Allows for the removal of all gui objects in a gui set without deleting the entire table itself. 
end

local function createSet() --Allows for the creation of a gui set. 
	local tab = {
		obj = {},
		draw = draw,
		add = add,
		rm = rm,
		set = set,
		move = move,
		clear = clear
	}
	return tab
end