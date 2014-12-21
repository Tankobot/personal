--[[
Title: Bots Routing Software 
Author: Tankobot (Michael B) 
Description: A program to be continually run on one machine as to reroute rednet/botnet transmissions. 
--]]

os.loadAPI("comm")

write("Clock Speed: ")
clockSpeed = read()
if clockSpeed == "t" then 
	t=0.1
else 
	t=1/clockSpeed
end
term.clear()

print("Starting Router")
local modem = peripheral.wrap("top")
print()
write("Public or Private? ")
local input = read()

if input == "public" then 
	write("Please supply the key given to you by Bot's ISP: ")
	input = read()
	localUA = fs.open("machine/config/UA")
	comm.authUA(input,localUA.readAll())
	comm.sendCert(authedUA)
	certificate = comm.recieveCert("000.000.000.000",10)
	if certificate == true then
		print("Your router has been successfully verified. Make sure to renew your key at least once a week for security purposes.")
		sleep(t*20)
	elseif certificate == "used" then 
		error("The bank believes this Unique Address is already used.",0)
	else
		error("Your router was unable to authenticate itself with the bank. Try checking if you typed it in correctly, get a new key if your old one expired, or ask Tankobot and associates for support.",0)
	end
elseif input == "private" then
	write("Network key: ")
	local key = read()
	print()
	write("Is the key: "..key.." :y/n? ")
	input = read()
	if input == "y" then
		print("Key Confirmed.")
		local keyFile = fs.open("machine/config/key","w")
		keyFile.write(key)
		keyFile.close()
		print("Saved Key!")
		sleep(t)
		print([[Opening modem(s) attached to the computer...]])
		sleep(t)
	else
		print("Router startup cancelled!!!")
		sleep(t)
	end
else 
	error("That doesn't make any sense.",0)
end