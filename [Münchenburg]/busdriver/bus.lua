local rootElement = getRootElement()

local busses = {[431] = true}

local busTable = {
[1]={1812.65198, -1889.86047, 13.41406},
[2]={1825.22791, -1635.03711, 13.38281},
[3]={1855.01685, -1430.47449, 13.39063},
[4]={1732.81580, -1296.87122, 13.44294},
[5]={1473.19226, -1295.77124, 13.48315},
[6]={1443.60376, -1498.26660, 13.37650},
[7]={1426.37280, -1716.12439, 13.38281},
[8]={1315.06909, -1656.43799, 13.38281},
[9]={1359.06250, -1432.39734, 13.38281},
[10]={1169.82983, -1392.34473, 13.41728},
[11]={930.76508, -1392.92627, 13.26561},
[12]={815.24756, -1317.91345, 13.44460},
[13]={585.04199, -1320.53748, 13.40609},
[14]={526.99365, -1624.20361, 16.63225},
}

function getNewBusLocation(thePlayer, ID)
local x, y, z = busTable[ID][1], busTable[ID][2], busTable[ID][3]
triggerClientEvent(thePlayer,"bus_set_location",thePlayer,x,y,z)
end

function onVehicleEnter(thePlayer)
if not busses[getElementModel(source)] then return end
if not getPlayerTeam(thePlayer) then return end
if getTeamName(getPlayerTeam(thePlayer)) == "Bus Driver" then
local x, y, z = getNewBusLocation(thePlayer, 1)
setElementData(thePlayer,"busData",1)
  end
end
addEventHandler("onVehicleEnter",rootElement,onVehicleEnter)

addEvent("bus_finish",true)
addEventHandler("bus_finish",rootElement,
function (client)
if not isPedInVehicle(client) then return end
if not busses[getElementModel(getPedOccupiedVehicle(client))] then return end
givePlayerMoney(client, 100)
if #busTable == tonumber(getElementData(client,"busData")) then
setElementData(client,"busData",1)
else
setElementData(client,"busData",tonumber(getElementData(client,"busData"))+1)
end
getNewBusLocation(client, tonumber(getElementData(client,"busData")))
end)