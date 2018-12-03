///combat_check_reqs(thisAbility, char)
var thisAbility = argument0, char = argument1;
//Check the requirements
var requirementsOK = true;
var costList = ds_list_create();
var cannotUseExplainer = "";
var reqs = thisAbility[? "requirements"];
if (reqs[? "mana"] > 0) {
    repeat (reqs[? "mana"])
        ds_list_add(costList, spr_mana_req);

    if (char[? "mana"] < reqs[? "mana"]) {
        if (cannotUseExplainer != "") cannotUseExplainer += " ";
        if (reqs[? "mana"] == 1)
            cannotUseExplainer += "You must have at least one mana to cast this!";
        else
            cannotUseExplainer += "You must have at least " + string(reqs[? "mana"]) + " mana to cast this!";
        requirementsOK = false;
    }
}

if (reqs[? "hp"] > 0) {
    repeat (reqs[? "hp"] - 1)
        ds_list_add(costList, spr_hp_req);

    if (char[? "hp"] < reqs[? "hp"]) {
        if (cannotUseExplainer != "") cannotUseExplainer += " ";
        if (reqs[? "hp"] == 2)
            cannotUseExplainer += "You cannot kill yourself with this spell!";
        else
            cannotUseExplainer += "You must have at least " + string(reqs[? "hp"]) + " mana to cast this!";
        requirementsOK = false;
    }
}

if (reqs[? "pigs"] > 0) {
    repeat (reqs[? "pigs"])
        ds_list_add(costList, spr_pig_icon_cost);
    var co = scene_count_identifier("pig", char[? "alignment"]);
    if (co < reqs[? "pigs"]) {
        if (reqs[? "pigs"] == 1 && (reqs[? "mana"] == 1)) {
            cannotUseExplainer = "You must have one mana and a pig to cast this!";
        }
        else if (reqs[? "pigs"] == 1)
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

if (reqs[? "space"] > 0) {
    if (scene_find_emptynum() < reqs[? "space"]) {
        if (cannotUseExplainer != "") cannotUseExplainer += " ";
        cannotUseExplainer += "There's not enough space to cast this!";
        requirementsOK = false;
    }
}

return array(requirementsOK, costList, cannotUseExplainer);
