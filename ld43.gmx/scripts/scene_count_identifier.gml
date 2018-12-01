///scene_count_identifier(identifier, ofAlignment)
var identifierToFind = argument0, alignmentToFindIdentifierOf = argument1;
var num = 0;

for (var i = 0; i < obj_scene.numberOfPositions; i++) {
    var chars = obj_scene.positionList[| i];
    for (var j = 0; j < ds_list_size(chars); j++) {
        var char = chars[| j];
        if (char[? "identifier"] == identifierToFind && (alignmentToFindIdentifierOf == alignment_any || char[? "alignment"] == alignmentToFindIdentifierOf))
            num += 1;
    }
}

return num;
