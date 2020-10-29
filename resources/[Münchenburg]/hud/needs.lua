setElementData(localPlayer, "stamina", 100); -- A helyi játékos staminája legyen 100

addEventHandler("onClientPreRender", root,
	function(deltaTime)
		local stamina = getElementData(localPlayer, "stamina"); -- Játékos fárdatságának lekérdezése
		local moveState = getPedMoveState(localPlayer); -- Játékos mozgási állapotának lekérdezése
		if (moveState == "sprint") then -- Ha a játékos fut
			if (stamina > 0) then -- Ha a fáradtsága több mint 0
				stamina = stamina-(0.01*deltaTime); -- Fáradtság legyen kevesebb
			else -- Egyébként
				stamina = 0; -- 0
			end
		else -- Egyébként
			if (stamina < 100) then -- Ha fáradtság kevesebb mint 100
				stamina = stamina+(0.005*deltaTime); -- Fáradtság legyen több
			else
				stamina = 100;
			end
		end

		if (stamina < 10) then -- Ha fáradtság kevesebb mint 10
			toggleAllControls(false, true); -- Az összes irányítás kikapcsolása
			setTimer(setPedAnimation, 100, 1, localPlayer, "fat", "idle_tired"); -- Fáradtság animáció
		elseif (stamina > 30) then -- Ha fáradtság több mint 30
			toggleAllControls(true, true); -- Irányítások bekapcsolása
			setPedAnimation(localPlayer); -- Animáció kikapcsolása
		end

		setElementData(localPlayer, "stamina", stamina); -- Új stamina beállítása
	end
);