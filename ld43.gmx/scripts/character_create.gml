///character_create(sprite, index, identifier, hp, name)
var charmap = ds_map_create();
charmap[? "sprite"] = argument0;
charmap[? "image"] = argument1;
charmap[? "alignment"] = alignment_you;
charmap[? "hasAbilities"] = false;
charmap[? "identifier"] = argument2;
charmap[? "hp"] = argument3;
charmap[? "maxHP"] = argument3;
charmap[? "x"] = -1;
charmap[? "drawer"] = characterdrawer_normal;
charmap[? "drawerarg"] = -1;
charmap[? "damageAnim"] = 0;
charmap[? "damageAnimStopping"] = true;
charmap[? "deathAnim"] = 0;
charmap[? "heSheIt"] = "it";
charmap[? "name"] = argument4;
return charmap;
