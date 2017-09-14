//amount of time to stay out
timer-=1;

if timer <= 0
{
	instance_destroy();
}

//follow oPlayer
if instance_exists(oPlayer)
{
	x = oPlayer.x;
	y = oPlayer.y;
}