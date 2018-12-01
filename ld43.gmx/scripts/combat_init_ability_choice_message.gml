///combat_init_ability_choice_message(character)
with (obj_targetselector) instance_destroy();

var char = argument0;
var msg = instance_create(0, 0, obj_message);
msg.tooltipAlt = "Choose an action!";
msg.headerInfo = char;

//Let's line out their actions
with (msg) {
    var abilityList = char[? "abilities"];
    for (var i = 0; i < ds_list_size(abilityList); i++) {
        var thisAbility = abilityList[| i];
        //Check the requirements
        var requirementsOK = true;
        var costList = ds_list_create();
        var cannotUseExplainer = "";
        var reqs = thisAbility[? "requirements"];
        if (reqs[? "pigs"] > 0) {
            repeat (reqs[? "pigs"])
                ds_list_add(costList, spr_pig_icon_cost);
            if (scene_count_identifier("pig", char[? "alignment"]) < reqs[? "pigs"]) {
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
        
        var tooltipText = thisAbility[? "tooltip"];
        if (cannotUseExplainer != "")
            tooltipText = cannotUseExplainer;
        
        message_button_add(thisAbility[? "name"], -1, costList /*cost*/, thisAbility[? "script"], thisAbility[? "scriptarg"], tooltipText, requirementsOK);
    }
    
    if (char[? "alignment"] == alignment_you)
        message_button_add("Wait", -1, -1 /*cost*/, combat_continue_witharg, -1, "Skip a turn.", true);
    else
        message_button_add("Wait", -1, -1 /*cost*/, combat_wait, char[? "name"] + " waited.", "Skip a turn.", true);
}
