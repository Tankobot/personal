--#lib
--[[
Title: Bank API 
Description: List of functions that the bank will commonly use to manage account information. 
--]]

local function add(argList)
	assert(#argList >= 3, "Not enough parameters.")
	user = argList[2] --User var
	amount = tonumber(argList[3]) --Amount var
	assert(type(amount) == "number", "Amount is not a number.")
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
	logWrite = fs.open("history/"..user..".log","a")
	logWrite.writeLine(user)
	logWrite.writeLine("Add: "..amount)
	logWrite.writeLine("Balance: "..balance+amount)
	day = os.day()
	tick = os.time()
	logWrite.writeLine("Day: "..day)
	logWrite.writeLine("Tick: "..tick)
	logWrite.writeLine() --Adding space before hashes. 
	logWrite.writeLine(string.rep("#",10))
	logWrite.writeLine() --Adding space after hashes. 
	logWrite.close()
end

local function sub(argList) 
	assert(#argList >= 3, "Not enough parameters.")
	user = argList[2] --User var
	amount = tonumber(argList[3]) --Amount var
	f_flag = argList[4] --Check for -f flag 
	assert(type(amount) == "number","Amount is not a number.")
	assert(amount > 0, "Amount needs to be greater than zero.")
	assert((f_flag == "-f") or (not f_flag),"You're a dummy!")
	if f_flag == "-f" then 
		f_flag = true 
	end
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
	logWrite = fs.open("history/"..user..".log","a")
	logWrite.writeLine(user)
	logWrite.writeLine("Sub: "..amount)
	logWrite.writeLine("Balance: "..balance-amount)
	day = os.day()
	tick = os.time()
	logWrite.writeLine("Day: "..day)
	logWrite.writeLine("Tick: "..tick)
	logWrite.writeLine() --Adding space before hashes. 
	logWrite.writeLine(string.rep("#",10))
	logWrite.writeLine() --Adding space after hashes. 
	logWrite.close()
end

--User1 sends money to user2. 
local function trans(argList)
	user1 = argList[2]
	user2 = argList[3]
	amount = tonumber(argList[4])
	f_flag = argList[5]
	assert(#argList >= 4, "Not enough parameters.")
	assert(user1, "Sender is not specified.")
	assert(user2, "Reciever is not specified.")
	assert(amount, "Amount is not specified.")
	assert(type(amount)=="number", "Amount is not a number.")
	subTab = {
		"sub",
		user1,
		amount,
		f_flag
	}
	addTab = {
		"add",
		user2,
		amount
	}
	do --Logging chunk. 
		local user1File = fs.open("history/"..user1..".log","a")
		user1File.writeLine("Transfer from "..user1.." to "..user2..":")
		user1File.close()
		local user2File = fs.open("history/"..user2..".log","a")
		user2File.writeLine("Transfer from "..user1.." to "..user2..":")
		user2File.close()
	end
	add(addTab)
	sub(subTab)
end

bank = {
	add = add,
	sub = sub,
	trans = trans
}

return bank 
