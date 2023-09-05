draw_set_color(c_gray);
draw_rectangle(0,room_height-96,room_width,room_height,false);

draw_sprite(sprBelt, 4, 64, room_height-(96/2));
draw_sprite(sprProducerRed, 0, 64+96, room_height-(96/2));
draw_sprite(sprMixer, 0, 64+96*2, room_height-(96/2));
draw_sprite(sprDeposit, 0, 64+96*3, room_height-(96/2));
draw_sprite(sprSplitter, 0, 64+96*4, room_height-(96/2));