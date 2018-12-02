///scene_destroy_character(char, doDeathAnim)
var char = argument0;
with (ability_protect_sub) {
    if (protectTarget == char) {
        fadeout = true;
        fadein = false;
    }
}
ds_list_delete_first(obj_scene.positionList[| char[? "x"]], char);
if (!argument1)
    ds_map_destroy(char);
else
    obj_scene.deathList[| char[? "x"]] = char;
//
