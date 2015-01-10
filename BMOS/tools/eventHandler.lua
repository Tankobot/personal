--[[
Title: Computercraft Task Manager 
Author: Tankobot 
Version: 0.1 
--]]

arg = {...}
assert(arg[1],"Usage: program <path>")

--Open program from argument as coroutine and specify it as the master coroutine. 
masterFunc = loadfile(arg[1])


--Create the task table and add the master coroutine to it. 
local task = {}
task["master"] = coroutine.create(masterFunc)


--Create admin table. 
--[[ Allows the task manager to add a coroutine to the list of running coroutines. ]]-- 
local admin = {}

function admin.add(path, name)
	local newFunc = loadfile(path)
	assert(name ~= "current", "Tried to create thread with reserved name",0)
	task[name] = coroutine.create(newFunc)
end

function admin.run(coro, ...)
	local arg = {...} 
	local result = {coroutine.resume(coro, unpack(arg))}
	local dump = table.remove(result, 1)
	local eventType = table.remove(result, 1)
	if not dump then 
		error(eventType, 0)
	end
	return eventType, result
end

function admin.addR(path, name, ...)
	admin.add(path, name)
	local arg = {...}
	return admin.run(task[name], unpack(arg))
end

function admin.exit()
	error("Closing task manager...", 0)
end

function admin.current(newTask)
	if newTask then 
		task.current = newTask
	else
		return task.current
	end
end


--Starting master program. 
eType, extra = admin.run(task.master, "info", "master")
while true do
	if eType == "admin" then --Checking for admin commands. 
		admin[extra[1]](unpack(extra, 2))
	end
	if coroutine.status(task.master) == "dead" then 
		error("Master thread is now dead.", 0)
	else
		event = {os.pullEvent()}
	end
	eType, extra = admin.run(task.master, unpack(event))
end
