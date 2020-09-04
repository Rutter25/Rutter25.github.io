﻿function vhandling ( theVehicle )
	outputChatBox("Elindult")

    if getElementModel(theVehicle) == 427 then -------------- vehicle Id
       outputChatBox("96")
       -- setVehicleHandling(theVehicle, "mass", 300.0)
        --setVehicleHandling(theVehicle, "turnMass", 100)
        --setVehicleHandling(theVehicle, "dragCoeff", 4.0 )
        --setVehicleHandling(theVehicle, "centerOfMass", { 0.0,0.08,-0.09 } )
       -- setVehicleHandling(theVehicle, "percentSubmerged", 103)
        --setVehicleHandling(theVehicle, "tractionMultiplier", 1.8)
        --setVehicleHandling(theVehicle, "tractionLoss", 1.0)
        --setVehicleHandling(theVehicle, "tractionBias", 0.48)
        setVehicleHandling(theVehicle, "numberOfGears", 5)
        setVehicleHandling(theVehicle, "maxVelocity",  	300.0)
        setVehicleHandling(theVehicle, "engineAcceleration", 13.0 )
        setVehicleHandling(theVehicle, "engineInertia", 5.0)
        setVehicleHandling(theVehicle, "driveType", "fwd")
        setVehicleHandling(theVehicle, "engineType", "diesel")
        setVehicleHandling(theVehicle, "brakeDeceleration", 10000 )
        setVehicleHandling(theVehicle, "brakeBias", 1)
        -----abs----
        --setVehicleHandling(theVehicle, "steeringLock",  35.0 )
        --setVehicleHandling(theVehicle, "suspensionForceLevel", 0.85)
        --setVehicleHandling(theVehicle, "suspensionDamping", 0.15 )
      --  setVehicleHandling(theVehicle, "suspensionHighSpeedDamping", 0.0)
      --  setVehicleHandling(theVehicle, "suspensionUpperLimit", 0.15 )
        --setVehicleHandling(theVehicle, "suspensionLowerLimit", -0.16)
        --setVehicleHandling(theVehicle, "suspensionFrontRearBias", 0.5 )
        --setVehicleHandling(theVehicle, "suspensionAntiDiveMultiplier", 0.0)
        --setVehicleHandling(theVehicle, "seatOffsetDistance", 0.0)
        --setVehicleHandling(theVehicle, "collisionDamageMultiplier", 0.00)
        --setVehicleHandling(theVehicle, "monetary",  10000) This one is disabled for now
        --setVehicleHandling(theVehicle, "modelFlags", 1002000)
        --setVehicleHandling(theVehicle, "handlingFlags", 1000002)
        --setVehicleHandling(theVehicle, "headLight", 3) This one is disabled for now
        --setVehicleHandling(theVehicle, "tailLight", 2) This one is disabled for now
        --setVehicleHandling(theVehicle, "animGroup", 4) This one is disabled for now
    end
end

addEventHandler ( "onPlayerVehicleEnter", getRootElement(), vhandling )