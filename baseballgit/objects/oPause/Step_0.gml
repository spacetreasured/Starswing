 //debug
if keyboard_check(ord("R"))
{
	game_restart(); //restart game
}

if keyboard_check(ord("Q"))
{
	game_end(); //end game
}

if keyboard_check_pressed(ord("B"))
{
	instance_create_depth(random_range(100,room_width-100),0,0,choose(oBall,oBall,oBall,oBoomerang)); //create a ball to hit
}

if keyboard_check_pressed(ord("C"))
{
	instance_create_depth(random_range(100,room_width-100),0,0,oComet); //create a comet
}

if keyboard_check_pressed(ord("T"))
{
	instance_create_depth(0,0,0,eTransition); //create a transition so stars move faster
}

press = mouse_check_button_pressed(mb_left); //press down
release = mouse_check_button_released(mb_left); //letting go
hold = mouse_check_button(mb_left); //holding down

if point_distance(x,y,mouse_x,mouse_y) <= 70
{	
	if hold
	{
		pausescale = 0.85; //scales down when pressed
	}
}

if !hold
{
	if pausescale < 1
	{
		if release
		{
			if global.paused == 0
			{
				global.paused = 1;
			}
			else
			{
				global.paused = 0;
			}
		}
		pausescale += 0.13; //grows back to over 1
	}
	if pausescale > 1
	{
		pausescale -= 0.01; //bounces back down to 1
	}
}

if global.paused
{
	global.freeze = 10;
}

//counting the balls that exist
global.ballnumber = instance_number(oEnemy);