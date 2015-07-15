--[[
Title: Card Bot Enginea
Description: An card game 'ai' test engine. 
--]]

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

local deckTranslate = {} --Setup translation of deck ids for input 
for i, v in ipairs(deck) do
	deckTranslate[v] = i
end

--Declare functions ///////////////////////////////////////////////////////////

local function initHidden(cards)
	
end

local function initOpen(cards)
	
end