local sx, sy = guiGetScreenSize();
local relX, relY = sx/1920, sy/1080;

local localCamera = getCamera();

local isSelectorVisible = false; -- Az ablak láthatósága
local selectedRoadBlock = 1; -- A kiválasztott sor

local tempObject; -- Az objectünk kliens oldalon
local isPlacementActive = false; -- Elhelyezés mód

addEventHandler("onClientRender", root,
	function()
		local height = (#roadBlocks*0.05) + 0.05;
		if (isSelectorVisible) then
			dxDrawRectangle(sx*0.425, sy*(0.5-height/2), sx*0.15, sy*0.05, tocolor(100, 110, 120, 255), false); -- Fejléc
			dxDrawLine(sx*0.425, sy*(0.55-height/2), sx*0.575, sy*(0.55-height/2), tocolor(255, 255, 255, 255), 5, false); -- Elválasztó vonal
			dxDrawText("Útzár választó", sx*0.425, sy*(0.5-height/2), sx*0.575, sy*(0.55-height/2), tocolor(255, 255, 255, 255), relX*2, relY*2, "default-bold", "center", "center", false, false, false, false);
			dxDrawRectangle(sx*0.425, sy*(0.55-height/2), sx*0.15, sy*(height-0.05), tocolor(100, 150, 0, 255), false); -- Háttér
			
			for i, v in ipairs(roadBlocks) do
				local color; -- A sorok háttereinek színe
				if (selectedRoadBlock == i) then
					color = tocolor(0, 0, 175, 100);
				else
					if (i%2 == 0) then
						color = tocolor(255, 255, 255, 40);
					else
						color = tocolor(0, 0, 0, 40);
					end
				end
				dxDrawRectangle(sx*0.425, sy*((0.5-height/2)+i*0.05), sx*0.15, sy*0.05, color, false); -- A sorok hátterei
				dxDrawText(v[1], sx*0.425, sy*((0.55-height/2)+i*0.05), sx*0.575, sy*((0.5-height/2)+i*0.05), tocolor(255, 255, 255, 255), relX*1.5, relY*1.5, "default-bold", "center", "center", false, false, false, false); -- A szöveg
			end
		end
		
		if (isPlacementActive and isCursorShowing()) then
			local cX, cY, wX, wY, wZ = getCursorPosition(); -- A kurzor poziciójának lekérdezése
			local camX, camY, camZ = getElementPosition(localCamera); -- A kamera poziciójának lekérdezése
			local isHit, hitX, hitY, hitZ = processLineOfSight(camX, camY, camZ, wX, wY, wZ, true, false, false, false, false, false, true, true, tempObject, false, false); -- Raycast a kamera és a kurzor között
			if (isHit) then
				local z = getGroundPosition(hitX, hitY, hitZ);
				setElementPosition(tempObject, hitX, hitY, z+0.35);
			end
		end
	end
);

addEventHandler("onClientKey", root,
	function(key, pOr)
		if (isSelectorVisible) then
			if (pOr) then -- Ha a gombot éppen lenyomják
				if (key == "arrow_d") then -- Ha a lefele nyilat nyomták
					if (selectedRoadBlock < #roadBlocks) then
						selectedRoadBlock = selectedRoadBlock+1;
					end
				elseif (key == "arrow_u") then -- Ha a felfele nyilat nyomták
					if (selectedRoadBlock > 1) then
						selectedRoadBlock = selectedRoadBlock-1;
					end
				elseif ( (key == "enter") or (key == "num_enter") ) then -- Ha az entert nyomták meg
					isPlacementActive = true; -- Engedélyezzük az elhelyezést
					isSelectorVisible = false; -- Kikapcsoljuk a választót
					guiSetInputEnabled(false);
					tempObject = createObject(roadBlocks[selectedRoadBlock][2], 0, 0, 0); -- Létrehozzuk az útzárat
					setElementCollisionsEnabled(tempObject, false); -- Kikapcsoljuk az object collisionjét
				elseif (key == "backspace") then
					toggleRoadBlockMenu();
				end
			end
		end
		
		if (isPlacementActive) then -- Ha elhelyezés módban vagyunk
			if (key == "mouse_wheel_up") then -- Ha a görgőt felfele tekerjük
				local rx, ry, rz = getElementRotation(tempObject);
				setElementRotation(tempObject, rx, ry, rz+5);
			elseif (key == "mouse_wheel_down") then -- Ha a görgőt lefele tekerjük
				local rx, ry, rz = getElementRotation(tempObject);
				setElementRotation(tempObject, rx, ry, rz-5);
			end
			
			if (key == "backspace" and not pOr) then -- Ha a törlés gombot felengedték
				isPlacementActive = false; -- Az elhelyezés módot kikapcsoljuk
				destroyElement(tempObject); -- Megsemmisítjük az ideiglenes objectet
				tempObject = nil; -- Töröljük a tempObject változót (a biztonság kedvéért)
				isSelectorVisible = true; -- Vissza kapcsoljuk a választót
				guiSetInputEnabled(true);
			end
		end
	end
);

addEventHandler("onClientClick", root,
	function(button, state)
		if (isPlacementActive) then -- Ha az elhelyezés mód aktív
			if (button == "left") then -- Ha bal egér gomb
				if (state == "up") then -- Ha éppen felengedjük
					if not (getKeyState("lshift") or getKeyState("rshift")) then -- Ha a shift NINCS lenyomva
						isPlacementActive = false; -- Kikapcsoljuk az elhelyezés módot
						local model = getElementModel(tempObject);
						local x,y,z = getElementPosition(tempObject);
						local rx, ry, rz = getElementRotation(tempObject);
						triggerServerEvent("createRoadBlock", resourceRoot, model, {x,y,z}, {rx,ry,rz});
						destroyElement(tempObject);
						tempObject = nil;
					else
						local model = getElementModel(tempObject);
						local x,y,z = getElementPosition(tempObject);
						local rx, ry, rz = getElementRotation(tempObject);
						triggerServerEvent("createRoadBlock", resourceRoot, model, {x,y,z}, {rx,ry,rz});
					end
				end
			end
		end
	end
);

function toggleCursor()
	showCursor(not isCursorShowing());
end
bindKey("m", "down", toggleCursor);

function toggleRoadBlockMenu()
	if (isSelectorVisible) then
		guiSetInputEnabled(false);
	else
		guiSetInputEnabled(true);
	end
	isSelectorVisible = not isSelectorVisible;
end
addCommandHandler("rb", toggleRoadBlockMenu, false);