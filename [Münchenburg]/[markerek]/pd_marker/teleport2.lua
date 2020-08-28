local marker2 = createMarker (1515, -1574.9000244141, 29.3, "arrow", 1.5, 239, 247, 7, 255) 

function teleport2(ped)
	if ped == localPlayer then

	        setElementPosition(ped, -1608, 672, -4.7)

	      
	     	setPedRotation (ped, 0) 

 	     
 	    	
	end
end

addEventHandler("onClientMarkerHit", marker2, teleport2)   