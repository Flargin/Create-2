if(pause){
	draw_set_color(c_black);
	draw_set_alpha(0.6);
	draw_rectangle(0,0,room_width,room_height,false);
	draw_set_font(fntGUI);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_halign(fa_center)
	draw_text(room_width/2, room_height/2, "Paused");
}
