--[[
  ************
  INSTRUCTIONS
  _________________________________________________________________________________________________
  - Edit the "isPlayerDeliveryDriver()" function to your preferred method of checking players class.
  - Edit the "payoutForDropoff()" function to edit payment for a single drop off location payment.
  - Edit the "payoutForRoute()" function to edit payment for when whole route is completed.

  Feel free to edit everything else too as you please.
]]--

-- Initialize the job as player enters a vehicle
addEventHandler("onPlayerVehicleEnter", root, function(vehicle, seat, jacked)
  if not isPlayerDeliveryDriver(source) then return end
  if seat ~= 0 then return end
  local is_on_job = getElementData(source, "bib_doing_delivery") or false
  if not is_on_job and allowed_vehicles[getElementModel(vehicle)] then startDeliveryJob(source) end
end)

function startDeliveryJob(player, skip_message)
  if not skip_message then
    outputChatBox('You\'re now a delivery driver! Head to nearest warehouse marked on your map.', player)
  end
  setElementData(player, "bib_doing_delivery", true)
  triggerClientEvent(player, "onDeliveryJobStart", player)
end

-- Check that player is delivery driver
function isPlayerDeliveryDriver(player)
  if getElementData(player, "subclass") == "Delivery Driver" then return true end
  return false
end

addEvent("onPlayerDeliveryDropoff", true)
addEventHandler("onPlayerDeliveryDropoff", root, function(player, distance)
  local payout = math.floor(15 * (distance * 0.075))
  outputChatBox('You\'ve been paid $' .. payout .. ' for completing a drop off. Head to the next location now.', player)
  givePlayerMoney(player, payout)
end)

addEvent("onPlayerDeliveryRouteCompleted", true)
addEventHandler("onPlayerDeliveryRouteCompleted", root, function(player)
  removeElementData(player, "bib_doing_delivery")
  outputChatBox("You've completed deliveries for this route. Restock at a warehouse. You got paid for $" .. 125, player)
  givePlayerMoney(player, 125)
  startDeliveryJob(player, true)
end)