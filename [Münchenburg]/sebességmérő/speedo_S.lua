
function initCarLocks ()
	local players = getElementsByType ( "player" )
	for k,p in ipairs(players) do
		removeElementData ( p, "cl_ownedvehicle" )
		bindKey ( p, "á", "down", doToggleLocked )
	end
	local vehicles = getElementsByType ( "vehicle" )
	for k,v in ipairs(vehicles) do
		removeElementData ( vehicles, "cl_vehicleowner")
		removeElementData ( vehicles, "cl_vehiclelocked" )
		removeElementData ( vehicles, "cl_enginestate" )
		setVehicleLocked ( vehicles, false )
		setVehicleOverrideLights ( v, 0 )
	end
end
addEventHandler ( "onResourceStart", getResourceRootElement ( getThisResource () ), initCarLocks )
addEventHandler ( "onResourceStop", getResourceRootElement ( getThisResource () ), initCarLocks )

function cl_PlayerJoin ( )
bindKey ( source, "", "down", doToggleLocked )
bindKey ( source, "j", "down", switchEngine )

end
addEventHandler ( "onPlayerJoin", getRootElement(), cl_PlayerJoin )

function cl_PlayerQuit ( )
	local ownedVehicle = getElementData ( source, "cl_ownedvehicle" )
	if (ownedVehicle ~= false) then
		cl_RemoveVehicleOwner ( ownedVehicle )
	end
end
addEventHandler ( "onPlayerQuit", getRootElement(), cl_PlayerQuit )

function cl_PlayerWasted ( )
	local ownedVehicle = getElementData ( source, "cl_ownedvehicle" )
	if (ownedVehicle ~= false) then
		cl_RemoveVehicleOwner ( ownedVehicle )
	end
end
addEventHandler ( "onPlayerWasted", getRootElement(), cl_PlayerWasted )

function cl_VehicleStartEnter ( enteringPlayer, seat, jacked )
	local theVehicle = source
	local theOwner
	if ( getElementData ( theVehicle, "cl_vehiclelocked" ) == true ) then
		theOwner = getElementData ( theVehicle, "cl_vehicleowner" )
		if theOwner ~= false and theOwner ~= enteringPlayer then
		end
	 end
end
addEventHandler ( "onVehicleStartEnter", getRootElement(), cl_VehicleStartEnter )

function cl_PlayerDriveVehicle ( player, seat, jacked )
	if ( seat == 0 ) then
		oldVehicle = getElementData ( player, "cl_ownedvehicle" )
		if ( (cl_VehicleLocked(source) == true) and (cl_VehicleOwner(source) ~= player) ) then
			removePedFromVehicle( player )
			Err_Msg("this vehicle is locked.", player)
			return false
		end
		cl_SetVehicleOwner ( source, player )
	end
	return true
end
addEventHandler ( "onVehicleEnter", getRootElement(), cl_PlayerDriveVehicle )

function cl_VehicleRespawn ( exploded ) 
	cl_RemoveVehicleOwner ( source )
end
addEventHandler ( "OnVehicleRespawn", getRootElement(), cl_VehicleRespawn )

function cl_VehicleExplode ( )
	local theOwner = getElementData ( source, "cl_vehicleowner" )
	if ( theOwner ~= false ) then
		cl_RemoveVehicleOwner ( source )
	end
end
addEventHandler ( "onVehicleExplode", getRootElement(), cl_VehicleExplode )

function cl_SetVehicleOwner ( theVehicle, thePlayer )
	local oldVehicle = getElementData ( thePlayer, "cl_ownedvehicle" )
	if ( oldVehicle ~= false ) then	
		removeElementData ( oldVehicle, "cl_vehicleowner" )
		removeElementData ( oldVehicle, "cl_vehiclelocked" )
		removeElementData ( oldVehicle, "cl_enginestate" )
		setVehicleLocked ( oldVehicle, false ) 
	end
	setElementData ( theVehicle, "cl_vehicleowner", thePlayer )
	setElementData ( theVehicle, "cl_vehiclelocked", false )
	setElementData ( thePlayer, "cl_ownedvehicle", theVehicle )
	setElementData( theVehicle, "cl_enginestate", true )

end

function cl_RemoveVehicleOwner ( theVehicle )
	local theOwner = getElementData ( theVehicle, "cl_vehicleowner" )
	if ( theOwner ~= false ) then
		removeElementData ( theOwner, "cl_ownedvehicle" )
		removeElementData ( theVehicle, "cl_vehicleowner" )
		removeElementData ( theVehicle, "cl_vehiclelocked" )
		removeElementData ( owned, "cl_enginestate" )
	end
	setVehicleLocked ( theVehicle, false )

end

