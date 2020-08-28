local sx, sy = guiGetScreenSize(); -- Játék felbontásának lekérdezése
local relX, relY = sx/1920, sy/1080; -- Relatív értékek kiszámolása

setPlayerHudComponentVisible("armour", false); -- Eredeti páncél csík eltűntetése
setPlayerHudComponentVisible("clock", false); -- Eredeti óra eltűnteteése
setPlayerHudComponentVisible("health", false); -- Eredeti élet csík eltűnteteése
setPlayerHudComponentVisible("money", false); -- Eredeti pénz eltűntetése

local isHudVisible = true; -- Hud láthatóságát megszabó változó

local previousHp = getElementHealth(localPlayer); -- Előző élet érték

addEventHandler("onClientPlayerDamage", localPlayer,
	function(_, _, _, loss)
		local hp = getElementHealth(localPlayer);
		previousHp = hp+loss; -- Előző élet érték kiszámolása
	end
);

addEventHandler("onClientRender", root,
	function()
		if (isHudVisible) then

			local hp = getElementHealth(localPlayer); -- Játékos életerejének lekérdezése

			if (previousHp > hp) then -- Ha előző élet erő több mint a mostani akkor
				previousHp = previousHp-0.09; -- előző életerő = előző életerő -0.09
			else
				previousHp = hp; 
			end

			local armor = getPedArmor(localPlayer); -- Játékos páncéljának lekérése
			local stamina = getElementData(localPlayer, "stamina"); -- Játékos fáradtságának lekérése

			dxDrawRectangle(sx*0.85, sy*0.08, sx*0.14, sy*0.04, tocolor(0, 0, 0, 100), false ); -- Életerő csík háttér

			for i=0, 9, 1 do
				dxDrawLine(sx*(0.855+(i*0.013)), sy*0.115, sx*(0.868+(i*0.013)), sy*0.085, tocolor(70, 70, 70, 255), 1, false ); -- Vonalak az életcsík alatt
			end

			dxDrawRectangle(sx*0.855, sy*0.085, sx*(0.13*(previousHp/100)), sy*0.03, tocolor(200, 0, 0, 220), false ); -- Életerő csík
			dxDrawText(math.floor(previousHp).."%", sx*(0.855), sy*0.085, sx*(0.855+(0.13*(previousHp/100))), sy*0.115, tocolor(255, 255, 255, 255), relX*1, relY*1, "default-bold", "center", "center", true, false, false ); -- Életcsík szám-érték

			dxDrawRectangle(sx*0.85, sy*0.08, sx*(0.14*(armor/100)), sy*0.04, tocolor(50, 50, 50, 200), false); -- Páncél csík
			dxDrawText(math.floor(armor).."%", sx*(0.85), sy*0.08, sx*(0.85+(0.14*(armor/100))), sy*0.12, tocolor(255, 255, 255, 255), relX*1, relY*1, "default-bold", "center", "center", true, false, false ); -- Páncél csík szám-érték

			dxDrawRectangle(sx*0.85, sy*0.12, sx*(0.14*(stamina/100)), sy*0.01, tocolor(0, 191, 255, 240), false); -- Páncél csík

			dxDrawText(getPlayerMoney(localPlayer).."$", sx*(0.85), sy*0.14, sx*0.99, sy*0.19, tocolor(255, 255, 255, 255), relX*3, relY*3, "default-bold", "right", "center", false, false, false ); -- Pénz

			local h, m = getTime(); -- IG idő lekérdezése

			if (string.len(h) == 1) then
				h = "0"..h; -- Ha egy karakteres az óra értéke, akkor rakjunk elé egy 0-t
			end

			if (string.len(m) == 1) then
				m = "0"..m; -- Ugyan az mint az óra csak a perccel
			end

			dxDrawText(h..":"..m, sx*(0.85), 0, sx*0.99, sy*0.1, tocolor(255, 255, 255, 255), relX*3, relY*3, "default-bold", "center", "center", false, false, false ); -- Idő

		end
	end
);

function toggleMyHud()
	isHudVisible = not isHudVisible; -- isHudVisible legyen az isHudVisible ellentéte
end
addCommandHandler("toghud", toggleMyHud, false, false);