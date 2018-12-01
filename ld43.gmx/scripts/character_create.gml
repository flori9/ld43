///character_create(sprite, index, identifier)
var charmap = ds_map_create();
charmap[? "sprite"] = argument0;
charmap[? "image"] = argument1;
charmap[? "alignment"] = alignment_you;
charmap[? "hasAbilities"] = false;
charmap[? "identifier"] = argument2;
charmap[? "x"] = -1;
charmap[? "drawer"] = characterdrawer_normal;
charmap[? "drawerarg"] = -1;
charmap[? "damageAnim"] = 0;
charmap[? "damageAnimStopping"] = true;
return charmap;
