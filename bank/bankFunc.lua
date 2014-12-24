--#lib
--[[
Title: Bank API 
Description: List of functions that the bank will commonly use to manage account information. 
--]]

local function add(argList)
	assert(#argList < 3, "Not enough parameters.")
	user = arg[2] --User var
	amount = arg[3] --Amount var
	assert(type(amount) == "number","Amount is not a number.")
	assert(amount > 0, "Amount needs to be greater than zero.")
	--Open user file for reading. 
	userRead = fs.open("users/"..user..".dat","r")
	userRead.readLine() --Amount is stored on second line. 
	balance = userRead.readLine() --Balance var 
	balance = tonumber(balance)
	userRead.close()
	--Open user file for writing. 
	userWrite = fs.open("users/"..user..".dat","w")
	userWrite.writeLine(user)
	userWrite.writeLine(balance+amount)
	userWrite.close()
	--Logging transaction. 
	logWrite = fs.open("history/"..user..".log","r")
	logWrite.writeLine(user)
	logWrite.writeLine("Add: "..amount)
	logWrite.writeLine("Balance: "..balance+amount)
	day = os.day()
	tick = os.time()
	logWrite.writeLine("Day: "..day)
	logWrite.writeLine("Tick: "..tick)
	logWrite.writeLine() --Adding space before hashes. 
	logWrite.writeLine(string.rep("#",10)
	logWrite.writeLine() --Adding space after hashes. 
	logWrite.close()
end

local function sub(argList) 
	assert(#argList < 3, "Not enough parameters.")
	user = arg[2] --User var
	amount = arg[3] --Amount var
	f_flag = arg[4] --Check for -f flag 
	assert(type(amount) == "number","Amount is not a number.")
	assert(amount > 0, "Amount needs to be greater than zero.")
	assert((f_flag == "-f") or (not f_flag),"Your a dummy!")
	if f_flag == "-f" then; f_flag = true; end
	--Open user file for reading. 
	userRead = fs.open("users/"..user..".dat","r")
	userRead.readLine() --Amount is stored on second line. 
	balance = userRead.readLine() --Balance var 
	balance = tonumber(balance)
	userRead.close()
	--Open user file for writing. 
	if balance-amount<0 then
		assert(f_flag == true,"Subtracting amount will result in balance less than zero. Use flag <-f> after command.")
	end
	userWrite = fs.open("users/"..user..".dat","w")
	userWrite.writeLine(user)
	userWrite.writeLine(balance-amount)
	userWrite.close()
	--Logging transaction. 
	logWrite = fs.open("history/"..user..".log","r")
	logWrite.writeLine(user)
	logWrite.writeLine("Sub: "..amount)
	logWrite.writeLine("Balance: "..balance-amount)
	day = os.day()
	tick = os.time()
	logWrite.writeLine("Day: "..day)
	logWrite.writeLine("Tick: "..tick)
	logWrite.writeLine() --Adding space before hashes. 
	logWrite.writeLine(string.rep("#",10)
	logWrite.writeLine() --Adding space after hashes. 
	logWrite.close()
end

bank = {
	add = add,
	sub = sub
}

return bank 
