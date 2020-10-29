local strobo_interval = 10	-- strobo light freq. 10 = 0.5 sec
local is_strobo_enabled = disable	-- enable/disable stroboscopic lights mode
-- lamps
local flash_interval = 0	-- flash freq
-- led blink mode
local blink_interval = 1000		-- blink interval
local blink_duration = 40000		-- 1..blink_interval

local car_lights_table2 = {



--Police SF
 [597] = {["mode"]="lamp",
[1]={["pos"]={0.32, -0.23, 0.71}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=0.0},
[2]={["pos"]={0.3, -0.23, 0.7}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=0.0},
[3]={["pos"]={0.27, -0.23, 0.71}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=0.0},
[4]={["pos"]={0.27, -0.23, 0.72}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=0.0},
[5]={["pos"]={0.27, -0.23, 0.73}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=0.0},
[6]={["pos"]={0.27, -0.23, 0.74}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=0.0},  
[7]={["pos"]={0.27, -0.23, 0.75}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=0.0},
[8]={["pos"]={0.29, -0.23, 0.75}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=0.0},
[9]={["pos"]={0.3, -0.23, 0.75}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=0.0},
[10]={["pos"]={0.32, -0.23, 0.76}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=0.0},
[11]={["pos"]={0.31, -0.23, 0.755}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=0.0},
[12]={["pos"]={0.32, -0.23, 0.77}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=0.0},
[13]={["pos"]={0.32, -0.23, 0.78}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=0.0},
[14]={["pos"]={0.32, -0.23, 0.79}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=0.0},
[15]={["pos"]={0.32, -0.23, 0.8}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=0.0},
[16]={["pos"]={0.31, -0.23, 0.805}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=0.0},
[17]={["pos"]={0.30, -0.23, 0.805}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=0.0},
[18]={["pos"]={0.29, -0.23, 0.805}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=0.0},
[19]={["pos"]={0.28, -0.23, 0.805}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=0.0},
[20]={["pos"]={0.27, -0.23, 0.79}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=0.0},--Itt ér véget a S-betű
[21]={["pos"]={0.15, -0.23, 0.7}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=10.0},
[22]={["pos"]={0.15, -0.23, 0.71}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=10.0},
[23]={["pos"]={0.15, -0.23, 0.72}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=10.0},
[24]={["pos"]={0.15, -0.23, 0.73}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=10.0},
[25]={["pos"]={0.15, -0.23, 0.74}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=10.0},
[26]={["pos"]={0.15, -0.23, 0.75}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=10.0},
[27]={["pos"]={0.15, -0.23, 0.76}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=10.0},
[28]={["pos"]={0.15, -0.23, 0.77}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=10.0},
[29]={["pos"]={0.15, -0.23, 0.78}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=10.0},
[20]={["pos"]={0.15, -0.23, 0.79}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=10.0},
[31]={["pos"]={0.15, -0.23, 0.8}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=10.0},
[32]={["pos"]={0.14, -0.23, 0.8}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=10.0},
[33]={["pos"]={0.13, -0.23, 0.8}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=10.0},
[34]={["pos"]={0.12, -0.23, 0.8}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=10.0},
[35]={["pos"]={0.11, -0.23, 0.8}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=10.0},
[36]={["pos"]={0.1, -0.23, 0.8}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=10.0},
[37]={["pos"]={0.16, -0.23, 0.8}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=10.0},
[38]={["pos"]={0.17, -0.23, 0.8}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=10.0},
[39]={["pos"]={0.18, -0.23, 0.8}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=10.0},
[40]={["pos"]={0.19, -0.23, 0.8}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=10.0},
[41]={["pos"]={0.2, -0.23, 0.8}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=10.0}, -- Itt ér véget a T-betű 
[42]={["pos"]={0, -0.23, 0.7}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=20.0},
[43]={["pos"]={0, -0.23, 0.71}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=20.0},
[44]={["pos"]={0, -0.23, 0.72}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=20.0},
[45]={["pos"]={0, -0.23, 0.73}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=20.0},
[46]={["pos"]={0, -0.23, 0.74}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=20.0},
[47]={["pos"]={0, -0.23, 0.75}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=20.0},
[48]={["pos"]={0, -0.23, 0.76}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=20.0},
[49]={["pos"]={0, -0.23, 0.77}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=20.0},
[50]={["pos"]={0, -0.23, 0.78}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=20.0},
[51]={["pos"]={0, -0.23, 0.79}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=20.0},
[52]={["pos"]={0, -0.23, 0.8}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=20.0},
[53]={["pos"]={-0.01, -0.23, 0.8}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=20.0},
[54]={["pos"]={-0.02, -0.23, 0.8}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=20.0},
[55]={["pos"]={-0.03, -0.23, 0.8}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=20.0},
[56]={["pos"]={-0.04, -0.23, 0.8}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=20.0},
[57]={["pos"]={-0.05, -0.23, 0.8}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=20.0},
[58]={["pos"]={-0.06, -0.23, 0.7}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=20.0},
[59]={["pos"]={-0.06, -0.23, 0.71}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=20.0},
[60]={["pos"]={-0.06, -0.23, 0.72}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=20.0},
[61]={["pos"]={-0.06, -0.23, 0.73}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=20.0},
[62]={["pos"]={-0.06, -0.23, 0.74}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=20.0},
[63]={["pos"]={-0.06, -0.23, 0.75}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=20.0},
[64]={["pos"]={-0.06, -0.23, 0.76}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=20.0},
[65]={["pos"]={-0.06, -0.23, 0.77}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=20.0},
[66]={["pos"]={-0.06, -0.23, 0.78}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=20.0},
[67]={["pos"]={-0.06, -0.23, 0.79}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=20.0},
[68]={["pos"]={-0.06, -0.23, 0.8}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=20.0},
[69]={["pos"]={-0.01, -0.23, 0.7}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=20.0},
[70]={["pos"]={-0.02, -0.23, 0.7}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=20.0},
[71]={["pos"]={-0.03, -0.23, 0.7}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=20.0},
[72]={["pos"]={-0.04, -0.23, 0.7}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=20.0},
[73]={["pos"]={-0.05, -0.23, 0.7}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=20.0}, --Itt végződik az O-betű
[74]={["pos"]={-0.15, -0.23, 0.7}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=30.0},
[75]={["pos"]={-0.15, -0.23, 0.71}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=30.0},
[76]={["pos"]={-0.15, -0.23, 0.72}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=30.0},
[77]={["pos"]={-0.15, -0.23, 0.73}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=30.0},
[78]={["pos"]={-0.15, -0.23, 0.74}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=30.0},
[79]={["pos"]={-0.15, -0.23, 0.75}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=30.0},
[80]={["pos"]={-0.15, -0.23, 0.76}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=30.0},
[81]={["pos"]={-0.15, -0.23, 0.77}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=30.0},
[82]={["pos"]={-0.15, -0.23, 0.78}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=30.0},
[83]={["pos"]={-0.15, -0.23, 0.79}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=30.0},
[84]={["pos"]={-0.15, -0.23, 0.8}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=30.0},
[85]={["pos"]={-0.16, -0.23, 0.75}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=30.0},
[86]={["pos"]={-0.17, -0.23, 0.75}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=30.0},
[87]={["pos"]={-0.18, -0.23, 0.75}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=30.0},
[88]={["pos"]={-0.19, -0.23, 0.75}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=30.0},
[89]={["pos"]={-0.2, -0.23, 0.75}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=30.0},  
[90]={["pos"]={-0.2, -0.23, 0.76}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=30.0},
[91]={["pos"]={-0.2, -0.23, 0.77}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=30.0},
[92]={["pos"]={-0.2, -0.23, 0.78}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=30.0},
[93]={["pos"]={-0.2, -0.23, 0.79}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=30.0},
[94]={["pos"]={-0.2, -0.23, 0.8}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=30.0},
[95]={["pos"]={-0.16, -0.23, 0.8}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=30.0},
[96]={["pos"]={-0.17, -0.23, 0.8}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=30.0},
[97]={["pos"]={-0.18, -0.23, 0.8}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=30.0},
[98]={["pos"]={-0.19, -0.23, 0.8}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=30.0},
[99]={["pos"]={-0.2, -0.23, 0.8}, ["color"]={255,0,0}, ["size"]=0.02, ["phase"]=30.0}, --Itt ér véger a P-betű
},

 
-- since 0.8 there are no default lights position, because only emergency and pre-defined vehicles can use lights
--["default"] = {["mode"]="lamp", [1]={["pos"]={0.5, 0, 0.8}, ["color"]={255,0,0}, ["size"]=0.25, ["phase"]=0.0}, [2]={["pos"]={-0.5, 0, 0.8}, ["color"]={0,0,255}, ["size"]=0.25, ["phase"]=10.0}}
}

