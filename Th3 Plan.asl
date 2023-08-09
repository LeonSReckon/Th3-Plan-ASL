// Th3 Plan 1.0.0 Autosplitter 8/8/2023
// Supports RTA
// Pointers and Script <by> ||LeonSReckon||

state("Main")
{
	byte lvl: 0x22F654, 0x68, 0x5AC;
	byte Load: 0x1C472C, 0x5D8, 0x0, 0x4, 0x14, 0x10, 0xD8C;
	byte Screen: 0x1C33BC, 0x4, 0x1CC, 0x4, 0x58, 0x44, 0xB08;
	float PPos: 0x21F060, 0x0;
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
		return TimeSpan.FromSeconds(Math.Floor(vars.totalGameTime + current.IGT));
	}
	if(current.IGT == 0 && old.IGT > 0){
			vars.totalGameTime = System.Math.Floor(vars.totalGameTime + old.IGT);
			return TimeSpan.FromSeconds(System.Math.Floor(vars.totalGameTime + current.IGT));
		}
}

reset
{
	return current.PPos == 0 && current.Load == 0 && current.Screen == 0 && current.lvl == 14;
}
