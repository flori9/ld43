///ability_choose_target_ai(findStrat)
var foundAnyActualControllables = false;
var bestFound = -1;

var findStrat = argument0;
var bestHPFound = -1;

//todo: GOOD targets?

for (var i = 0; i < obj_scene.numberOfPositions; i++) {
    var chars = obj_scene.positionList[| i];
    for (var j = 0; j < ds_list_size(chars); j++) {
        var char = chars[| j];
        if ((char[? "alignment"] == alignment_you && findStrat != strategySelf) || (char[? "alignment"] == alignment_other && findStrat == strategySelf)) {
            if (! foundAnyActualControllables)
                bestFound = char;
            if (char[? "hasAbilities"]) {
                if (!foundAnyActualControllables) {
                    bestFound = char;
                    foundAnyActualControllables = true;
                    if (findStrat != strategySelf)
                        bestHPFound = char[? "hp"];
                }
                
                if (findStrat == strategySelf) {
                    if (char[? "maxHP"] - char[? "hp"] > bestHPFound) {
                        bestHPFound = char[? "maxHP"] - char[? "hp"];
                        bestFound = char;
                    }
                }
                else if (findStrat == strategyLowestHP) {
                    if (char[? "hp"] < bestHPFound) {
                        bestHPFound = char[? "hp"];
                        bestFound = char;
                    }
                }
                else if (findStrat == strategyHighestHP) {
                    if (char[? "hp"] > bestHPFound) {
                        bestHPFound = char[? "hp"];
                        bestFound = char;
                    }
                }
            }
        }
        
        if (findStrat == strategyPigs && char[? "identifier"] == "pig")
            bestFound = char;
    }
}
return bestFound;