function cl_FlashLights ( thePlayer )
	setTimer ( doToggleLights, 300, 4, thePlayer, true )
end

function cl_FlashOnce ( thePlayer )
	setTimer ( doToggleLights, 300, 2, thePlayer, true )
end

function cl_VehicleOwner ( theVehicle )
	return getElementData( theVehicle, "cl_vehicleowner" )

end

function cl_VehicleLocked ( theVehicle )
	return getElementData( theVehicle, "cl_vehiclelocked" )
end

function Err_Msg ( strout, thePlayer )
	outputChatBox ( strout, thePlayer, 200, 0, 10 )
end

function Car_Msg ( strout, theVehicle )
	numseats = getVehicleMaxPassengers ( theVehicle )
	for s = 0, numseats do
		local targetPlayer = getVehicleOccupant ( theVehicle, s )
		if targetPlayer ~= false then
			outputChatBox ( strout, targetPlayer, 30, 144, 255 )
		end
	end
end

function Info_Msg ( strout, thePlayer )
	outputChatBox ( strout, thePlayer, 102, 205, 170 )
end

function doToggleLocked ( source )
	local theVehicle , strout
	if ( getElementType(source) == "vehicle" ) then
		theVehicle = source
	end
	if ( getElementType(source) == "player" ) then
		theVehicle = getElementData ( source, "cl_ownedvehicle" )
	end

	if ( theVehicle ) then
		local vehiclename = getVehicleName ( theVehicle )
		if ( getElementData ( theVehicle, "cl_vehiclelocked") == true ) then
			doUnlockVehicle ( source )
		else 
			doLockVehicle ( source )
		end
	else
		Err_Msg("Hata !!!! Araca tekrar bin", source)
	end
end	

function doLockVehicle ( source )
	local theVehicle , strout
	if ( getElementType(source) == "vehicle" ) then
		theVehicle = source
	end
	if ( getElementType(source) == "player" ) then
		theVehicle = getElementData ( source, "cl_ownedvehicle" )
	end

	if ( theVehicle ) then
		local vehiclename = getVehicleName ( theVehicle )
		if ( getElementData ( theVehicle, "cl_vehiclelocked") == true ) then
			strout = "A jármű" .. vehiclename .. "nyitva" 
			Err_Msg(strout, source)
		else 
			setElementData ( theVehicle, "cl_vehiclelocked", true)
			setVehicleLocked ( theVehicle, true ) 
			Car_Msg( "A jármű" .. vehiclename .. "nyitva", theVehicle)
			Info_Msg ( "A jrmű" .. vehiclename .. "zárva", source )
			if ( getVehicleController ( theVehicle ) == false ) then
				cl_FlashLights ( source )
			end
		end
	else
		Err_Msg("3", source)
	end
end

function doUnlockVehicle ( source )
	local theVehicle, strout
	if ( getElementType(source) == "vehicle" ) then
		theVehicle = source
	end
	if ( getElementType(source) == "player" ) then
		theVehicle = getElementData ( source, "cl_ownedvehicle" )
	end
	if ( theVehicle ) then
	local vehiclename = getVehicleName ( theVehicle )
		if ( getElementData ( theVehicle, "cl_vehiclelocked") == false ) then
			strout = "Arac " .. vehiclename .. " Arac Calinabilir"
			Err_Msg(strout, source)
		else
			setElementData ( theVehicle, "cl_vehiclelocked", false)
			setVehicleLocked ( theVehicle, false )
			Car_Msg( "Suanki Arac " .. vehiclename .. " İyi Oyunlar", theVehicle )
			Info_Msg ( "Suanki Arac " .. vehiclename .. " Kiliti Acildi", source )
			if ( getVehicleController ( theVehicle ) == false ) then
				cl_FlashOnce ( source )
			end
		end
	else
		Err_Msg("2", source)
	end
end

function doToggleLights ( source, beep )
	local theVehicle 
	if ( getElementType(source) == "vehicle" ) then
		theVehicle = source
	end
	if ( getElementType(source) == "player" ) then
		theVehicle = getElementData ( source, "cl_ownedvehicle" )
	end
	if ( theVehicle ) then
		-- if he was in one
		if ( getVehicleOverrideLights ( theVehicle ) ~= 2 ) then
            setVehicleOverrideLights ( theVehicle, 2 )
			if ( beep == true ) then
				local theElement = theVehicle
			end
        else
            setVehicleOverrideLights ( theVehicle, 1 )
        end
	else
		Err_Msg("1", source )
    end
end

addCommandHandler ( "lights", doToggleLights, false)
addCommandHandler ( "lock", doLockVehicle )
addCommandHandler ( "unlock", doUnlockVehicle )


