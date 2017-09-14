//controls and variables
press = mouse_check_button_pressed(mb_left) //holding down
release = mouse_check_button_released(mb_left) //letting go
x = oPlayer.x;
if swing
{
	y = oPlayer.y+30;
	x = oPlayer.x;
}
else
{
	if charge
	{
		y = (oPlayer.y + 50) - random_range(-5,5); //shake bat to charge
	}
	else
	{
		y = oPlayer.y + 50;
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

if !freeze //----------------------------------------------------------------------------------------------------if you are not frozen
{


if release //sets which side to swing to
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
}

if swingside == "right"
{
	image_angle -= angle_difference(image_angle,179)*0.4;
	image_yscale = -1;
}
else
{
	image_angle -= angle_difference(image_angle,1)*0.4;
	image_yscale = 1;
}

if image_angle >= 10 && image_angle <= 170
{
	swing = 1;
	sprite_index = sBatswing;
	/*instance_create_depth( x+lengthdir_x(sprite_get_width( sprite_index)-50,image_angle),
                 y+lengthdir_y(sprite_get_height(sprite_index),image_angle),0,
                 eSwingdust);*/ //makes dust at end of bat
	//image_yscale = 2;//stretch with swing
}
else
{
	swing = 0;
	sprite_index = sBat
}

//freeze everything when oPlayer freezes
if instance_exists(oPlayer)
{
	freeze = oPlayer.freeze;
}

} //----------------------------------------------------------------------------------------------------end of no-freeze zone
else //if you *are* frozen
{
	if freeze > 0
    {
        freeze -= 1;
        image_speed = 0;
    }
	//sprite_index = sBat; //sets bat to just bat when it freezes
}