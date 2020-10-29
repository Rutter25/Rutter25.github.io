--[[ Credits to author: https://wiki.multitheftauto.com/wiki/Resource:DxDraw3DText ]]--

function dxDraw3DText(text, x, y, z, scale, font, color, maxDistance, colorCoded)
	if not (x and y and z) then
		outputDebugString("dxDraw3DText: One of the world coordinates is missing", 1);
		return false;
	end

	if not (scale) then
		scale = 2;
	end
	
	if not (font) then
		font = "default";
	end
	
	if not (color) then
		color = tocolor(255, 255, 255, 255);
	end
	
	if not (maxDistance) then
		maxDistance = 12;
	end
	
	if not (colorCoded) then
		colorCoded = false;
	end
	
	local pX, pY, pZ = getElementPosition( localPlayer );	
	local distance = getDistanceBetweenPoints3D(pX, pY, pZ, x, y, z);
	
	if (distance <= maxDistance) then
		local x, y = getScreenFromWorldPosition(x, y, z);
		
		if (x and y) then
			dxDrawText( text, x, y, _, _, color, scale, font, "center", "center", false, false, false, colorCoded);
			return true;
		end
	end
end