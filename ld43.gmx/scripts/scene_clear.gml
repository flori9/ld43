///scene_clear()
for (var i = 0; i < obj_scene.numberOfPositions; i++) {
    var chars = obj_scene.positionList[| i];
    ds_list_clear(chars);
}
