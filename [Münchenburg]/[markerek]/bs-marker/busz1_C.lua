local  Playermarker = createMarker(-2035.900390625, -211.900390625, 34.299999237061, "cylinder", 1, 14, 245, 9, 255)

function createbus(hitElement,matchingDimension)

			local veh = createVehicle(431,-2024.5,-208.39999389648,35.700000762939)

		end


addEventHandler("onClientMarkerHit",Playermarker,function()bindKey("e","down", createbus)outputChatBox("Nyomja meg az 'E' gombot busz kivevéséhez")end)
 addEventHandler("onClientMarkerLeave", Playermarker, function() unbindKey("e", "down", createbus, false) end)
