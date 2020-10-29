local cFunc = {}
local cSetting = {}


-- FUNCTIONS --



cFunc["import_func"] = function()
	-- Replace the model
	engineImportTXD (engineLoadTXD("data/chromegun.txd"), 349)
	engineReplaceModel(engineLoadDFF("data/chromegun.dff", 349), 349)
end


-- EVENT HANDLER --

addEventHandler("onClientResourceStart", getResourceRootElement(), cFunc["import_func"])