///scene_find_emptynum()
var num = 0;
for (var i = 0; i < obj_scene.numberOfPositions; i++) {
    var chars = obj_scene.positionList[| i];
    if (ds_list_size(chars) == 0)
        num ++;
}

return num;
