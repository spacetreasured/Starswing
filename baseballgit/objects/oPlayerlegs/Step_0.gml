if !global.freeze //----------------------------------------------------------------------------------------------------if you are not frozen
{

if instance_exists(oPlayer)
{
	x = oPlayer.x;
	y = oPlayer.y;

if oPlayer.held
{
	if oPlayer.offmousex < x
	{
		image_angle = ((image_angle * 5)+point_distance(x,y,oPlayer.offmousex,y))/10;
	}
	if oPlayer.offmousex > x
	{
		image_angle = ((image_angle * 5)-point_distance(x,y,oPlayer.offmousex,y))/10;
	}
}
else
{
	if instance_exists(oMarker)
	{
		if oMarker.x < x
		{
			image_angle = ((image_angle * 5)+point_distance(x,y,oMarker.x,y))/10;
		}
		if oMarker.x > x
		{
			image_angle = ((image_angle * 5)-point_distance(x,y,oMarker.x,y))/10;
		}
	}
}

}
else
{
	vspeed = 3;
}

} //----------------------------------------------------------------------------------------------------end of no-freeze zone
else //if you *are* frozen
{
//
}

//making thrustdust
instance_create_depth(x,y+32,1,eThrustdust);