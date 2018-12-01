///scene_destroy_character(char)
var char = argument0;
ds_list_delete_first(obj_scene.positionList[| char[? "x"]], char);
ds_map_destroy(char);
