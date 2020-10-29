
--Hang és duda
local elements ={
	{"copcarla", 596},
	{"copcarsf", 597},
	{"copcarvg", 598},
	{"copcarru", 599},
	{"copbike", 523},
	{"enforcer", 427},
	{"fbiranch", 490},
	{"fbitruck", 528},
	{"firela", 544},
	{"firetruk", 407},
	{"ambulan", 416},
	{"swatvan", 601},
	{"bus", 431},
}

local sound=playSound("hang.wav",true)
	setSoundPaused(sound, true )

local thePlayer=getLocalPlayer()
---------------------------------------------------------------
function szirena()
if not (isSoundPaused(sound)) then
	setSoundPaused(sound, true )
else
	
setSoundPaused(sound, false )
end
end

function dontoEvent(vehicles)--Eldönti,hogy kell e bele sziréna
		outputChatBox("lefutott")
	if getPedOccupiedVehicle(thePlayer) then
		outputChatBox("ez jó jármű")
		if getPedOccupiedVehicleSeat(thePlayer) <= 1 then
	outputChatBox("Döntött")
	bindKey("2","down",szirena)

else unbindkey(source,"2",szirena)

end
end
end


addCommandHandler("dönt",dontoEvent)
--addEventHandler("onResourceStart", getRootElement(),dontoEvent)
-------------------------------------------------------------
local sound2=playSound("duda.wav",true)
	setSoundPaused(sound2, true )
function duda()
if not (isSoundPaused(sound2)) then
	setSoundPaused(sound2, true )
else
	
setSoundPaused(sound2, false )
end
end
bindKey("3","down",duda)

