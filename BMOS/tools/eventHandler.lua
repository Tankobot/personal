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
local admin = {}

--Function to set the currently running task. 
function admin.current(newTask)
	if newTask then 
		current = newTask
	else
		return current
	end
end

--Function to get the list of currently open threads. 
function admin.listGet()
	local task_info = {}
	local count = 1
	for i, v in pairs(task) do 
		task_info[count] = i 
		count = count+1
	end
	return task_info
end

--Function to collect and delete finished/dead threads. 
function admin.garbage()
	--TODO
end

--Function to add coroutines to task list. 
function admin.add(path, name)
	local newFunc = loadfile(path)
	assert(name ~= "current", "Tried to create thread with reserved name",0)
	task[name] = coroutine.create(newFunc)
end

--Function to run coroutines and retrieve and perform small processing on outputs. 
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

--Combined function of admin.add and admin.run. 
function admin.addR(path, name, ...)
	admin.add(path, name)
	local arg = {...}
	return admin.run(task[name], unpack(arg))
end

--Closes the task manager. 
function admin.exit()
	error("Closing task manager...", 0)
end


--Starting master program. 
eType, extra = admin.run(task.master, "info", "master")
admin.current("master")
while true do
	if (eType == "admin") and (current == "master") then 
		admin[extra[1]](unpack(extra, 2))
	end
	if coroutine.status(task.master) == "dead" then 
		error("Master thread is now dead.", 0)
	else
		event = {os.pullEvent()}
	end
	eType, extra = admin.run(task[current], unpack(event))
end
