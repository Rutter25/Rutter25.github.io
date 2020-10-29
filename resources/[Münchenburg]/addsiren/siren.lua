-- Settings
local vehicleSirens = {597} -- Add the vehicle ID(s) of mod you need to add sirens to
addEventHandler("onVehicleEnter", root,
	function()
			if ( getElementModel(source)) then
				removeVehicleSirens(source, true)
				
			end
		end
)