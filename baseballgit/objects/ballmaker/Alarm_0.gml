if alarm[0] <= 0
{
	if global.ballnumber < global.ballnumberlimit //if the amount of balls or comets on screen isn't at the max for this score
	{
		if global.strikecount < 3
		{
			if !instance_exists(eTransition)
			{
				alarm[0] = random_range(global.ballspawnspeed-(global.ballspawnspeed*0.5),global.ballspawnspeed+(global.ballspawnspeed*0.5));
				instance_create_depth(random_range(100,room_width-100),0,0,choose(oBall,oBall,oBall,oBoomerang));
			}
			else //if you're in the middle of a transition, only comets get made but faster
			{
				alarm[0] = global.ballspawnspeed*0.25;
				instance_create_depth(random_range(100,room_width-100),0,0,oComet);
			}
		}
	}
	else
	{
		alarm[0] = 1; //if you've hit the limit on balls on-screen then just progress once a step
	}
}

if 0 < global.scorecount > 9
{
	global.ballspawnspeed = 80;
	global.ballnumberlimit = 4;
}

if 9 < global.scorecount > 19
{
	global.ballspawnspeed = 40;
	global.ballnumberlimit = 6;
}