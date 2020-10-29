local monitorSize = {guiGetScreenSize()}
local panelSize = {500, 400}
local panelX, panelY = monitorSize[1]/2-panelSize[1]/2, monitorSize[2]/2-panelSize[2]/2

local font = dxCreateFont("files/myriadproregular.ttf",9) --<[ Font ]>--
local showmodpanel = false
local Max = 14
local current = 0
local alpha = 0
local enabledVehicleMod = {}
local color = "#00ff66"

addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), function ()
	for index, value in ipairs (elements) do
		if tostring(index) ~= tostring(value) then 
			changeVehicleMod (value[1], value[2])
		end
	end
	for i=1 , 10000 do
		if not enabledVehicleMod[i] then
			enabledVehicleMod[i] = 1
		end
	end
end)

function changeVehicleMod (filename,id)
	if id and filename then
		if getVehicleNameFromModel(id) then
			if fileExists("vehicle/"..filename..".txd") then
				txd = engineLoadTXD("vehicle/"..filename..".txd", id )
				engineImportTXD(txd, id)
			end			
			if fileExists("vehicle/"..filename..".dff") then
			  dff = engineLoadDFF("vehicle/"..filename..".dff", id )
			  engineReplaceModel(dff, id)
			end		
		end
	end
end
