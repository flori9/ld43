///button_iconed_get_width(text, icon, rightIconsList)
draw_set_font(fnt_small);
var lisize = 0;
if (argument2 > 0)
    lisize = 10 * ds_list_size(argument2);
return 6 + 10 * (argument1 >= 0) + string_width(argument0) + lisize;
