local cache = {}
local route_map = {}
local travelled_amount = 0
local start_position = {}

-- Handle job cancellation on certain events.
addEventHandler("onClientResourceStart", resourceRoot, function()
  setElementData(localPlayer, "bib_doing_delivery", false)
end)
addEventHandler("onClientPlayerWasted", localPlayer, function()
  if source ~= localPlayer then return end
  setElementData(localPlayer, "bib_doing_delivery", false)
  clearCache()
end)

-- Start job
addEvent("onDeliveryJobStart", true)
addEventHandler("onDeliveryJobStart", localPlayer, function()
  for i,wh in ipairs(warehouses) do
    local x,y,z,rot,district,city = wh[1],wh[2],wh[3],wh[4],wh[5],wh[6]
    local marker = createMarker(x,y,z-1,"cylinder",5,96,86,76,66)
    local blip = createBlipAttachedTo(marker,46,2,255,0,0,15)

    addEventHandler("onClientMarkerHit", marker, function() bindKey("space", "down", startVehicleLoading, false) end)
    addEventHandler("onClientMarkerLeave", marker, function() unbindKey("space", "down", startVehicleLoading) end)

    table.insert(cache, marker)
  end
  addEventHandler("onClientRender", root, drawWarehouseMarkerText)
end)

function drawWarehouseMarkerText()
  for i,wh in ipairs(warehouses) do
    local x,y,z,rot,district,city = wh[1],wh[2],wh[3],wh[4],wh[5],wh[6]
    dxDraw3DText(district .. " Warehouse",x,y,z+5,3,"arial",white,50)
    dxDraw3DText("Stop on the marker and\nstart loading your vehicle\nby pressing [SPACE]",x,y,z+3,0.5,"bankgothic",white,20)
  end
end

function drawCheckpointMarkerText()
  for i,wh in ipairs(cache) do
    local x,y,z = getElementPosition(wh)
    dxDraw3DText("Delivery Location",x,y,z+25,3,"arial",white,500)
    dxDraw3DText("Stop on the marker and\nstart unloading your vehicle\nby pressing [SPACE]",x,y,z+3,0.5,"bankgothic",white,20)
  end
end

function startVehicleLoading(key,state,load_checkpoint)
  toggleAllControls(false)
  unbindKey("space", "down", startVehicleLoading)
  fadeCamera(false, 0.5, 0, 0, 0)

  setTimer(function()
    setVehicleDoorState(getPedOccupiedVehicle(localPlayer), 1, 4, false)
    local x,y,z = getElementPosition(localPlayer)
    setCameraMatrix (x-12,y-12,z+5,x,y,z,-10,40)
    start_position = {x,y,z}
    fadeCamera(true, 2.5)
  end, 500, 1)

  setTimer(function()
    fadeCamera(false, 0.5, 0, 0, 0)
    removeEventHandler("onClientRender", root, drawWarehouseMarkerText)
    removeEventHandler("onClientRender", root, drawCheckpointMarkerText)
  end, 3000, 1)
  
  setTimer(function()
    fadeCamera(true, 0.5)
    toggleAllControls(true)
    setCameraTarget(localPlayer)
    setVehicleDoorState(getPedOccupiedVehicle(localPlayer), 1, 1, false)
    if load_checkpoint then
      loadNextCheckpoint()
    else
      finishVehicleLoading()
    end
  end, 3500, 1)

end

function finishVehicleLoading()
  clearCache()
  removeEventHandler("onClientRender", root, drawWarehouseMarkerText)
  loadPlayerRoute()
end

function loadPlayerRoute()
  outputChatBox("Item's have been picked up! Head to the drop off location marked with truck icon.")

  -- Only choose routes in same city than warehouse is in. Make sure there is for every city.
  local x,y,z = getElementPosition(localPlayer)
  local local_zone = getZoneName(x,y,z,true)
  for i,v in ipairs(routes) do if v[6] == local_zone then table.insert(route_map,v) end end

  route_map = shuffle(route_map)
  loadNextCheckpoint(true)
end

function loadNextCheckpoint(first_one)
  clearCache()
  if #route_map > 0 then
    route_map = shuffle(route_map)
    local directions = table.remove(route_map,1)
    local marker = createMarker(directions[1],directions[2],directions[3],"checkpoint",3,96,86,76,66)
    local blip = createBlipAttachedTo(marker,51,2,96,86,76,999)

    addEventHandler("onClientMarkerHit", marker, function() bindKey("space", "down", startVehicleLoading, true) end)
    addEventHandler("onClientMarkerLeave", marker, function() unbindKey("space", "down", startVehicleLoading) end)
    addEventHandler("onClientRender", root, drawCheckpointMarkerText)

    local distance_travelled = math.floor(getDistanceBetweenPoints3D(directions[1],directions[2],directions[3],start_position[1],start_position[2],start_position[3]))
    
    table.insert(cache, marker)
    if not first_one then
      triggerServerEvent("onPlayerDeliveryDropoff", localPlayer, localPlayer, distance_travelled)
    end
  else
    triggerServerEvent("onPlayerDeliveryRouteCompleted", localPlayer, localPlayer)
  end
end


-- Shuffles a LUA Table
function shuffle(t)
  local tbl = {}
  for i = 1, #t do tbl[i] = t[i] end
  for i = #tbl, 2, -1 do local j = math.random(i) tbl[i], tbl[j] = tbl[j], tbl[i] end
  return tbl
end

function clearCache()
  if #cache > 0 then
    for i,e in ipairs(cache) do
      local attached_els = getAttachedElements(e)
      for _,b in ipairs(attached_els) do destroyElement(b) end
      destroyElement(e)
    end
  end
  cache = {}
end