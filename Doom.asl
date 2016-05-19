state("DOOMx64")
{
	bool isLoading: 0x308E940;
	bool start: 0x337EA9C;
	string20 mapName : "DOOMx64.exe", 0x2818178, 0x168, 0x1C;
}

start
{

	return (current.mapName.StartsWith("intro") && (!old.start && current.start) && !current.isLoading);
}

isLoading
{
	return current.isLoading;
}

split
{
	//Credit goes to sychotixx for this code
	if (current.mapName != null && current.mapName != "" && old.mapName != current.mapName)
		{
			print("OLD: "+old.mapName+" CURRENT: "+current.mapName);
		}
	return current.mapName != null && current.mapName != "" && old.mapName != current.mapName;
}

exit 
{ 
	timer.IsGameTimePaused = true; 
}
