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

local function dist(...) 
	local result = {}
	local arg = {...}
	assert(#arg > 1, "Not enough strings.")
	for num=1, #arg-1 do 
		local a, b = arg[1], arg[2]
		for i=1, #a do 
			for j=1, #b do 
				result[#result+1] = a:sub(i,i)..b:sub(j,j)
				print(result[#result])
			end
		end
		table.remove(arg, 1)
		arg[1] = table.concat(
	end
	return table.concat(result, ";"), result
end

--[[ ]]--

print("Cross: "..arg[1].." X "..arg[2])
print("Table: ")
draw(tab)