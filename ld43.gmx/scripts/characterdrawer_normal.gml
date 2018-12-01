///characterdrawer_normal(char, i, isRotated, arg)
var char = argument0, i = argument1, isRotated = argument2, arg = argument3;
draw_sprite_ext(char[? "sprite"], char[? "image"], (i + isRotated) * tileWidth, drawAtY, iif(isRotated, -1, 1), 1, 0, merge_color(c_white, damageColor, char[? "damageAnim"]), 1);
