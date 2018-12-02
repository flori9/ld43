///combat_do_ai(character)
var char = argument0;
var alig = char[? "alignment"];

var abilityList = char[? "abilities"];
var bestFoundAbility = -1;
var bestFoundPrio = -10000;

for (var i = ds_list_size(abilityList) - 1; i >= 0; i--) {
    var thisAbility = abilityList[| i];
    
    var reqresult = combat_check_reqs(thisAbility, char);
    
    var requirementsOK = reqresult[0];
    var costList = reqresult[1];
    var cannotUseExplainer = reqresult[2];
    
    ds_list_destroy(costList);
    
    if (requirementsOK) {
        //Do this??
        var finalPrio = thisAbility[? "aiPrio"];

        if (finalPrio == aiPrioHeal || finalPrio == aiPrioHealParty) {
            var totalHPToRestore = 0;
            var maxHPToRestore = 0;
            var charsToRestore = 0;
        
            for (var k = 0; k < obj_scene.numberOfPositions; k++) {
                var chars = obj_scene.positionList[| k];
                for (var j = 0; j < ds_list_size(chars); j++) {
                    var ochar = chars[| j];
                    if (ochar[? "alignment"] == alig) {
                        if (ochar[? "hp"] < char[? "maxHP"]) {
                            charsToRestore += 1;
                            totalHPToRestore += ochar[? "maxHP"] - ochar[? "hp"];
                            maxHPToRestore = max(ochar[? "maxHP"] - ochar[? "hp"], maxHPToRestore);
                        }
                    }
                }
            }
            
            if (finalPrio == aiPrioHeal && maxHPToRestore > 0)
                finalPrio = maxHPToRestore;
            else if (finalPrio == aiPrioHeal)
                finalPrio = -1000000;
            if (finalPrio == aiPrioHealParty && totalHPToRestore > 0)
                finalPrio = totalHPToRestore - 1;
            else if (finalPrio == aiPrioHealParty)
                finalPrio = -1000000;
        }
        
        if (finalPrio > bestFoundPrio) {
            bestFoundPrio = finalPrio;
            bestFoundAbility = thisAbility;
        }
    }
}

if (bestFoundAbility >= 0) {
    script_execute(bestFoundAbility[? "script"], bestFoundAbility[? "scriptarg"]);
} else {
    combat_wait(char[? "waitText"]);
}
