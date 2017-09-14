timer -= 1;
image_xscale *= 1.05;
image_yscale *= 1.05;

if timer <= 0
{
	if instance_exists(oPlayer)
	{
		oPlayer.y += 60; //pushes player back
	}
	instance_destroy();
}

image_angle += turn;
turn *= 0.5;