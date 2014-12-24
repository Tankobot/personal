--[[
This is the United Bank administrator shell. 
--]]

arg={...}

--Specifying APIs by name. 
lib = "usr/lib/"
apis = {
	"argSorter.lib"
}

--Loading required APIs. 
for i=1,#apis do
	assert(pcall(dofile(lib..apis[i])),"The library "..apis[i].." did not load correctly or does not exist.")
end

--Check for the add command. 
if arg[1] == "add" then 
	
end

--Check for the sub command. 
if arg[1] == "sub" then 
	
end

--Check for the transfer command. (i.e. tran) 
if arg[1] == "tran" then 
	
end

--Check for the status command. 
if arg[1] == "status" then 
	
end
