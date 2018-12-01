///character_create_ext(sprite, index, wandx, wandy, name, title, portrait, hp, abilities, heSheIt, centerx, centery)
var char = character_create(argument0, argument1, argument4, argument7, argument4, argument10, argument11);
char[? "wandx"] = argument2;
char[? "wandy"] = argument3;

char[? "name"] = argument4;
char[? "title"] = argument5;
char[? "portrait"] = argument6;

ds_map_add_list(char, "abilities", argument8);
char[? "hasAbilities"] = true;
char[? "heSheIt"] = argument9;

return char;
