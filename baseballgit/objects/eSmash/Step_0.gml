timer -= 1;
image_xscale *= 1.05;
image_yscale *= 1.05;

if timer <= 0
{
	if instance_exists(oPlayer)
	{
		oPlayer.y += 60; //pushes player back
	}
	
	if !instance_exists(oExclaim)
	{
		if x > room_width*0.5
		{
			instance_create_depth(x-200,y-100,depth,oScore);
		}
		else
		{
			instance_create_depth(x+200,y-100,depth,oScore);
		}
	}
	instance_destroy();
}

image_angle += turn;
turn *= 0.5;