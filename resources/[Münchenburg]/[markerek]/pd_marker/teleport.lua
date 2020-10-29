local marker1 = createMarker (-1606.3000488281, 672.40002441406, -4.6999998092651, "arrow", 1.5, 239, 247, 7, 255) 

function teleport1(ped)
	if ped == localPlayer then

	        setElementPosition(ped, 1513, -1574, 29.3)

	      
	     	setPedRotation (ped, 0) 

 	     
 	    	

	end
end

addEventHandler("onClientMarkerHit", marker1, teleport1)   