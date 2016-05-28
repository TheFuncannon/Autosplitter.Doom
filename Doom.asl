state("DOOMx64")
{
	bool isLoading: 0x308C930;
	bool canStart: 0x2839D44;
	bool start: 0x337CA9C;
	bool mainMenu: 0xAD03804;
	string20 mapName: 0x318AFE8;
	float bossHealth: 0x03084EF8, 0x30, 0x4E8, 0x2D8, 0x1B4;
	bool finalHit: 0x308CB7C;
}

start
{

	return (current.mapName.StartsWith("intro") && (!old.start && current.start) && !current.isLoading && current.canStart);
}

isLoading
{
	return current.isLoading;
}

split
{
	//Credit goes to sychotixx for this most of this code as well as the map name pointer
	return (current.mapName != null && current.mapName != "" && old.mapName != current.mapName && !old.mainMenu) || (!current.finalHit && current.bossHealth == 1);
}

exit 
{ 
	timer.IsGameTimePaused = true; 
}

reset
{
	return current.mapName.StartsWith("intro") && !current.canStart && !current.mainMenu && current.start && !current.isLoading;
}
