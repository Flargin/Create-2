draw_self();
draw_set_font(fntDeposit);
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_center)
draw_text(x, y-32, string(deposited));

draw_set_color(make_color_rgb(r,g,b));
draw_circle(x,y+30,5,false)