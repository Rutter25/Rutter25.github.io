outputChatBox("A garage script sikeresen lefutott.")

local garage1 = createObject(969, -2016.6999511719,59.400001525879, 29, 0, 353, 270)

local open = false
local masikopen = false
local which = 0

function hasznalasgate(thePlayer)
	local x, y, z = getElementPosition(thePlayer)
	local distance1 = getDistanceBetweenPoints3D(-2016.6999511719,59.400001525879, 29, x,y,z)
	local distance2 = getDistanceBetweenPoints3D(-2016.6999511719,59.400001525879, 29, x, y, z)

	if (distance1<=10) and (open==false) then
			open = true
			which = 1
			outputChatBox("#FF0000 A kapu #FFFF00 nyitva!", thePlayer, 0, 0, 0, true)
			moveObject(garage1, 1000, -2016.6999511719,51, 30, 0, 0, 0)
			setTimer(bezarasgate, 5000, 1, thePlayer)
	-- elseif (distance2<=10) and (open==false) then
			-- open = true
			-- which = 2
			-- outputChatBox("Sorompó nyitva!", thePlayer, 0, 255, 0)
			-- moveObject(objGateh2, 1000, 617.0810546875, -1510.084765625, 14.801913604736, 0, -90, 0)
			-- setTimer(bezarasgate, 5000, 1, thePlayer)
	end
end
addCommandHandler("gate", hasznalasgate)

function bezarasgate(thePlayer)
	setTimer(resetState7, 1000, 1)
	if (which==1) then
		which = 0
		moveObject(garage1, 1000, -2016.6999511719,59.400001525879, 29, 0, 0, 0)
--	elseif (which==2) then
--		which = 0
--		moveObject(garázs2, 1000, 617.0810546875, -1510.084765625, 14.801913604736, 0, 90, 0)
	end
end

function resetState7()
	open = false
end

function showgateblip()

	gate1blip = createBlip(-1572.7998046875, 657, 6.1999998092651, 14)
end
addCommandHandler("showblip", showgateblip)

function destroygateblip()

	destroyElement(gate1blip)
	
end
addCommandHandler("destroyblip", destroygateblip)
		