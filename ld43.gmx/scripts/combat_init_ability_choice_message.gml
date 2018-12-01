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
        message_button_add(thisAbility[? "name"], -1, -1 /*cost*/, thisAbility[? "script"], thisAbility[? "scriptarg"], thisAbility[? "tooltip"]);
    }
}
