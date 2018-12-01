///ability_choose_target(argarray)
var targetalignment = argument0[0], abilityscript = argument0[1], abilityarg = argument0[2], abilityname = argument0[3];
var char = obj_combat.combatCharacter;
if (char[? "alignment"] == alignment_other) {
    script_execute(abilityscript, abilityarg, obj_combat.combatCharacter, ability_choose_target_ai(argument0[4]));
} else {
    var msg = instance_create(0, 0, obj_message);
    msg.messageText = "Click on a target to cast " + abilityname + ".";
    msg.headerInfo = char;
    with (msg)
        message_button_add("Cancel", -1, -1, combat_init_ability_choice_message, char, "", true);
        
    with (instance_create(0, 0, obj_targetselector)) {
        chooseFromAlignment = targetalignment;
        thenContinueWithScript = abilityscript;
        thenContinueWithArg = abilityarg;
    }
}
