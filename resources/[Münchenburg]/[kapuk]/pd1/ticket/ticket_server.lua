function ticket(player, cmd, ticketplayer, ki, thePlayer)
		local ticketplayer = getPlayerFromName(ticketplayer)
		takePlayerMoney(ticketplayer, tonumber(ki))
		outputChatBox("#FF0000 Játékost : "..getPlayerName(ticketplayer).."#FF0FFF megbüntették :  (#00FF00"..tonumber(ki).."$#FF0FFF)", thePlayer, 255, 0, 0, true)
end
addCommandHandler("ticket", ticket)

x = "A Script sikeresen "
y = "lefutott." 
-- Kezdésnek jó he*
outputChatBox ( "" .. x .. "" .. y .. "" )

function jatekosmsg(msg, thePlayer)

	msgbox = msg 
	
end


function onChat(message, messageType, thePlayer)

--	tiltottszavak = {"anyád", "anyádat", "kurva"}

    if string.find(message, "anyád" ) then  -- belehet helyetessíteni a tiltottszavak listáját
        outputChatBox("Nem szép dolog csúnyát irni!!")
    end
end 
addEventHandler("onPlayerChat", getRootElement(), onChat)


-- Parancsnév visszakérdezés,összeg megadása parancsba

function amm(amount,thePlayer,command)

	if tonumber(amount) == nil then
		outputChatBox("Használd a /ticket1 (összeg)")
	else
		outputChatBox("Te a ("..amount..") értéket adtad meg", thePlayer)
	end
end
addCommandHandler("ticket1", amm)


		