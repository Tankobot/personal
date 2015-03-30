--Coin flip simulator that counts the coin tosses. 

local arg = {...} 

local file = io.open("coindata.dat", "w") 

for i=1, arg[1] do 
	local BYTE = {}
	for j=1, arg[2] do 
		BYTE[j] = math.random(0, 1) 
	end
	for piece = 1, #BYTE do 
		file:write(BYTE[piece])
	end
	file:write("\n")
end

file:close()