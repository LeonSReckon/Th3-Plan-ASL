// Th3 Plan 1.5.0 Autosplitter 11/8/2023
// Supports IGT
// Pointers and Script <by> ||LeonSReckon||
// Thanks to TheDementedSalad for helping whenever I had a problem or a question

state("Main")
{
	byte lvl: 0x128064, 0x2C, 0x28, 0xF0, 0x15C;
	byte Screen: 0x1F8B70, 0x1C, 0x14, 0x4, 0x14, 0x10, 0xD8C;
	float IGT: 0x1C3F40, 0xC0, 0x6A4;
	float bar: 0x1C34E8, 0x618;
}
startup
{
	vars.totalGameTime = 0;
}

update{
    if (timer.CurrentPhase == TimerPhase.NotRunning)
    {
        vars.totalGameTime = 0;
    }
}

start
{
    	return current.IGT > old.IGT;
}

split
{
    	return current.lvl > old.lvl || current.bar < 0 && current.lvl == 12;
}

isLoading
{
	return true;
}

gameTime
{
	if(current.IGT > old.IGT){
			return TimeSpan.FromSeconds(current.IGT);
		}
}

reset
{
	return current.Screen == 0 && current.lvl == 14;
}
