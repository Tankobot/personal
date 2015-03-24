--Set of functions to encrypt and decrypt data/strings. 

function cycle(tab, num, bool)
	for i=1, #tab do 
		if op == 1 then 
			tab[i] = tab[i]+num
		elseif op == 2 then 
			tab[i] = tab[i]-num 
		elseif op == 3 then
			tab[i] = tab[i]*num
		end
	end
	return tab
end

function encryptFunc(str, num)
	--Perform simple argument check. 
	assert(type(str)=="string", "Expected string, got "..type(str)..".")
	assert(type(num)=="number", "Expected number, got "..type(num)..".") 
	
	--Convert input string into individual bytes. 
	local tab = {string.byte(str, 1, -1)} 
	
	--Apply encryption to each byte of string. 
	num = tostring(num)
	for i=1, #num do 
		local op = math.random(1,3) --TODO
		tab = cycle(tab, string.sub(num, i), bool)
	end
	
	--String together bytes as characters. 
	newstring = string.char(unpack(tab))
	
	return newstring
end

function decrypt(str, num) 
	
end

local encryt = {
	encrypt = encryptFunc,
	decrypt = decrypt
}

return encrypt 
