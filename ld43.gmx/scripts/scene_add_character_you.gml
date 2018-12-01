///scene_add_character_you(data)
with (obj_scene)
{
    argument0[? "alignment"] = alignment_you;
    var position = 0;
    while (position < numberOfPositions - 1 && !ds_list_empty(positionList[| position]))
        position++;
    ds_list_add_map(obj_scene.positionList[| position], argument0);
}
