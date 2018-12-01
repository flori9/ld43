///scene_find_empty(ofAlignment, startInverse)
var alignmentToFindEmptyOf = argument0;
if ((!argument1 && (alignmentToFindEmptyOf != alignment_any && alignmentToFindEmptyOf != alignment_other))
    || (argument1 && (alignmentToFindEmptyOf == alignment_any || alignmentToFindEmptyOf == alignment_other))) {
    for (var i = 0; i < obj_scene.numberOfPositions; i++) {
        var chars = obj_scene.positionList[| i];
        if (ds_list_size(chars) == 0)
            return i;
    }
} else {
    for (var i = obj_scene.numberOfPositions - 1; i >= 0; i--) {
        var chars = obj_scene.positionList[| i];
        if (ds_list_size(chars) == 0)
            return i;
    }
}

return -1;
