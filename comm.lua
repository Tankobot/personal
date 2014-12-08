--[[
Author: Tankobot (Michael B) 
Version: 1.0
--]]

print("The Communications API is loading...")

modem = nil
local SSL 
local meta 
local html 
local info 

function authWeb(certHost,websiteIP)
	--todo
	return SSL, meta
end

function getWeb(ip) 
	
	return html, meta 
end 

function postWeb(ip,data) 
	
	return info, meta 
end 

function wrap(side) 
	modem = peripheral.wrap(side) 
end

print("The Communications API is finished loading.")
