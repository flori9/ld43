///ability_do_fromstaff(ability, fromCharacter, onCharacter)
var char = argument1;
var targetChar = argument2;
var ability = instance_create(char[? "x"] * tileWidth + iif(argument1[? "alignment"] == alignment_you, char[? "wandx"], tileWidth - char[? "wandx"]), obj_scene.drawAtY + char[? "wandy"], argument0);
ability.target = targetChar;
ability.fromCharacter = char;
ability.myAlignment = argument1[? "alignment"];
ability.otherAlignment = alignment_any;
if (argument2 >= 0)
    ability.otherAlignment = argument2[? "alignment"];