-- do not modify --------------------------------------------
local vehicles = {}
local timers = {}

local base_freq = 1	-- freq of timer for light change

-------------------------------------------------------------
function release_vehicle2(vehicle)
	if (isElement(vehicle)) then
		if (is_strobo_enabled) then
			setVehicleOverrideLights ( vehicle, 1)
			setVehicleLightState ( vehicle, 1,  1 )
			setVehicleLightState ( vehicle, 1,  1 )
			setVehicleLightState ( vehicle, 2,  1 )
			setVehicleLightState ( vehicle, 3,  1 )
		end
	end
	if (vehicles[vehicle]~=nil) then	
		-- release the markers
		for key, value in pairs(vehicles[vehicle]["flist"]) do
			destroyElement (value["m"])
		end
		
		vehicles[vehicle] = nil
	end
	if (timers[vehicle]~=nil) then
		-- kill the strobo timer
		killTimer(timers[vehicle])
		timers[vehicle] = nil
		
		if (isElement(vehicle)) then
			if (getElementData( vehicle, "emerlights_source")==getPlayerName(getLocalPlayer())) then
				triggerEvent ( "onPlayerEmergencyLightStateChange2", getRootElement(), 0 )
			end
		end
	end
end

function checkForAbility2(vehicle)
	local veh_model = getElementModel ( vehicle )
	if (car_lights_table2[veh_model]==nil)or(getElementData( vehicle, "emerlights_enabled" )=="false") then
		return false
	end
	return true
