///do_button_iconed(x, y, width, text, sprite, icon, rightIcons)
var mouseover = 0, clicked = false;

if (mouse_in_box_wh(argument0, argument1, argument2, 14))
{
    mouseover = 1;
    if (mouse_check_button_pressed(mb_left) && age > 3) {
        clicked = true;
    }
}
draw_panel_sprite(argument0, argument1, argument2, 14, argument4, mouseover);
draw_set_font(fnt_small);
draw_set_color(textcolor);
draw_set_halign(fa_left);
draw_text(argument0 + iif(argument5 >= 0, 12, 3), argument1 + 3, argument3);
if (argument5 >= 0)
    draw_sprite(argument5, 0, argument0 + 3, argument1 + 2);
    
if (argument6 >= 0) {
    var lisize = ds_list_size(argument6);
    for (var i = 0; i < lisize; i++)
        draw_sprite(argument6[| i], 0, argument0 + argument2 - 2 - lisize * 10 + i * 10, argument1 + 2);
}

return clicked;

