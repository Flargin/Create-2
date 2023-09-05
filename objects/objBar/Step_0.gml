if(!objGame.pause){
with(collision_rectangle(0, room_height-96, room_width, room_height, all, true, true)){
	if(layer == layer_get_id("Cursor")){}
	else if(layer == layer_get_id("Moving")){}
	else instance_destroy();
}

if(collision_rectangle(32, room_height-80, 96, room_height-16, objCursor, true, true)){
	if(mouse_check_button_pressed(mb_left)){
		with instance_create_layer(objCursor.x,objCursor.y, "Moving", objBelt){
			creationcd = 1;
			previous_x = 64;
			previous_y = room_height-(96/2);
		}
	}
}

if(collision_rectangle(32+96, room_height-80, 96*2, room_height-16, objCursor, true, true)){
	if(mouse_check_button_pressed(mb_left)){
		with instance_create_layer(objCursor.x,objCursor.y, "Moving", objProducer){
			creationcd = 1;
			previous_x = 64 + 96;
			previous_y = room_height-(96/2);
		}
	}
}

if(collision_rectangle(32+96*2, room_height-80, 96*3, room_height-16, objCursor, true, true)){
	if(mouse_check_button_pressed(mb_left)){
		with instance_create_layer(objCursor.x,objCursor.y, "Moving", objMixer){
			creationcd = 1;
			previous_x = 64 + 96*2;
			previous_y = room_height-(96/2);
		}
	}
}

if(collision_rectangle(32+96*3, room_height-80, 96*4, room_height-16, objCursor, true, true)){
	if(mouse_check_button_pressed(mb_left)){
		with instance_create_layer(objCursor.x,objCursor.y, "Moving", objDeposit){
			creationcd = 1;
			previous_x = 64 + 96*3;
			previous_y = room_height-(96/2);
		}
	}
}
if(collision_rectangle(32+96*4, room_height-80, 96*5, room_height-16, objCursor, true, true)){
	if(mouse_check_button_pressed(mb_left)){
		with instance_create_layer(objCursor.x,objCursor.y, "Moving", objSplitter){
			creationcd = 1;
			previous_x = 64 + 96*4;
			previous_y = room_height-(96/2);
		}
	}
}
}//end of pause bracket