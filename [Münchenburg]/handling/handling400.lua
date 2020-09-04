function vhandling ( theVehicle )
	outputChatBox("Elindult")

    if getElementModel(theVehicle) == 400 then -------------- vehicle Id
        --setVehicleHandling(theVehicle, "mass", 0.0 )
        --setVehicleHandling(theVehicle, "turnMass", 100)
        --setVehicleHandling(theVehicle, "dragCoeff", 4.0 )
        --setVehicleHandling(theVehicle, "centerOfMass", { 0.0,0.08,-0.09 } )
       -- setVehicleHandling(theVehicle, "percentSubmerged", 103)
        --setVehicleHandling(theVehicle, "tractionMultiplier", 1.8)
       -- setVehicleHandling(theVehicle, "tractionLoss", 0.9)
        --setVehicleHandling(theVehicle, "tractionBias", 0.48)
        setVehicleHandling(theVehicle, "numberOfGears", 5)
        setVehicleHandling(theVehicle, "maxVelocity",  	150.0)
        setVehicleHandling(theVehicle, "engineAcceleration", 10.0 )
        setVehicleHandling(theVehicle, "engineInertia", 5.0)
        setVehicleHandling(theVehicle, "driveType", "awd")
        setVehicleHandling(theVehicle, "engineType", "diesel")
        setVehicleHandling(theVehicle, "brakeDeceleration", 20.0)
        setVehicleHandling(theVehicle, "brakeBias", 0.60)
        -----abs----
        --setVehicleHandling(theVehicle, "steeringLock",  35.0 )
        --setVehicleHandling(theVehicle, "suspensionForceLevel", 0.85)
        --setVehicleHandling(theVehicle, "suspensionDamping", 0.15 )
      -- setVehicleHandling(theVehicle, "suspensionHighSpeedDamping", 0.0)
        --setVehicleHandling(theVehicle, "suspensionUpperLimit", 0.12)
       --setVehicleHandling(theVehicle, "suspensionLowerLimit", -0.16)
        --setVehicleHandling(theVehicle, "suspensionFrontRearBias", 0.5 )
        --setVehicleHandling(theVehicle, "suspensionAntiDiveMultiplier", 0.0)
        --setVehicleHandling(theVehicle, "seatOffsetDistance", 0.0)
        --setVehicleHandling(theVehicle, "collisionDamageMultiplier", 0.00)
        --setVehicleHandling(theVehicle, "monetary",  10000) This one is disabled for now
        --setVehicleHandling(theVehicle, "modelFlags", 1002000)
        --setVehicleHandling(theVehicle, "handlingFlags", 1000002)
       -- setVehicleHandling(theVehicle, "headLight", long ) 
        --setVehicleHandling(theVehicle, "tailLight", 2) This one is disabled for now
        --setVehicleHandling(theVehicle, "animGroup", 4) This one is disabled for now
    end
end

addEventHandler ( "onPlayerVehicleEnter", getRootElement(), vhandling )