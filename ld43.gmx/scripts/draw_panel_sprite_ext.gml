///draw_panel_sprite_ext(x, y, width, height, sprite, image, color, alpha)
// Draw a panel, or a button, from a sprite
var xx = argument0, yy = argument1, ww = argument2, hh = argument3, sprite = argument4, image = argument5, color = argument6, alpha = argument7;
var sprw = sprite_get_width(sprite), sprh = sprite_get_height(sprite);

//Corners
var widthfromsprite = min(sprw / 4, ww / 2), heightfromsprite = min(sprh / 4, hh / 2);
draw_sprite_part_ext(sprite, image, 0, 0, widthfromsprite, heightfromsprite, xx, yy, 1, 1, color, alpha); //Top left
draw_sprite_part_ext(sprite, image, 0, sprh - heightfromsprite, widthfromsprite, heightfromsprite, xx, yy + hh - heightfromsprite, 1, 1, color, alpha); //Bottom left
draw_sprite_part_ext(sprite, image, sprw - widthfromsprite, 0, widthfromsprite, heightfromsprite, xx + ww - widthfromsprite, yy, 1, 1, color, alpha); //Top right
draw_sprite_part_ext(sprite, image, sprw - widthfromsprite, sprh - heightfromsprite, widthfromsprite, heightfromsprite, xx + ww - widthfromsprite, yy + hh - heightfromsprite, 1, 1, color, alpha); //Bottom right

//Sides
var sidew = sprw - widthfromsprite * 2, sideh = sprh - heightfromsprite * 2;
if (sidew == 0)
    var xscale = 0;
else
    var xscale = (ww - widthfromsprite * 2) / sidew;
if (sideh == 0)
    var yscale = 0;
else
    var yscale = (hh - heightfromsprite * 2) / sideh;
draw_sprite_part_ext(sprite, image, widthfromsprite, 0, sidew, heightfromsprite, xx + widthfromsprite, yy, xscale, 1, color, alpha); //Top
draw_sprite_part_ext(sprite, image, widthfromsprite, sprh - heightfromsprite, sidew, heightfromsprite, xx + widthfromsprite, yy + hh - heightfromsprite, xscale, 1, color, alpha); //Bottom
draw_sprite_part_ext(sprite, image, 0, heightfromsprite, widthfromsprite, sideh, xx, yy + heightfromsprite, 1, yscale, color, alpha); //Left
draw_sprite_part_ext(sprite, image, sprw - widthfromsprite, heightfromsprite, widthfromsprite, sideh, xx + ww - widthfromsprite, yy + heightfromsprite, 1, yscale, color, alpha); //Right

//Center
draw_sprite_part_ext(sprite, image, widthfromsprite, heightfromsprite, sprw - widthfromsprite * 2, sprh - heightfromsprite * 2, xx + widthfromsprite, yy + heightfromsprite, xscale, yscale, color, alpha);




