if global.paused
{
	pausedcolor = make_color_rgb(255,random_range(0,255),random_range(0,255))
}
else
{
	pausedcolor = c_white;
}

draw_sprite_ext(sprite_index,0,x,y,pausescale,pausescale,0,pausedcolor,1);

//draw_set_halign(fa_left);
//draw_text(200,200,global.starspeed);
//draw_text(100,100,fps_real);

/*draw_set_font(fTest);
draw_set_valign(fa_bottom);
draw_set_halign(fa_left);
draw_set_color(global.scorecolor);
draw_text_transformed(50,room_height,global.scorecount,global.scorescale,global.scorescale,global.scoreangle);
if global.scorescale > 1
{
	global.scorescale -= 0.05; //sizes back to normal
}