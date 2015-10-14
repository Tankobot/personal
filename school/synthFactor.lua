local coeff = {1,5,3,8}
local mid = {0}
local res = {}
local divisors = {1,2,4,8}

res[1]=coeff[1]

local function factor(coeff,divisor)
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
