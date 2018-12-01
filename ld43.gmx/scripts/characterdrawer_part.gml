///characterdrawer_part(char, i, isRotated, arg)
var char = argument0, i = argument1, isRotated = argument2, part = argument3;
var sprh = sprite_get_height(char[? "sprite"]);
draw_sprite_part_ext(char[? "sprite"], char[? "image"], 0, part, sprite_get_width(char[? "sprite"]), sprh - part, (i + isRotated) * tileWidth, drawAtY + part, iif(isRotated, -1, 1), 1, merge_color(c_white, damageColor, char[? "damageAnim"]), 1);
