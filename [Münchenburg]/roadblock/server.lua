local activeRoadBlocks = {};

addEvent("createRoadBlock", true);
addEventHandler("createRoadBlock", resourceRoot,
	function(model, pos, rot)
		table.insert(activeRoadBlocks, createObject(model, pos[1], pos[2], pos[3], rot[1], rot[2], rot[3]));
	end
);

function getRoadBlockName(modelID)
	for j, v in ipairs(roadBlocks) do -- Megkeressük a megnevezését
		if (v[2] == modelID) then
			return v[1];
		end
	end
end

function getRoadBlocks(player, cmd)
	local x,y,z = getElementPosition(player); -- Játékos poziciója
	local tempColShape = createColSphere(x,y,z, 5); -- Ideiglenes colShape
	outputChatBox(string.rep("-=", 8), player);
	for i, roadBlock in ipairs(activeRoadBlocks) do -- Minden egyes útzárra az útzárak tömbben
		local inColShape = isElementWithinColShape(roadBlock, tempColShape);
		if (inColShape) then -- Ha az adott útzár az ideiglenes colShape-ben van
			local model = getElementModel(roadBlock); -- Lekérdezzük a modeljét
			local name = getRoadBlockName(model);
			outputChatBox("Útzár [ID: "..i.." Típus: "..name.."]", player);
		end
	end
	outputChatBox(string.rep("-=", 8), player);
end
addCommandHandler("getRbs", getRoadBlocks, false, false);

function deleteRoadBlock(player, cmd, id)
	id = tonumber(id);
	local objectToDelete = activeRoadBlocks[id];
	table.remove(activeRoadBlocks, id);
	local name = getRoadBlockName(getElementModel(objectToDelete));
	destroyElement(objectToDelete);
	outputChatBox("Útzár [ID: "..id.." Típus: "..name.."] törölve lett.", player);
end
addCommandHandler("delrb", deleteRoadBlock, false, false);

function delAllRoadBlocks(player, cmd)
	for i, roadBlock in ipairs(activeRoadBlocks) do
		destroyElement(roadBlock);
	end
	activeRoadBlocks = {};
	outputChatBox("Az összes útzár törölve!", player);
end
addCommandHandler("delallrbs", delAllRoadBlocks, false, false);