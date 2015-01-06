--[[
Title: Computercraft Event Handler 
Author: Tankobot 
Version: 0.1 
--]]

arg = {...}

--Open program from argument as coroutine and specify it as the master coroutine. 
masterPath = arg[1]
masterFunc = loadfile(masterPath)
masterCo = coroutine.create(masterFunc)

--Starting master program. 
eventType, extra = coroutine.resume(masterCo, "info", "master")
if eventType == "admin" then 
	eventType, extra = coroutine.resume(masterCo, false, "Not supported yet.")
end

--TODO