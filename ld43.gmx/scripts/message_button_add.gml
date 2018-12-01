///message_button_add(text, mainicon, othericons, script, arg, tooltip, enabled)
var button = ds_map_create();
button[? "text"] = argument0;
button[? "mainicon"] = argument1;
button[? "script"] = argument3;
button[? "arg"] = argument4;
if (argument2 >= 0)
    ds_map_add_list(button, "otherIcons", argument2);
else
    button[? "otherIcons"] = argument2;
button[? "tooltip"] = argument5;
button[? "enabled"] = argument6;
ds_list_add_map(buttons, button);
return button;
