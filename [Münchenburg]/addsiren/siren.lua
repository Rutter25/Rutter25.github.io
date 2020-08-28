-- Settings
local vehicleSirens = {402} -- Add the vehicle ID(s) of mod you need to add sirens to


addEventHandler("onVehicleEnter", root,
	function()
		for index, value in ipairs(vehicleSirens) do
			if ( getElementModel(source) == value ) then
				addVehicleSirens(source, 2, 3, true, true, false)
				setVehicleSirens(source,1, -.5,-.4,.8,255,0,0) 	setVehicleSirens(source,2, .5,-.4,.8,0,0,255)
			end
		end
	end
)