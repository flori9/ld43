///scene_get_centerx(char)
var xx = scene_get_x(argument0);
if (argument0[? "alignment"] == alignment_you)
    return xx + argument0[? "centerx"];
return xx + tileWidth - argument0[? "centerx"];
