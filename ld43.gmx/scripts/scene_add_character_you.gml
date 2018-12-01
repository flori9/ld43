///scene_add_character_you(data)
with (obj_scene)
{
    argument0[? "alignment"] = alignment_you;
    var position = 0;
    while (position < numberOfPositions - 1 && !ds_list_empty(positionList[| position]))
        position++;
    scene_add_character(position, argument0);
}
