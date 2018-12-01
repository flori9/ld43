///do_button_sprite(x, y, 7x7sprite, index, isActive, tooltipx, tooltipy, tooltiptext)
var mouseover = 0, clicked = false;
var bgspr = spr_button;
if (argument4)
    bgspr = spr_button_active;

if (mouse_in_box_wh(argument0, argument1, 11, 11))
{
    mouseover = 1;
    draw_set_color(textcolor);
    draw_set_font(fnt_tiny);
    draw_text(argument5, argument6, argument7);
    if (mouse_check_button_pressed(mb_left) && age > 3) {
        clicked = true;
    }
}
draw_set_alpha(1);
draw_panel_sprite(argument0, argument1, 11, 11, bgspr, mouseover);

draw_sprite_ext(argument2, argument3, argument0 + 2, argument1 + 2, 1, 1, 0, iif(argument4, textcolordark, textcolor), 1);

return clicked;

