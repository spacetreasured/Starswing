hspeed *= 0.95;
vspeed *= 0.95;
timer -= 1;

if timer <= 0
{
	instance_destroy();
}