--Simple Program to Allow Tellers to Login. 

while true do 
	local start = nil
	write("Username:")
	local user = read()
	write("Password:")
	local pass = read("")
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
