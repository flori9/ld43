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
        
        var reqresult = combat_check_reqs(thisAbility, char);
        
        var requirementsOK = reqresult[0];
        var costList = reqresult[1];
        var cannotUseExplainer = reqresult[2];
        
        var tooltipText = thisAbility[? "tooltip"];
        if (cannotUseExplainer != "")
            tooltipText = cannotUseExplainer;
        
        message_button_add(thisAbility[? "name"], -1, costList /*cost*/, thisAbility[? "script"], thisAbility[? "scriptarg"], tooltipText, requirementsOK);
    }
    
    //if (char[? "alignment"] == alignment_you)
    //    message_button_add("Wait", -1, -1 /*cost*/, combat_continue_witharg, -1, "Skip a turn.", true);
    //else
    message_button_add("Wait", -1, -1 /*cost*/, combat_wait, char[? "name"] + " waited.", "Skip a turn.", true);
}
