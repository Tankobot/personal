local mid = {0}
local resN = {1,4,-3,-18}
local divisors = {1,2,3,6,9,18}
local resL = {}

local c = #divisors
for i=1, c do
	divisors[#divisors+1]=-divisors[i]
end

local function factor(coeff, divisor, res)
	print(divisor)
	for i=1, #coeff-1 do
 		mid[i+1] = res[i]*divisor
		res[i+1] = mid[i+1]+coeff[i+1]
	end
	if res[#res]==0 then
		res[#res] = nil
		print("Factored")
		return true, res
	else
		return false
	end
end

local state
local factoring = true
while factoring do
	resL = {table.unpack(resN)}
	mid = {0}
	if #resL==1 then
		break
	end
	for i=1, #divisors do
		print("###")
		state = factor(resL, divisors[i], resN)
		print(table.unpack(resL))
		print(table.unpack(mid))
		print(table.unpack(resN))
		if state then
			break
		end
		if i==#divisors then
			factoring = false
		end
	end
end

print("Finished")
