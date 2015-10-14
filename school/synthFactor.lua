local mid = {0}
local resL = {1,5,3,8}
local divisors = {1,2,4,8}

local function factor(coeff, divisor, res)
	for i=1, #coeff-1 do
 		mid[i+1] = res[i]
		res[i+1] = mid[i+1]+coeff[i+1]
	end
	if res[#res]==0 then
		res[#res] = nil
		return true, res
	else
		return false
	end
end

local state
local factoring = true
while factoring do
	resN = {table.unpack(resL)}
	for i=1, #divisors do
		state, resN = factor(resL, divisors[i], resN)
		print("###")
		print(table.concat(resL,","))
		print(table.concat(mid,","))
		print(table.concat(resN,","))
		if state then
			break
		end
		if i==#divisors then
			factoring = false
		end
	end
end

print("Finished")
