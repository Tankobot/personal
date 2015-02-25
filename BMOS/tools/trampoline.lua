--[[
Title: Trampoline Launcher 
Author: Tankobot (Michael Bradley) 
--]] 

local gui = os.loadlib("os/gui.lua")

local back = gui.createSet()
local icon = gui.createSet()

back:img(1,1)
bTime = back:add(1,1,4,1)