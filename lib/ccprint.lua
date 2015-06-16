--[[
Title: Window Drawing API
Author: Tankobot (Michael Bradley) 
--]] 

--Window border function. 

ccprint = {obj={}}

local function create(x,y,w,h,screen,index) 
	bgColor = colors.white 
	txtColor = colors.black 
	bordColor = colors.black 
	if screen then 
		screen = screen
	else 
		screen = term
	end
	obj = {
		bgColor = bgColor,
		txtColor = txtColor,
		bordColor = bordColor,
		isColor = screen.isColor()
  }
	--screen.windows
end