end

function strobo_state_update2 (vehicle)
	-- check for valid vehicle
	if (isElement(vehicle)) then
		if (vehicles[vehicle]==nil) then
			-- check for disallowing to use lights
			-- its enabled by default
			if (checkForAbility2(vehicle)==false) then
				release_vehicle2(vehicle)
				return
			end
			local veh_model = getElementModel ( vehicle )
			
			--if (car_lights_table2[veh_model]==nil) then
			--veh_model = "default"
			--end
			
			local occupant = getVehicleOccupant( vehicle, 0)
			if (getElementType(occupant)=="player") then	-- peds also can use emerlights
				local src = getPlayerName(occupant)
				setElementData( vehicle, "emerlights_source", src, false)
				if (src==getPlayerName(getLocalPlayer())) then
					triggerEvent ( "onPlayerEmergencyLightStateChange2", getRootElement(), 1 )
				end
			end
			-- init state variable
			
			vehicles[vehicle] = {}
			vehicles[vehicle]["lstate"] = 0 	-- strobo lights state
			vehicles[vehicle]["fstate"] = 0	-- flash light state
			vehicles[vehicle]["flist"] = {}		-- flash lights list (marker ids)
			
			-- create flash lights

			
			local mode = car_lights_table2[veh_model]["mode"]
			if (mode==nil) then
				mode = "lamp"
			end
			
			local coeff = 0
			if (mode=="lamp") then
				coeff = 3.141592654/10.0
			else
				coeff = blink_interval/20.0
			end
			
			vehicles[vehicle]["fmode"] = mode
			
			for light_id, light_desc in pairs(car_lights_table2[veh_model]) do
				if (light_id~="mode") then
					vehicles[vehicle]["flist"][light_id] = {}
					vehicles[vehicle]["flist"][light_id]["m"] = createMarker( 0.0001, 0.0001, 0.0001, "corona", light_desc["size"], light_desc["color"][1], light_desc["color"][2], light_desc["color"][3], 100)
					vehicles[vehicle]["flist"][light_id]["p"] = light_desc["phase"]*coeff
					attachElements ( vehicles[vehicle]["flist"][light_id]["m"], vehicle, light_desc["pos"][1], light_desc["pos"][2], light_desc["pos"][3] )
				end
			end
				
		end
		
		-- strobo light
		if (is_strobo_enabled) then
			setVehicleOverrideLights ( vehicle, 2)
			if (vehicles[vehicle]["lstate"]<strobo_interval) then
				setVehicleLightState ( vehicle, 0,  1 )
				setVehicleLightState ( vehicle, 1,  0 )
				setVehicleLightState ( vehicle, 2,  0 )
				setVehicleLightState ( vehicle, 3,  1 )	
			else
				setVehicleLightState ( vehicle, 0,  0 )
				setVehicleLightState ( vehicle, 1,  1 )
				setVehicleLightState ( vehicle, 2,  1 )
				setVehicleLightState ( vehicle, 3,  0 )	 
			end
			if (vehicles[vehicle]["lstate"]>=strobo_interval*2) then
				vehicles[vehicle]["lstate"] = 0
			else
				vehicles[vehicle]["lstate"] = vehicles[vehicle]["lstate"] + 1
			end
		end
		-- flash light
		if (vehicles[vehicle]["fmode"]=="lamp") then
		-- lamp mode
			local tmp_fstate = vehicles[vehicle]["fstate"]
			for key, value in pairs(vehicles[vehicle]["flist"]) do
				local R, G, B, A = getMarkerColor( value["m"] )
				setMarkerColor(value["m"], R, G, B, (math.sin(tmp_fstate+value["p"])+1.0)*128.0)
			end
			
			vehicles[vehicle]["fstate"] = vehicles[vehicle]["fstate"] + flash_interval
			
		else
		-- led mode
			local tmp_fstate = vehicles[vehicle]["fstate"]

			for key, value in pairs(vehicles[vehicle]["flist"]) do
				local R, G, B, A = getMarkerColor(value["m"])
				-- blinking mode
				local tmp_val = tmp_fstate+value["p"]
				if (tmp_val>blink_interval) then
					tmp_val = tmp_val - blink_interval
				end
				if ((tmp_val>=0)and(tmp_val<blink_duration))or((tmp_val>=blink_duration+1)and(tmp_val<blink_duration*2+1)) then
					setMarkerColor(value["m"], R, G, B, 255)
				else
					setMarkerColor(value["m"], R, G, B, 0)
				end
			end		
			vehicles[vehicle]["fstate"] = vehicles[vehicle]["fstate"] + 1
			if (vehicles[vehicle]["fstate"]>blink_interval) then
				vehicles[vehicle]["fstate"] = vehicles[vehicle]["fstate"] - blink_interval
			end
		end
	else
		-- if vehicle is no more exists
		release_vehicle2(vehicle)
	end
