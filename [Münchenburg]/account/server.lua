local con= dbConnect( "mysql", "dbname=játékosadatok;host=127.0.0.1;charset=utf8", "root", "", "share=1" );
addEventHandler("onPlayerWasted", root,
	function()
		local skin= getElementModel(source);
		spawnPlayer(source, -2664, 635, 16, 0,skin);
		fadeCamera(source, true);
		setCameraTarget(source, source);
	end
	);


addEventHandler("onPlayerJoin",root,
	function (player)
		local serial= getPlayerSerial(source);
		local qh = dbQuery(con, "SELECT * FROM players WHERE serial=?", serial);
		local res = dbPoll(qh, 200);
		local alma = source
		setTimer(function ()
		if  (#res > 0) then
 		for _, row in ipairs(res) do
		local pos = fromJSON(row["pos"]);
		local money = row["money"];
		local skin = row["skin"];
		spawnPlayer(alma, pos[1], pos[2], pos[3], pos[4], skin);
		fadeCamera(alma, true);
		setCameraTarget(alma, alma);
		setPlayerMoney(alma,money); 
end


		else
			spawnPlayer(alma, -1423, -290, 17, 0, 217);
			fadeCamera(alma, true);
			setCameraTarget(alma, alma);
			setPlayerMoney(alma,2000);
			dbExec(con, "INSERT INTO players SET serial=?, pos=?, money=?, skin=?", serial, toJSON({-1423, -290, 17, 0}), 2000, 217);
			
		end
	end, 1000, 1);
	end

);

addEventHandler("onPlayerQuit",root,
	function(quitType)

		local serial= getPlayerSerial(source);
		local x,y,z = getElementPosition(source);
		local rot = getPedRotation(source);
		local money=getPlayerMoney(source);
		local skin= getElementModel(source);
		if not ((quitType=="Bad Connection") or (quitType=="Timed Out")) then
			dbExec(con,"UPDATE players Set pos=?, money=?, skin=? WHERE serial=?", toJSON({x,y,z, rot}), money, skin, serial );
			else
			dbExec(con,"UPDATE players Set money=?, skin=? WHERE serial=?", money, skin, serial );
		end
	end
);
