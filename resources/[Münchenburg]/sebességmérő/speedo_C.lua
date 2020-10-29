local screenX, screenY = guiGetScreenSize() 
local myFont = dxCreateFont ( "font.ttf",20 )
local smothedRotation = 0


lightState = 0
localPlayer = getLocalPlayer ()

addEventHandler("onClientVehicleEnter", getRootElement(),
    function(thePlayer, seat)
        if thePlayer == getLocalPlayer() then
			if seat == 0 then
				bindKey ( "l", "down", showLightState_panel )
				--addEventHandler("onClientRender",root, showPanel_main ) 
				lightState = getVehicleOverrideLights ( source ) or 0
			end
		end
    end
)

addEventHandler("onClientVehicleExit", getRootElement(),
    function(thePlayer, seat)
        if thePlayer == getLocalPlayer() then
			if seat == 0 then
			--	removeEventHandler("onClientRender",root, showPanel_main )
				unbindKey ( "l", "down" )
		       
end
        end
    end
)



function drawNeedle( vehicle, seat)
	if not getPedOccupiedVehicle ( localPlayer ) then
		 bindKey ( "á", "up",drawNeedle)
		lightState = 0
		return true
	end
		if isPedInVehicle(getLocalPlayer())then 
			local veh = getElementSpeed(getPedOccupiedVehicle(getLocalPlayer()), "kmh")
			local engine = (getPedOccupiedVehicle(getLocalPlayer()))
			if not veh then return end
			local vehicleSpeed = getVehicleSpeed()
			local rot = math.floor(((220/12800)* getVehicleRPM(getPedOccupiedVehicle(getLocalPlayer()))) + 0.5)
			local fuel = getElementData(getPedOccupiedVehicle ( localPlayer ), "fuel" ) or 0
		if (smothedRotation < rot) then
			smothedRotation = smothedRotation + 1.5
		end
		if (smothedRotation > rot) then
			smothedRotation = smothedRotation - 1.5
		end
			
		if vehicleSpeed > 500 then
			vehicleSpeed = 500
		end
		if vehicleSpeed < -252 then
			vehicleSpeed = -252
		end
			dxDrawImage(screenX-320, screenY-220,314,220,"img/panel.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
			dxDrawImage(screenX-216, screenY-209,200,200,"img/arrowSpeedometer.png",vehicleSpeed-0,0.0,0.0,tocolor(255,255,255,255),false)
			dxDrawImage(screenX-313, screenY-188,158,158,"img/arrowTachometer.png",smothedRotation,0.0,0.0,tocolor(255,255,255,255),false)
			dxDrawText(""..tostring ( getFormatSpeed ( veh ) ).."", screenX-142, screenY-128, 170, 300,tocolor ( 255,255,255 ),1,myFont)
			dxDrawText(""..tostring ( getFormatFuel(math.round  (fuel))).."", screenX-131, screenY-100, 170, 300,tocolor ( 255,255,255 ),0.6,myFont)
			dxDrawImage(screenX-180, screenY-53,23,26,"img/strafeLeftOff.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
			dxDrawImage(screenX-73, screenY-53,23,26,"img/strafeRightOff.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
			
		if ( vehicleSpeed == 0 ) then
			dxDrawText(getFormatNeutral().."", screenX-246, screenY-128, 170, 300,tocolor ( 255,255,255 ),1,myFont)
		else
			dxDrawText(getFormatGear().."", screenX-246, screenY-128, 170, 300,tocolor ( 255,255,255 ),1,myFont)
		end
	
		if ( getVehicleEngineState (engine) == true ) then
			dxDrawImage(screenX-125, screenY-33,23,26,"img/engineOn.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
		else
			dxDrawImage(screenX-125, screenY-33,23,26,"img/engineOff.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
		end
	
		if lightState == 0 or lightState == 1 then
			dxDrawImage(screenX-154, screenY-40,23,26,"img/lightOff.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
		else
			dxDrawImage(screenX-154, screenY-40,23,26,"img/lightOn.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
		end
			
		if getElementData(getPedOccupiedVehicle ( localPlayer ), "é" ) then
			if ( getTickCount () % 1400 >= 400 ) then
				dxDrawImage(screenX-180, screenY-53,23,26,"img/strafeLeftOn.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
			end
		end
			
		if getElementData(getPedOccupiedVehicle ( localPlayer ), "p" ) then
			if ( getTickCount () % 1400 >= 400 ) then
				dxDrawImage(screenX-73, screenY-53,23,26,"img/strafeRightOn.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
			end
		end
			
		local theVehicle = getPedOccupiedVehicle ( localPlayer )
		if ( theVehicle ) then
			if ( enablelock ) and ( isVehicleLocked( theVehicle ) ) or ( getElementData( theVehicle, "cl_vehiclelocked" ) ) then
				dxDrawImage(screenX-95, screenY-35,13,15,"img/lock.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
			else
				dxDrawImage(screenX-95, screenY-35,13,15,"img/open.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
            end
		end
	end
end
addEventHandler("onClientRender", getRootElement(), drawNeedle)

function showLightState_panel ()
	if lightState == 0 or lightState == 1 then
		lightState = 2
		setVehicleOverrideLights( getPedOccupiedVehicle ( localPlayer ), 2 )
	else
		setVehicleOverrideLights( getPedOccupiedVehicle ( localPlayer ), 1 )
		lightState = 0
	end
end

--- Стрелка спидометра
function getVehicleSpeed()
    if isPedInVehicle(getLocalPlayer()) then
	    local theVehicle = getPedOccupiedVehicle (getLocalPlayer())
        local vx, vy, vz = getElementVelocity (theVehicle)
        return math.sqrt(vx^2 + vy^2 + vz^2) * 225
    end
    return 0
end

function getElementSpeed(element,unit)
    if (unit == nil) then unit = 0 end
    if (isElement(element)) then
        local x,y,z = getElementVelocity(element)
        if (unit=="mph" or unit==1 or unit =='1') then
            return math.floor((x^2 + y^2 + z^2) ^ 0.5 * 100)
        else
            return math.floor((x^2 + y^2 + z^2) ^ 0.5 * 100 * 1.609344)
        end
    else
        return false
    end
end

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end

-- Скорость 
function getFormatSpeed(unit)
    if unit < 10 then
        unit = "00" .. unit
    elseif unit < 100 then
        unit = "0" .. unit
    elseif unit >= 1000 then
        unit = "999"
    end
    return unit
end
-- бензин
function getFormatFuel(unit)
    if unit < 10 then
        unit = "00" .. unit
    elseif unit < 100 then
        unit = "0" .. unit
    elseif unit >= 1000 then
        unit = "999"
    end
    return unit
end
-- передачи и задняя
function getFormatGear()
    local gear = getVehicleCurrentGear(getPedOccupiedVehicle(getLocalPlayer()))
    local rear = "R"
	local neutral = "N"
    if (gear > 0) then 
        return gear
    else
        return rear
    end
end
-- нетральная передача
function getFormatNeutral()
	local neutral = "N"
	return neutral
end
-- тахометр 
function getVehicleRPM(vehicle)
local vehicleRPM = 0
    if (vehicle) then  
        if (getVehicleEngineState(vehicle) == true) then
            if getVehicleCurrentGear(vehicle) > 0 then             
                vehicleRPM = math.floor(((getElementSpeed(vehicle, "kmh")/getVehicleCurrentGear(vehicle))*360) + 0.5) 
                if (vehicleRPM < 650) then
                    vehicleRPM = math.random(650, 750)
                elseif (vehicleRPM >= 9800) then
                    vehicleRPM = math.random(9800, 9900)
                end
            else
                vehicleRPM = math.floor((getElementSpeed(vehicle, "kmh")*180) + 0.5)
                if (vehicleRPM < 650) then
                    vehicleRPM = math.random(650, 750)
                elseif (vehicleRPM >= 9800) then
                    vehicleRPM = math.random(9800, 9900)
                end
            end
        else
            vehicleRPM = 0
        end
        return tonumber(vehicleRPM)
    else
        return 0
    end
end


