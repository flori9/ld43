///scene_add_character_other(data)
with (obj_scene)
{
    argument0[? "alignment"] = alignment_other;
    var position = numberOfPositions - 1;
    while (position > 0 && !ds_list_empty(positionList[| position]))
        position--;
    ds_list_add_map(obj_scene.positionList[| position], argument0);
}
