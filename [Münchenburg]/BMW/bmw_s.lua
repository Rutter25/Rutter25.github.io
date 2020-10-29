function onPlayerRequestEmerlight2(value)
	triggerClientEvent(getRootElement(), "setEmerlights2", getRootElement(), getPlayerName(source), value)
end
addEvent("requestEmerlightChangeState2", true)
addEventHandler("requestEmerlightChangeState2", getRootElement(), onPlayerRequestEmerlight2)

--> Furkan Özulus <--