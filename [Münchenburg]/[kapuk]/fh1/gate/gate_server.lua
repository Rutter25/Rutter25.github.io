local garage1 = createObject(3049, -1399,-1468.4000244141, 103, 0, 0, 90)
local garage2 = createObject(3050, -1399,-1477.6, 103, 0, 0, 270)
local open = false
local masikopen = false
local which = 0

function hasznalasgate(thePlayer)
	local x, y, z = getElementPosition(thePlayer)
	local distance1 = getDistanceBetweenPoints3D(-1399,-1468.099609375, 103, x,y,z)
	local distance2 = getDistanceBetweenPoints3D(-1399,-1477.6, 103, x,y,z)

	if (distance1<=7) and (open==false) then
			open = true
			which = 1
			outputChatBox("#FF0000 A kapu #FFFF00 nyitva!", thePlayer, 0, 0, 0, true)
			moveObject(garage1, 1000,-1399,-1468.4000244141, 103, 0, 0, -90)
			moveObject(garage2, 1000,-1399,-1477.6, 103, 0, 0,90)
			setTimer(bezarasgate, 5000, 1, thePlayer)
		elseif 
			(distance2<=7) and (open==false) then
			open = true
			which = 1
			outputChatBox("#FF0000 A kapu #FFFF00 nyitva!", thePlayer, 0, 0, 0, true)
			moveObject(garage1, 1000,-1399,-1468.4000244141, 103,  0, 0, -90)
			moveObject(garage2, 1000,-1399,-1477.6, 103, 0, 0,90)
			setTimer(bezarasgate, 5000, 1, thePlayer)
		
	end
end

addCommandHandler("gate", hasznalasgate)

function bezarasgate(thePlayer)
	outputChatBox("zár")
	setTimer(resetState7, 1000, 1)
	if (which==1) then
		which = 0
		moveObject(garage1, 1000, -1399,-1468.4000244141, 103,  0, 0, 90)
		moveObject(garage2, 1000, -1399,-1477.6, 103, 0, 0, -90)
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
