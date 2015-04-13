--Cross 

local arg = {...} 
local gam = {}
local tab = {}

local function draw(tab) 
	for i=1, #tab do 
		for j=1, #tab[i] do 
			io.write(tab[i][j].."|")
		end
		print()
	end
end

local function foil(...) 
	local arg = {...}
	local num = #arg
	assert(num > 1, "Not enough strings.")
	for i=1, num-1 do 
		local a, b = arg[i], arg[i+1] 
		--TODO
	end
end

--[[ ]]--

print("Cross: "..arg[1].." X "..arg[2])
print("Table: ")
draw(tab)