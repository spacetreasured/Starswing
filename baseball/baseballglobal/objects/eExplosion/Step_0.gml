timer -= 1;
image_xscale *= 1.1;
image_yscale *= 1.1;

if timer <= 0
{
	instance_destroy();
}