hold = false;
snap = false;
move = false;
moveCheck_x = false;
moveCheck_y = false;

previous_x = x;
previous_y = y;

image_speed = 0;
frameSet = 0;
dir = 1; //direction can be 1-4 depending on what direction the belt will face
creationcd = 0;

rgb = array_create(6,0); //array for colors; 0-2 is for the rgb of color 1 and 3-5 is rgb of color 2
inputLeft = false;
inputRight = false;