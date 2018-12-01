///character_create_ext(sprite, index, wandx, wandy, name, title, portrait, hp, abilities)
var char = character_create(argument0, argument1, argument4);
char[? "wandx"] = argument2;
char[? "wandy"] = argument3;

char[? "name"] = argument4;
char[? "title"] = argument5;
char[? "portrait"] = argument6;

char[? "hp"] = argument7;
char[? "maxHP"] = argument7;
ds_map_add_list(char, "abilities", argument8);
char[? "hasAbilities"] = true;

return char;
