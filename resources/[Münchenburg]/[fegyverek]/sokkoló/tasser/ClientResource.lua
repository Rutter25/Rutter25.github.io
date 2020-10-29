--[[
	##########################################################################
	##                                                                      ##
	## Project: 'Taser' - resource for MTA: San Andreas                     ##
	##                                                                      ##
	##########################################################################
	[C] Copyright 2013-2014, Falke
]]

local cFunc = {}
local cSetting = {}


-- FUNCTIONS --



cFunc["import_func"] = function()
	-- Replace the model
	engineImportTXD (engineLoadTXD("data/desert_eagle.txd"), 348)
	engineReplaceModel(engineLoadDFF("data/desert_eagle.dff", 348), 348)
end


-- EVENT HANDLER --

addEventHandler("onClientResourceStart", getResourceRootElement(), cFunc["import_func"])