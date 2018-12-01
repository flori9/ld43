///scene_find_identifier(identifier, ofAlignment, startInverse)
var identifierToFind = argument0, alignmentToFindIdentifierOf = argument1;
if ((argument2 && (alignmentToFindIdentifierOf != alignment_any && alignmentToFindIdentifierOf != alignment_other))
    || (!argument2 && (alignmentToFindIdentifierOf == alignment_any || alignmentToFindIdentifierOf == alignment_other))) {
    for (var i = 0; i < obj_scene.numberOfPositions; i++) {
        var chars = obj_scene.positionList[| i];
        for (var j = 0; j < ds_list_size(chars); j++) {
            var char = chars[| j];
            if (char[? "identifier"] == identifierToFind && (alignmentToFindIdentifierOf == alignment_any || char[? "alignment"] == alignmentToFindIdentifierOf))
                return char;
        }
    }
} else {
    for (var i = obj_scene.numberOfPositions - 1; i >= 0; i--) {
        var chars = obj_scene.positionList[| i];
        for (var j = 0; j < ds_list_size(chars); j++) {
            var char = chars[| j];
            if (char[? "identifier"] == identifierToFind && (alignmentToFindIdentifierOf == alignment_any || char[? "alignment"] == alignmentToFindIdentifierOf))
                return char;
        }
    }
}

return -1;
