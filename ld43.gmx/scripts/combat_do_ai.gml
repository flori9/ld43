///combat_do_ai(character)
var char = argument0;

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
        if (thisAbility[? "aiPrio"] > bestFoundPrio) {
            bestFoundPrio = thisAbility[? "aiPrio"];
            bestFoundAbility = thisAbility;
        }
    }
}

if (bestFoundAbility >= 0) {
    script_execute(bestFoundAbility[? "script"], bestFoundAbility[? "scriptarg"]);
} else {
    combat_wait(char[? "name"] + " waited.");
}
