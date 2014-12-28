--[[
This is the United Bank administrator shell. 
--]]

arg={...}
assert(arg[1], "No arguments have been given.")

--Specifying APIs by name. 
lib = "lib/"
apis = {
	"bankFunc.lua",
	"argSorter.lua"
}

--Loading required APIs. 
for i=1,#apis do
	correct = pcall(dofile,lib..apis[i])
	assert(correct,"The library "..apis[i].." did not load correctly or does not exist.")
end

--Check for the add command. 
if arg[1] == "add" then 
	bank.add(arg)
end

--Check for the sub command. 
if arg[1] == "sub" then 
	bank.sub(arg)
end

--Check for the transfer command. (i.e. tran) 
if arg[1] == "trans" then 
	bank.trans(arg)
end

--Check for the status command. 
if arg[1] == "status" then 
	bank.status(arg)
end
