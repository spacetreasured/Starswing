if alarm[0] <= 0
{
	if global.ballnumber < global.ballnumberlimit
	{
		alarm[0] = random_range(global.ballspawnspeed-(global.ballspawnspeed*0.5),global.ballspawnspeed+(global.ballspawnspeed*0.5));
		instance_create_depth(random_range(100,room_width-100),0,0,choose(oBall,oBall,oBall,oBoomerang));
	}
	else
	{
		alarm[0] = 1;
	}
}

if global.scorecount > 10
{
	global.ballspawnspeed = 80;
	global.ballnumberlimit = 4;
}

if global.scorecount > 20
{
	global.ballspawnspeed = 40;
	global.ballnumberlimit = 6;
}