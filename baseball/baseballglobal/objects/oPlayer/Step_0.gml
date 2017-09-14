//controls & variables
press = mouse_check_button_pressed(mb_left); //holding down
release = mouse_check_button_released(mb_left); //letting go
offmousex = ((mouse_x*2)-(room_width*0.5)); //offsets mousex so the controls aren't 1:1
offmousey = ((mouse_y*1.5)-(room_height*0.5))-100; //offsets mousey so the controls aren't 1:1

if !global.freeze //----------------------------------------------------------------------------------------------------if you are not frozen
{

if global.strikecount > 2
{
	instance_create_depth(x,y,depth-1,eExplosion);
	instance_destroy();
}

//limit movement at edges of screens
if offmousex >= room_width
{
	offmousex = room_width;
}
if offmousex <= 0
{
	offmousex = 0;
}
if offmousey >= room_height
{
	offmousey = room_height
}
if offmousey <= 0
{
	offmousey = 0;
}

//dragging oPlayer
if press
{
	held = 1;
}

if held == 1 //makes it so oPlayer follows until you release
{
	if offmousex < x
	{
		image_angle = point_distance(x,y,offmousex,y)*0.05; //angles oPlayer to mouse_x
	}
	if offmousex > x
	{
		image_angle = point_distance(x,y,offmousex,y)*-0.05;
	}
	x = (x*9+offmousex)/10;
	y = (y*9+offmousey)/10;
}
else
{
	if instance_exists(oMarker)
	{
		if oMarker.x < x
		{
			image_angle = point_distance(x,y,oMarker.x,y)*0.02; //angles oPlayer to oMarker.x
		}
		if oMarker.x > x
		{
			image_angle = point_distance(x,y,oMarker.x,y)*-0.02;
		}
		x = (x*9+(oMarker.x))/10;
		y = (y*9+(oMarker.y))/10;
	}
}

//releasing
if release
{
	instance_create_depth(x,y,0,oSwing); //creates swing when releasing
	instance_create_depth(offmousex,offmousey,0,oMarker); //ensures that oPlayer continues drifting toward where you released
	held = 0;
}

if instance_exists(oSwing)
{
	shouttimer = 8;
	sprite_index = sHeadhit;
}
else
{
	if shouttimer > 0
	{
		shouttimer -= 1;
	}
	else
	{
		sprite_index = sHead;
	}
}

} //----------------------------------------------------------------------------------------------------end of no-freeze zone
else //if you *are* frozen
{
	if global.freeze > 0
    {
        global.freeze -= 1;
        image_speed = 0;
    }
	if press
	{
		held = 1; //makes it so you don't get caught when freezing
	}
	
	if release
	{
		instance_create_depth(offmousex,offmousey,0,oMarker); //ensures that oPlayer continues drifting toward where you released
		held = 0;
	}
	
	sprite_index = sHeadhit;
	shouttimer = 8;
	
	if global.strikecount > 2
	{
		die = 1;
	}
	
	if die == 1
	{
		image_xscale *= 1.025;
		image_yscale = 0.75;
	}
}

if place_meeting(x,y,oComet)
{
	global.strikecount = 3;
	if !instance_exists(oStrike)
	{
		instance_create_depth(x,(y-sprite_height),-1,eDeathsmash);
		instance_create_depth(room_width*0.5,room_height*0.5,-2,oStrike);
	}
}