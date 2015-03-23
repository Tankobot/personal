--Set of functions to encrypt and decrypt data/strings. 

function cycle(tab, num, bool)
	for i=1, #tab do 
		if bool then 
			tab[i] = tab[i]*num
		else
			tab[i] = tab[i]-num
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
	local bool = true
	for i=1, #num do 
		tab = cycle(tab, string.sub(num, i), bool)
		if bool then bool = false else bool = true end
	end
	
	--String together bytes as characters. 
	newstring = ""
	for i=1, #tab do 
		newstring = newstring..string.char(tab[i])
	end
	
	return newstring
end

function decrypt(str, num) 
	
end

local encryt = {
	encrypt = encryptFunc
}
