///scene_destroy_character(char, doDeathAnim)
var char = argument0;
ds_list_delete_first(obj_scene.positionList[| char[? "x"]], char);
if (!argument1)
    ds_map_destroy(char);
else
    obj_scene.deathList[| char[? "x"]] = char;
//
