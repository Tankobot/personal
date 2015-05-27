--Cross 

local arg = {...} 
local gam = {}
local tab = {}
local _dump

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
	local dup = {...}
	local arg = {}
	if #dup == 1 then 
		for i=1, #dup[1]/2 do 
			arg[i] = dup[1]:sub(2*i-1,2*i)
		end
	else 
		arg = dup
	end
	for num=1, #arg-1 do 
		result = {}
		local a, b = arg[1], arg[2]
		for i=1, #a/num do 
			for j=1, #b do 
				result[#result+1] = a:sub(i,i+num-1)..b:sub(j,j)
			end
		end
		table.remove(arg, 1)
		arg[1] = table.concat(result)
	end
	return table.concat(result, ";"), result
end

local function index(tab, ...) 
	local arg = {...}
	for i=1, #arg do
		--TODO
	end
end

local function getIndex(tab)
	--Iterate over table in a diagonal order :: TODO
end

local function punnett(...)
	local arg = {...}
	assert(#arg<=2, "Only two gamete sets supported as of now.") 
	local i, j, num = 1, 1, 1
	local tab = {}
	--Infinitely Dimensional Index :: TODO
end

--[[ ]]--

print("Cross: "..arg[1].." X "..arg[2])
print("Table: ")
draw(tab)