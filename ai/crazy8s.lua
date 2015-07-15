--[[
Title: Crazy Eight's Card Game
Note: Follows cardBotEngine commands. 
--]]

--Set up intial variables

local numberOfPlayers = ... --Retrieve arguments 
assert(numberOfPlayers > 1, "Must play with at least two players")

local hands = {} --Setup hands of all players. 
for i=1, numberOfPlayers do
	hands[i] = {}
end

local deck = {} --Initialize deck
local suits = {
	"S",
	"H",
	"C",
	"D",
}
local cardValues = {
	2, 3, 4, 5, 6, 7, 8, 9, 10,
	"J",
	"Q",
	"K",
	"A",
}
for i=1, #suits do --Setup four suits
	for j=1, #cardValues do --Setup each card of each suit
		deck[#deck+1] = cardValues[j].."-"..suits[i]
	end
end

local drawPile = {}

local top --Top of pile

--Declare functions 

local function translate(id)
	return deck[id]
end

local function shuffle()
	local ordered = {}
	local length = #drawPile
	for i=1, length do
		ordered[i] = drawPile[i]
	end
	
	local unique = {}
	for i=1, length do
		unique[i] = table.remove(ordered, math.random(1, #ordered))
	end
	
	for i=1, length do
		drawPile[i] = unique[i]
	end
end

local function drawCard(destination)
	table.insert(hands[destination], table.remove(drawPile))
end

local function printHand(hand)
	for i=1, #hands[hand] do
		io.write(i..":"..translate(hands[hand][i]).." | ")
	end
	print("\nType card number or '0' to draw")
end

local function playCard(hand, index)
	
end