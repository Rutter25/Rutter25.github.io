function vhandling ( theVehicle )

    if getElementModel(theVehicle) == 507 then -------------- vehicle Id
       --setVehicleHandling(theVehicle, "mass", 1400.0   )
       -- setVehicleHandling(theVehicle, "turnMass", 3000.0   )
        --etVehicleHandling(theVehicle, "dragCoeff", 2.0  )
        --setVehicleHandling(theVehicle, "centerOfMass", { 0.0 0.0 -0.20 } )
       -- setVehicleHandling(theVehicle, "percentSubmerged", 103)
        --setVehicleHandling(theVehicle, "tractionMultiplier", 0.75 )
       --setVehicleHandling(theVehicle, "tractionLoss", 0.89 0.50 )
        --setVehicleHandling(theVehicle, "tractionBias", 0.50)
        setVehicleHandling(theVehicle, "numberOfGears", 5)
        setVehicleHandling(theVehicle, "maxVelocity",  	3000.0)
        setVehicleHandling(theVehicle, "engineAcceleration", 2000.0 )
        setVehicleHandling(theVehicle, "engineInertia", 5.0)
        setVehicleHandling(theVehicle, "driveType", "rwd")
        setVehicleHandling(theVehicle, "engineType", "petrol")
        setVehicleHandling(theVehicle, "brakeDeceleration", 24.0)
        setVehicleHandling(theVehicle, "brakeBias", 0.60)
       -- abs true
        --setVehicleHandling(theVehicle, "steeringLock",  35.0 )
        --setVehicleHandling(theVehicle, "suspensionForceLevel", 0.85)
       -- setVehicleHandling(theVehicle, "suspensionDamping", 0.21 )
        -- setVehicleHandling(theVehicle, "suspensionHighSpeedDamping", 0.0)
       -- setVehicleHandling(theVehicle, "suspensionUpperLimit",  0.10 )
       -- setVehicleHandling(theVehicle, "suspensionLowerLimit", -0.16)
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