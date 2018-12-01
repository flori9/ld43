///combat_check_reqs(thisAbility, char)
var thisAbility = argument0, char = argument1;
//Check the requirements
var requirementsOK = true;
var costList = ds_list_create();
var cannotUseExplainer = "";
var reqs = thisAbility[? "requirements"];
if (reqs[? "pigs"] > 0) {
    repeat (reqs[? "pigs"])
        ds_list_add(costList, spr_pig_icon_cost);
    var co = scene_count_identifier("pig", char[? "alignment"]);
    if (co < reqs[? "pigs"]) {
        if (reqs[? "pigs"] == 1)
            cannotUseExplainer += "You must have a pig to cast this!";
        else
            cannotUseExplainer += "You must have at least " + string(reqs[? "pigs"]) + " pigs to cast this!";
        requirementsOK = false;
    }
}
if (reqs[? "otherPigs"] > 0) {
    if (scene_count_identifier("pig", !char[? "alignment"]) < reqs[? "otherPigs"]) {
        if (cannotUseExplainer != "") cannotUseExplainer += " ";
        if (reqs[? "otherPigs"] == 1)
            cannotUseExplainer += "Your opponent must have a pig to cast this!";
        else
            cannotUseExplainer += "Your opponent must have at least " + string(reqs[? "otherPigs"]) + " pigs to cast this!";
        requirementsOK = false;
    }
}

return array(requirementsOK, costList, cannotUseExplainer);
