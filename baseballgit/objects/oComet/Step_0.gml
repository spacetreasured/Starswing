if !global.freeze //----------------------------------------------------------------------------------------------------if you are not frozen
{

vspeed = global.ballspeed * 1.2;

instance_create_depth(random_range(x-40,x+40),y-40,depth+1,eDustsmall);

//destroy if off screen
if y > room_height+100
{
	instance_destroy();
}

if y < -100
{
	instance_destroy();
}

} //----------------------------------------------------------------------------------------------------end of no-freeze zone
else //if you *are* frozen
{
	vspeed = 0;
}