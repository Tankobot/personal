--[[
Name: The Master 
Version: 0.0 
--]]

--Create Clock 
function clockIt(interval) 
	alarmTime = 24000/os.time-(24000%os.time())
	os.setAlarm(alarmTime+200)
	event = os.pullEvent()
	--TODO
end
