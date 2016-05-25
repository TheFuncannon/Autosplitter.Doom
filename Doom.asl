state("DOOMx64")
{
	bool isLoading: 0x308E940;
	bool canStart: 0xB63405C;
	bool start: 0x337EA9C;
	bool mainMenu: 0x308D55C;
	string20 mapName: "DOOMx64.exe", 0x2818178, 0x168, 0x1C;
	float bossHealth: 0x03086F08, 0x30, 0xF0, 0x3E0, 0x2D8, 0x1B4;
	bool finalHit: 0x308EB8C;
}

start
{

	return (current.mapName.StartsWith("intro") && (!old.start && current.start) && !current.isLoading && !current.canStart);
}

isLoading
{
	return current.isLoading;
}

split
{
	//Credit goes to sychotixx for this most of this code as well as the map name pointer
	return (current.mapName != null && current.mapName != "" && old.mapName != current.mapName && !old.mapName.StartsWith(".") && !current.mainMenu) || (!current.finalHit && current.bossHealth == 1);
}

exit 
{ 
	timer.IsGameTimePaused = true; 
}

reset
{
	return current.mapName.StartsWith("intro") && current.canStart && !current.mainMenu && current.finalHit && current.start;
}
