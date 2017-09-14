draw_set_font(fTest);
draw_set_valign(fa_bottom);
draw_set_halign(fa_middle);
draw_set_color(global.scorecolor);
draw_text_transformed(x,y,global.scorecount,global.scorescale,global.scorescale,global.scoreangle);
if global.scorescale > 1
{
	global.scorescale *= 0.9; //sizes back to normal
}