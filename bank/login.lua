--Simple Program to Allow Tellers to Login. 

while true do 
	term.clear()
	term.setCursorPos(1,1)
	print("//BankLogin//")
	local start = nil
	write("Username:")
	local user = read()
	write("Password:")
	local pass = read("")
	if user == "new" then 
		print("Please right-click the sensor above the computer to sign in.")
		local event, info = os.pullEvent("player")
		if fs.exists("user/"..info) then 
			print("Account already exists. Contact DLA for support.")
		else
			while not check do 
				write("RePass:")
				checkpass = read("")
				if pass == checkpass then 
					print("New account created under, "..info) 
				else 
					term.clear()
					term.setCursorPos(1,1)
					print("Passwords did not match.")
				end
			end
			local file = fs.open("user/"..info, "w")
			file.write([[-- #]]..newpass.."\nfunction func()\n"..
				"dofile('perm/default',"..info..")\n"..
				"end")
			file.close()
		end
	else
		file = fs.open("/user/"..user, "r")
		if file then 
			linePass = file.readLine()
			linePass = string.sub(linePass, string.find(linePass, "#")+1)
			if pass == linePass then 
				func = loadfile("/user/"..user)
				start = func()
			else
				print("Failed to login.")
			end
		else
			print("Failed to login.")
		end
		pcall(start)
	end
end
