--Pattern Analyzer 

local arg = {...} 
local bits = {}

local file = io.open(arg[1], "r") 

for line in file:lines() do 
	if not bits[line] then 
		bits[line] = 1 
	else 
		bits[line] = bits[line] + 1 
	end
end

for i, v in pairs(bits) do 
	print(i..": "..v) 
	if (not MIN) or (not MAX) then 
		MIN = v 
		MAX = v
	end
	if v < MIN then 
		MIN = v
	elseif v > MAX then 
		MAX = v
	end
end

print("Variance: "..(MAX-MIN))