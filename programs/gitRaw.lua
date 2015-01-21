--[[
Title: Git Downloader 
--]]

arg = {...}

msg = "Usage: gitRaw <repLocation> <saveLocation>"
assert(arg[1], msg)
assert(arg[2], msg)
assert(http, "The HTTP api must be enabled.")

repLocation = arg[1]
saveLocation = arg[2]

print("Starting to retrieve file from GitHub.")
dump, raw = pcall(http.get, "https://raw.githubusercontent.com/"..repLocation)
if dump == false then 
	error("Failed to retrieve file from remote server.")
end
file = fs.open(saveLocation, "w") 
file.write(raw.readAll())
file.close()
print("File Downloaded.")