local spawnX, spawnY, spawnZ = 1959,55, -1714,46, 10
function csatlakozasKezelo()
	spawnPlayer(source, spawnX, spawnY, spawnZ)
	fadeCamera(source, true)
	setCameraTarget(source, source)
	outputChatBox ("Üdvözöllek a szerveremen.", source)
end
addEventHandler ("onPlayerJoin", getRootElement (), csatlakozasKezelo)