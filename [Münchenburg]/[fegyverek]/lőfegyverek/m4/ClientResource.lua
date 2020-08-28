local cFunc = {}
local cSetting = {}


-- FUNCTIONS --



cFunc["import_func"] = function()
	-- Replace the model
	engineImportTXD (engineLoadTXD("képek/m4.txd"), 356)
	engineReplaceModel(engineLoadDFF("képek/m4.dff", 356), 356)
end


-- EVENT HANDLER --

addEventHandler("onClientResourceStart", getResourceRootElement(), cFunc["import_func"])