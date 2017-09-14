hspeed *= 0.8;
vspeed *= 0.8;
timer -= 1;

if timer <= 0
{
	instance_destroy();
}

y += vsp;

vsp += 0.5;