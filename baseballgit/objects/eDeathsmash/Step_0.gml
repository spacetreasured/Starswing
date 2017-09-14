timer -= 1;
image_xscale *= 1.05;
image_yscale *= 1.05;

if timer <= 0
{
	instance_destroy();
}

image_angle += turn;
turn *= 0.5;