//controls and variables
press = mouse_check_button_pressed(mb_left); //holding down
release = mouse_check_button_released(mb_left); //letting go
freezerelease = !mouse_check_button(mb_left); //already let go during freeze
if instance_exists(oPlayer)
{
	x = oPlayer.x;
	if swing
	{
		y = oPlayer.y;
		x = oPlayer.x;
	}
	else
	{
		if charge
		{
			y = (oPlayer.y + 16) - random_range(-5,5); //shake bat to charge
		}
		else
		{
			y = oPlayer.y + 16;
		}
	
		if swingside == "right"
		{
			x = oPlayer.x - 30;
		}
		else
		{
			x = oPlayer.x + 30;
		}
	}

if press
{
	charge = 1; //charge up to swing
}

if !global.freeze //----------------------------------------------------------------------------------------------------if you are not frozen
{


if release or (freezerelease && charge == 1)//queues up a swing if you hit/release while frozen //sets which side to swing to
{
	if swingside == "right"
	{
		swingside = "left";
	}
	else
	{
		swingside = "right";
	}
	charge = 0;
	swing = 1;
}

if swingside == "right"
{
	image_angle -= angle_difference(image_angle,179.9)*0.4;
	image_yscale = -1;
}
else
{
	image_angle -= angle_difference(image_angle,0.1)*0.4;
	image_yscale = 1;
}


if image_angle >= 10 && image_angle <= 170
{
	sprite_index = sBatswing;
}
else
{
	swing = 0;
	sprite_index = sBat
}

} //----------------------------------------------------------------------------------------------------end of no-freeze zone
else //if you *are* frozen
{
	if global.freeze > 0
    {
        image_speed = 0;
    }
}

}
else
{	
	vspeed = 3;
}