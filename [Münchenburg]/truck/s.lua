--// Made by: MoPoMaN

--//Tables and other stuff
tableLocationsX = {}
tableLocationsY = {}
tableLocationsZ = {}

tableMoney = {}
locationCount = 3

--//Location 1
tableLocationsX[1] = 2253.7
tableLocationsY[1] = -84.0
tableLocationsZ[1] = 25.3

tableMoney[1] = 500

--//Location 2
tableLocationsX[2] = 1093.7
tableLocationsY[2] = -931.6
tableLocationsZ[2] = 41.9

tableMoney[2] = 550

--//Location3
tableLocationsX[3] = -47.3
tableLocationsY[3] = -1137.5
tableLocationsZ[3] = 0.07

tableMoney[3] = 500

function startScript ()
	--Marker
	marker = createMarker (2776.6, -2425.5, 12.6, "cylinder", 1.1, 0, 255, 0)
	addEventHandler ("onMarkerHit", marker, startMission)
	--Objects and Ped
	ped = createPed (302, 2776.7, -2428.1, 13.6)
	tableObj = createObject (2205, 2775.9, -2426.8, 12.6)
	chairObj = createObject (2309, 2776.7, -2427.4, 12.6)
	addEventHandler ("onPedWasted", getRootElement(), respawnPed)
	--Blip
	startBlip = createBlip (2776.9, -2423.9, 12.7, 51)
end

function startMission (hitElement)
	if getElementType (hitElement) == "player" then
		--Check team
		-- local team = getPlayerTeam (hitElement)
		-- if getTeamName (team) ~= "Workers" then
			-- local teamName = getTeamName (team)
			-- outputChatBox ("#ffaa00// #ffffffOnly workers can drive trucks! Press F2 to change the team.", hitElement, 255, 255, 255, true)
			-- return false
		-- else
			--createThings
			rekka = createVehicle (515, 2779.6, -2437.2, 14.7, 0, 0, 90)
			vaunu = createVehicle (450, 2789.2, -2437.1, 14.2, 0, 0, 90)
			randomLoc = math.random (1, locationCount)
			finish = createMarker (tableLocationsX[randomLoc], tableLocationsY[randomLoc], tableLocationsZ[randomLoc], "cylinder", 3, 0, 200, 55, 255, hitElement)
			blip = createBlip (tableLocationsX[randomLoc], tableLocationsY[randomLoc], tableLocationsZ[randomLoc], 0, 2, 255, 0, 0, 255, 0, 10000, hitElement)
			--addEventHandlers
			addEventHandler ("onTrailerDetach", getRootElement(), trailerDetach)
			addEventHandler ("onVehicleExit", getRootElement(), vehicleExit)
			addEventHandler ("onMarkerHit", finish, reward)
			addEventHandler ("onPlayerQuit", getRootElement(), onQuit)
			--other
			setVehicleLocked (rekka, true)
			destroyElement (startBlip)
			pelaaja = hitElement
			outputChatBox ("#ffaa00// #ffffffDrive to the red blip on the map #ffaa00", pelaaja, 255, 255, 255, true)
			setElementPosition (marker, -406, -64, 2.4)
			setVehicleVariant (vaunu, 0, 0)
			warpPedIntoVehicle (hitElement, rekka)
		-- end
	else
		return false
	end
end

function trailerDetach ()
	if source == vaunu then
		--destroyThings
		destroyElement (rekka)
		destroyElement (vaunu)
		destroyElement (finish)
		destroyElement (blip)
		--removeEventHandlers
		removeEventHandler ("onTrailerDetach", getRootElement(), trailerDetach)
		removeEventHandler ("onVehicleExit", getRootElement(), vehicleExit)
		removeEventHandler ("onPlayerQuit", getRootElement(), onQuit)
		--other
		startBlip = createBlip (2776.9, -2423.9, 12.7, 51)
		setElementPosition (marker, 2776.6, -2425.5, 12.6)
	else
		return false
	end
end

function vehicleExit (leaver)
	if source == rekka and leaver == pelaaja then
		setVehicleLocked (rekka, false)
		outputChatBox ("#ffaa00// #ffffffGo back to the truck in 10 seconds!", leaver, 255, 255, 255, true)
		destroyTimer = setTimer (destroyVehicle, 10000, 1)
		addEventHandler ("onVehicleEnter", getRootElement(), destrTimer)
	else
		return false
	end
end

function destrTimer (thePlayer)
	if source == rekka and thePlayer == pelaaja then
		local team = getPlayerTeam (thePlayer)
		if getTeamName (team) == "Freeroam" or getTeamName (team) == "The Police" then
			return false
		else
			killTimer (destroyTimer)
			removeEventHandler ("onVehicleEnter", getRootElement(), destrTimer)
			setVehicleLocked (rekka, true)
		end
	else
		return false
	end
end

function destroyVehicle ()
	if destroyTimer then
		--destroyThings
		destroyElement (rekka)
		destroyElement (vaunu)
		destroyElement (finish)
		destroyElement (blip)
		--removeEventHandlers
		removeEventHandler ("onTrailerDetach", getRootElement(), trailerDetach)
		removeEventHandler ("onVehicleExit", getRootElement(), vehicleExit)
		removeEventHandler ("onVehicleEnter", getRootElement(), destrTimer)
		removeEventHandler ("onPlayerQuit", getRootElement(), onQuit)
		--other
		startBlip = createBlip (2776.9, -2423.9, 12.7, 51)
		setElementPosition (marker, 2776.6, -2425.5, 12.6)
	else
		return false
	end
end

function onQuit ()
	if source == pelaaja then
		--destroyThings
		destroyElement (rekka)
		destroyElement (vaunu)
		destroyElement (finish)
		destroyElement (blip)
		--removeEventHandlers
		removeEventHandler ("onTrailerDetach", getRootElement(), trailerDetach)
		removeEventHandler ("onVehicleExit", getRootElement(), vehicleExit)
		removeEventHandler ("onPlayerQuit", getRootElement(), onQuit)
		--other
		startBlip = createBlip (2776.9, -2423.9, 12.7, 51)
		setElementPosition (marker, 2776.6, -2425.5, 12.6)
	end
end

function reward (hitElement)
	if hitElement == rekka then
		--other
		startBlip = createBlip (2776.9, -2423.9, 12.7, 51)
		outputChatBox ("#ffaa00// #ffffffGood job! You've been rewarded " .. tableMoney[randomLoc] .. "$", pelaaja, 255, 255, 255, true)
		setElementPosition (marker, 2776.6, -2425.5, 12.6)
		palkittava = getVehicleOccupant (rekka, 0)
		givePlayerMoney (palkittava, tableMoney[randomLoc])
		--destroyThings
		destroyElement (rekka)
		destroyElement (vaunu)
		destroyElement (finish)
		destroyElement (blip)
		--removeEventHandlers
		removeEventHandler ("onTrailerDetach", getRootElement(), trailerDetach)
		removeEventHandler ("onVehicleExit", getRootElement(), vehicleExit)
		removeEventHandler ("onPlayerQuit", getRootElement(), onQuit)
	else
		return false
	end
end

function respawnPed ()
	if source == ped then
		timer = setTimer (pedRespawn, 5000, 1)
	else
		return false
	end
end

function pedRespawn ()
	killTimer (timer)
	destroyElement (ped)
	ped = createPed (302, 2776.7, -2428.1, 13.6)
end
addEventHandler ("onResourceStart", getResourceRootElement(getThisResource()), startScript)