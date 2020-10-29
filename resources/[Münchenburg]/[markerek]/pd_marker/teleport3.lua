local marker3 = createMarker (1483.5, -1555.7, 33.5, "arrow", 1.5, 239, 247, 7, 255) 

function teleport3(ped)
	if ped == localPlayer then

	        setElementPosition(ped, -1605, 715, 14)
	     	setPedRotation (ped, 0) 

 	     
 	    	
	end
end

addEventHandler("onClientMarkerHit", marker3, teleport3)  