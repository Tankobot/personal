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
	local threads = admin.listGet()
	for i=1, #threads do 
		check = coroutine.status(task[threads[i]])
		if check == "dead" then
			task[threads[i]] = nil
		end
	end
end

--Function to add coroutines to task list. 
function admin.add(path, name)
	local newFunc = loadfile(path)
	assert(name ~= "master", "Tried to create thread with reserved name", 0)
	if not task[name] then
		task[name] = coroutine.create(newFunc)
	else
		error("A thread with name "..name.." already exists.", 0)
	end
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

--Protected version of admin.run function. 
function admin.prun(coro, ...)
	local arg = {...} 
	local result = {coroutine.resume(coro, unpack(arg))}
	local dump = table.remove(result, 1)
	local eventType = table.remove(result, 1)
	return dump, eventType, result
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

--Sets the current event object from an admin command. 
function admin.event(...)
	event = {...}
end

--Allows the admin to load a custom chunk. 
function admin.loadString(block)
	local f = loadstring(block)
	f()
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
	decision, extra = admin.run(task.master, "taskManager", 
	current, unpack(event))
	if decision == "true" then 
		eType, extra = admin.run(task[current], unpack(event))
	elseif decision == "admin" then 
		admin[extra[1]](unpack(extra, 2))
	elseif decision == "false" then 
		eType, extra = admin.run(task[current], "false")
	else 
		error("\""..decision.."\" is not a proper condition for event checking.")
	end
end
