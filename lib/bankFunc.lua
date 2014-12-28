--#lib
--[[
Title: Bank API 
Description: List of functions that the bank will commonly use to manage account information. 
--]]

local function hashLine(file)
	file.writeLine()
	file.writeLine(string.rep("#", 10))
	file.writeLine()
end

local function timeWrite(file)
	day = os.day()
	tick = os.time()
	file.writeLine("Day: "..day)
	file.writeLine("Tick: "..tick)
end	

local function log(path, user, amount, balance)
	logWrite = fs.open(path, "a")
	logWrite.writeLine(user)
	logWrite.writeLine("Add: "..amount)
	logWrite.writeLine("Balance: "..balance+amount)
	timeWrite(logWrite)
	hashLine(logWrite)
	logWrite.close()
end

local function readAccount(user)
	account = fs.open("users/"..user..".dat","r")
	account.readLine() --Amount is stored on second line. 
	balance = account.readLine() --Balance var 
	balance = tonumber(balance)
	account.close()
	return balance
end

local function writeAccount(user, balance, amount)
	account = fs.open("users/"..user..".dat","w")
	account.writeLine(user)
	account.writeLine(balance+amount)
	account.close()
end

local function add(argList)
	assert(#argList >= 3, "Not enough parameters.")
	user = argList[2] --User var
	amount = tonumber(argList[3]) --Amount var
	assert(type(amount) == "number", "Amount is not a number.")
	assert(amount > 0, "Amount needs to be greater than zero.")
	--Reading user dat file. 
	balance = readAccount(user)
	--Writing to dat file. 
	writeAccount(user, balance, amount)
	--Logging operation. 
	log("history/"..user..".log", user, amount, balance)
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
	balance = readAccount(user)
	--Open user file for writing. 
	if balance-amount<0 then
		assert(f_flag == true,"Subtracting amount will result in balance less than zero. Use flag <-f> after command.")
	end
	writeAccount(user, balance, amount*-1)
	--Logging transaction. 
	log("history/"..user..".log", user, amount, balance)
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
	check, msg = pcall(sub, subTab)
	if check == false then 
		local user1File = fs.open("history/"..user1..".log","a")
		timeWrite(user1File)
		user1File.writeLine("Transfer failed.")
		hashLine(user1File)
		user1File.close()
		local user2File = fs.open("history/"..user2..".log","a")
		timeWrite(user2File)
		user2File.writeLine("Transfer failed.")
		hashLine(user2File)
		user2File.close()
		error(msg,0)
	elseif check == true then 
		add(addTab)
	end
end

local function status()
	users = fs.list("users/")
	--logFile = fs.open("
	for i=1,#users do 
		file = fs.open("users/"..users[i], "r")
		name = file.readLine()
		balance = file.readLine()
		file.close()
		if (name) or (balance) then 
			print(name.."   "..balance)
		end
	end --TODO
end

bank = {
	add = add,
	sub = sub,
	trans = trans,
	status = status
}

return bank 
