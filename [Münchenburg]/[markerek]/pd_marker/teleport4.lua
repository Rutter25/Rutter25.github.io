local marker4 = createMarker (-1605.5, 713, 14.4, "arrow", 1.5, 239, 247, 7, 255) 

function teleport4(ped)
	if ped == localPlayer then

	        setElementPosition(ped, 1483.5, -1558, 33.4)
	      	setPedRotation (ped, 0) 

 	     
 	    	
	end
end

addEventHandler("onClientMarkerHit", marker4, teleport4)   