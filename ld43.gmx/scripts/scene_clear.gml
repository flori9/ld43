///scene_clear()
for (var i = 0; i < obj_scene.numberOfPositions; i++) {
    var chars = obj_scene.positionList[| i];
    ds_list_clear(chars);
}

with (par_ability) instance_destroy();
with (ability_protect_sub) instance_destroy();
with (obj_ability_part_pigbloodhealdrop) instance_destroy();
with (obj_ability_part_normalhealdrop) instance_destroy();
with (obj_ability_part_pigsurgedrop) instance_destroy();
with (obj_ability_part_normalhealdrop) instance_destroy();
with (ability_pigpoison_sub) instance_destroy();
with (obj_ability_pigpoison_minipoison) instance_destroy();
