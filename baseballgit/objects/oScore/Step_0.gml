vspeed *= 0.92;
if timer <= 0
{
	instance_destroy();
}

if global.scorescale > 1
{
	global.scoreangle += random_range(-5,5); //tilts scorecounter
	global.scorecolor = make_color_rgb(255,random_range(0,255),random_range(0,255));
}
else
{
	global.scoreangle = 0; //resets angle of scorecounter
	global.scorecolor = make_color_rgb(255,241,232);
}

timer -= 1;

if global.transitionswitch == 1
{
	if !instance_exists(eTransition)
	{
		instance_create_depth(x,y,0,eTransition);
	}
	global.transitionswitch = 0;
}