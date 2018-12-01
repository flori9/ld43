///character_create(sprite, index, identifier, hp, name, centerx, centery)
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
charmap[? "hpAnim"] = 0;
charmap[? "prevHP"] = argument3;

charmap[? "centerx"] = argument5;
charmap[? "centery"] = argument6;
return charmap;
