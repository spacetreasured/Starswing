if !freeze //----------------------------------------------------------------------------------------------------if you are not frozen
{

//destroy if off screen
if y > room_height+100 or y < -100
{
	instance_destroy();
}

//set turnspeed
image_angle += turnspeed;

if place_meeting(x,y,oSwing) //when you swing and hit the ball
{
	hit = 1;
	if instance_exists(oPlayer)
	{
		with oPlayer
		{
			freeze = 10;
		}
	}
	instance_create_depth(x,y,0,eScreenshake);
	
	repeat 5
	{
		instance_create_depth(x,y,0,eDust);
	}
	
	instance_create_depth(x,y,-1,eSmash);
}

//freeze everything when oPlayer freezes
if instance_exists(oPlayer)
{
	freeze = oPlayer.freeze;
}

//after freezing when hit back at enemies
if hit
{
	vspeed = hitspeed;
	repeat 2
	{
		instance_create_depth(x,y,0,eDustsmall);
		instance_create_depth(x,y-50,0,eDustsmall);
		instance_create_depth(x,y+50,0,eDustsmall);
	}
	image_angle = 0; //sets angle to 0 so it doesn't flip around when you hit it
	sprite_index = sBallhit;
	image_xscale = 1;
	image_yscale = 1;
}
else
{
	vspeed = startspeed;
	image_angle += turnspeed;
}


} //----------------------------------------------------------------------------------------------------end of no-freeze zone
else //if you *are* frozen
{
	if freeze > 0
    {
        freeze -= 1;
        image_speed = 0;
		vspeed = 0;
		if hit //if this was the one hit
		{
			image_xscale = 1.25;
			image_yscale = 0.75;
			sprite_index = sBall;
		}
    }
}