end

-- not used anymore
function stroboLightOn2()
    playerVehicle = getPedOccupiedVehicle ( getLocalPlayer()  )  -- get the player's vehicle

	--setElementData( playerVehicle, "emerlights_enabled", "true" )	-- debug
	
    if ( playerVehicle ) then
		-- if player is not a driver
		if (getLocalPlayer()~=getVehicleOccupant( playerVehicle )) then
			--outputChatBox("you're not a driver!")
			return
		end
		
		setStroboLightsOn(playerVehicle, nil)
    end
end

function isStroboLightsOn2 (vehicle_id)
	if (timers[vehicle_id]) then
		return 1
	else
		return 0
	end
end

function setStroboLightsOn2(vehicle_id, value)
    if ( vehicle_id ) then
		if (value==nil) then
			if (isStroboLightsOn(vehicle_id)==1) then
				value = 0
			else
				value = 1
			end;
		end;
		if (value==0) then
			if (timers[vehicle_id]) then
				release_vehicle2(vehicle_id)
				end
		end
		if (value==1) then
			if (timers[vehicle_id]) then
				release_vehicle2(vehicle_id)
			end
			-- create strobo timer
			timers[vehicle_id] = setTimer ( strobo_state_update2, base_freq, 0,  vehicle_id )
		end
    end
end

-- only local effect
function enableStroboLightsMode2(source, value)
	if (value=="0")or(value=="false") then
		is_strobo_enabled = false
		outputConsole("Stroboscopic mode disabled")
	else
		if (value=="1")or(value=="true") then
			is_strobo_enabled = true
			outputChatBox("Stroboscopic mode enabled")
		else
			outputChatBox("Usage: strobo 0 or strobo 1  for disable/enable stroboscopic lights mode")
		end
	end
end
addCommandHandler("strobo", enableStroboLightsMode2)

-- triggered by server
function setEmerlightsState2(value, state)
	local player = getPlayerFromName ( value )
	local vehicle = getPedOccupiedVehicle(player)
	if (vehicle) then
		setStroboLightsOn2(vehicle, state)
	end
end
addEvent("setEmerlights2", true)
addEventHandler("setEmerlights2", getRootElement(), setEmerlightsState2)

function requestEmerlights2()
	-- check for driver
    playerVehicle = getPedOccupiedVehicle (getLocalPlayer())  -- get the player's vehicle

    if (playerVehicle) then
		-- if player is not a driver
		if (getLocalPlayer()~=getVehicleOccupant( playerVehicle )) then
			--outputChatBox("you're not a driver!")
			return
		end
		if (checkForAbility2(playerVehicle)) then
			-- sync
			triggerServerEvent("requestEmerlightChangeState2", getLocalPlayer(), 1-isStroboLightsOn2(getPedOccupiedVehicle(getLocalPlayer())))
		else
			-- not able to use lights for this vehicle
				--outputChatBox("unknown car!")
		end
    end

end

addCommandHandler("Stopfelirat", requestEmerlights2)--stroboLightOn)
bindKey("4", "down", "Stopfelirat")

addEvent("onPlayerEmergencyLightStateChange2")
