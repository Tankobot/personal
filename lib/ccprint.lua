--[[
Title: Window Drawing API
Author: Tankobot (Michael Bradley) 
--]] 

--Window border function. 
local function create(x,y,w,h,screen) 
	bgColor = colors.white 
	txtColor = colors.black 
	bordColor = colors.black 
	if not screen then 
		screen = peripheral.wrap(screen)
	else 
		screen = term
	end
	obj = {
		bgColor = bgColor,
		txtColor = txtColor,
		bordColor = bordColor,
		isColor = screen.isColor()
	)
end