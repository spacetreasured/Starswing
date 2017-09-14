if amount == 10
{
	amount = -10;
}
else
{
	amount = 10;
}

camera_set_view_pos(view_camera[0],(0+amount),(0+amount));