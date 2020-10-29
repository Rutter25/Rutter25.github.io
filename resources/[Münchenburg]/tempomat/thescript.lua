-- change it to false to allow all vehicles to use cruise control (seems stupid for bmx etc)
limit = true

-- cruise control key. it needs to be valid key otherwise script will not work.
key = "k"


--[[
If limit is true, it will limit cruise control to these types of vehicles.
NOTICE: Cruise control IS NOT working with planes!
NOTICE: There is something wrong with monster truck and isVehicleOnGround - i suggest not to use it with monster.
Possible values; after : there is little explaination

Automobile: Cars, vans and trucks 
Plane 
Bike: Motorbikes 
Helicopter 
Boat 
Train 
Trailer: A trailer for a truck 
BMX 
Monster Truck 
Quad: Quadbikes
--]]
allowedTypes = { "Automobile", "Bike", "Boat", "Train" }




--[[


    DO NOT TOUCH ANYTHING BELOW
 
 
]]---





-----------------------------------------------------------------------------------




-- cruise control by dzek

function getElementSpeed(element,unit)
	if (unit == nil) then unit = 0 end
	if (isElement(element)) then
		local x,y,z = getElementVelocity(element)
		if (unit=="mph" or unit==1 or unit =='1') then
			return (x^2 + y^2 + z^2) ^ 0.5 * 100
		else
			return (x^2 + y^2 + z^2) ^ 0.5 * 1.61 * 100
		end
	else
		outputDebugString("Not an element. Can't get speed")
		return false
	end
end

function setElementSpeed(element, unit, speed) -- only work if element is moving!
	if (unit == nil) then unit = 0 end
	if (speed == nil) then speed = 0 end
	speed = tonumber(speed)
	local acSpeed = getElementSpeed(element, unit)
	if (acSpeed~=false) then -- if true - element is valid, no need to check again
		local diff = speed/acSpeed
		local x,y,z = getElementVelocity(element)
		setElementVelocity(element,x*diff,y*diff,z*diff)
		return true
	else
		return false
	end
end

function in_array(e, t)
	for _,v in pairs(t) do
		if (v==e) then return true end
	end
	return false
end

function round2(num, idp)
  return tonumber(string.format("%." .. (idp or 0) .. "f", num))
end


function angle(vehicle)
	local vx,vy,vz = getElementVelocity(vehicle)
	local modV = math.sqrt(vx*vx + vy*vy)
	
	if not isVehicleOnGround(vehicle) then return 0,modV end
	
	local rx,ry,rz = getElementRotation(vehicle)
	local sn,cs = -math.sin(math.rad(rz)), math.cos(math.rad(rz))
	
	-- if modV <= 0.2 then return 0,modV end --speed over 40 km/h
	
	local cosX = (sn*vx + cs*vy)/modV
	--if cosX > 0.966 or cosX < 0 then return 0,modV end --angle between 15 and 90 degrees
	return math.deg(math.acos(cosX))*0.5, modV
end

lp = getLocalPlayer()
ccEnabled = false

myveh = false
targetSpeed = 1
multiplier = 1

function cc()
	if (not isElement(myveh)) then
		removeEventHandler("onClientRender", getRootElement(), cc)
		ccEnabled=false
		outputChatBox("#FFFFFF[Tempomat] #00C0FFKikapcsolva", 255,255,255,true)
		return false
	end
	local x,y = angle(myveh)
	-- outputChatBox(x)
	if (x<15) then
		local speed = getElementSpeed(myveh)
		local targetSpeedTmp = speed + multiplier
		if (targetSpeedTmp > targetSpeed) then
			targetSpeedTmp = targetSpeed
		end
		if (targetSpeedTmp > 3) then
			setElementSpeed(myveh, "k", targetSpeedTmp)
		end
	end
end

bindKey(key, "up", function()
	local veh = getPedOccupiedVehicle(lp)
	if (veh) then
		if (lp==getVehicleOccupant(veh)) then
			myveh = veh
			if (ccEnabled) then
				removeEventHandler("onClientRender", getRootElement(), cc)
				ccEnabled=false
				outputChatBox("#FFFFFF[Tempomat] #00C0FFKikapcsolva", 255,255,255,true)
			else
				targetSpeed = getElementSpeed(veh)
				if targetSpeed > 4 then
					if (limit) then
						if in_array(getVehicleType(veh), allowedTypes) then
							targetSpeed = round2(targetSpeed)
							outputChatBox("#FFFFFF[Tempomat] #00C0FFBekapcsolva ennél a sebességnél #FFFFFF"..targetSpeed.."km/h", 255,255,255,true)
							addEventHandler("onClientRender", getRootElement(), cc)
							ccEnabled=true				
						end
					else
						targetSpeed = round2(targetSpeed)
						outputChatBox("** Cruise Control #00ff00enabled #ffffff at #ffff00"..targetSpeed.."km/h", 255,255,255,true)
						addEventHandler("onClientRender", getRootElement(), cc)
						ccEnabled=true
					end
				end
			end
		end
	end
end)

addEventHandler("onClientPlayerVehicleExit", getLocalPlayer(), function(veh, seat)
	if (seat==0) then
		if (ccEnabled) then
			removeEventHandler("onClientRender", getRootElement(), cc)
			ccEnabled=false
			outputChatBox("#FFFFFF[Tempomat] #00C0FFKikapcsolva", 255,255,255,true)
		end
	end
end)

-- cruise control by dzek