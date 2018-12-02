///combat_continue()
with (obj_combat) {
    var selfCharacters = 0, otherCharacters = 0;

    for (var i = 0; i < obj_scene.numberOfPositions; i++) {
        var chars = obj_scene.positionList[| i];
        for (var j = 0; j < ds_list_size(chars); j++) {
            var char = chars[| j];
            
            if (char[? "hasAbilities"]) {
                if (char[? "alignment"] == alignment_you)
                    selfCharacters++;
                else if (char[? "alignment"] == alignment_other)
                    otherCharacters++;
            }
        }
    }
    
    if (selfCharacters <= 0) {
        //Defeat!!!
        message_create_simple(postBattleLoseText, -1, -1, -1);
        instance_destroy();
        exit;
    } else if (otherCharacters <= 0) {
        //Win!!!
        var extraPostBattleWinText = "";
        /*if (extraPostBattleWinText != "")*/ {
            if (postBattleWinText != "")
                postBattleWinText += "#";
            
            var healedAnyOne = false;
                
            var healedOnly = "";
            var newNumberOfPigs = 0;
            var stolenPigs = 0;
            var charactersInScene = ds_list_create();
            for (var i = 0; i < obj_scene.numberOfPositions; i++) {
                var chars = obj_scene.positionList[| i];
                for (var j = 0; j < ds_list_size(chars); j++) {
                    var char = chars[| j];
                    if (char[? "alignment"] == alignment_you) {
                        if (char[? "hp"] < char[? "maxHP"]) {
                            healedAnyOne = true;
                            if (healedOnly == "" && char[? "name"] != "the pig")
                                healedOnly = char[? "name"];
                            else
                                healedOnly = "Everybody";
                        }
                    
                        char[? "hp"] = char[? "maxHP"];
                        if (char[? "identifier"] == "pig")
                            newNumberOfPigs += 1;
                        else
                            ds_list_add(charactersInScene, char[? "identifier"]);
                    } else {
                        if (char[? "identifier"] == "pig") {
                            scene_destroy_character(char, true);
                         //   scene_add_character_you(character_get("Pig"));
                         //   newNumberOfPigs += 1;
                         //   stolenPigs += 1;
                        }
                    }
                }
            }
            
            var recoveredAnyOne = false;
            
            for (var i = ds_list_size(obj_partymanager.partyMembers) - 1; i >= 0; i--) {
                if (obj_partymanager.partyMembers[| i] == "Pig")
                    ds_list_delete(obj_partymanager.partyMembers, i);
                else {
                    if (ds_list_find_index(charactersInScene, obj_partymanager.partyMembers[| i]) == -1) {
                        scene_add_character_you(character_get(obj_partymanager.partyMembers[| i]));
                        recoveredAnyOne = true;
                    }
                }
            }
            
            if (healedAnyOne && recoveredAnyOne)
                extraPostBattleWinText = "Your fallen team members have recovered, and everybody has been healed.";
            else if (recoveredAnyOne)
                extraPostBattleWinText = "Your fallen team members have recovered.";
            else if (healedAnyOne) {
                extraPostBattleWinText = string_capitalize_first(healedOnly) + " has been healed.";
            }
            
            if (stolenPigs > 1)
                extraPostBattleWinText += iif(extraPostBattleWinText == "", "", " ") + "You stole the pigs of your enemy.";
            else if (stolenPigs == 1)
                extraPostBattleWinText += iif(extraPostBattleWinText == "", "", " ") + "You stole the pig of your enemy.";
                
           // repeat (newNumberOfPigs)
          //      ds_list_add(obj_partymanager.partyMembers, "Pig");
               
            postBattleWinText += extraPostBattleWinText;
        }
        
        if (postBattleWinText == "")
            script_execute(postBattleScript, postBattleScriptArg);
        else
            message_create_simple(postBattleWinText, postBattleScript, postBattleScriptArg, -1);
        instance_destroy();
        exit;
    }

    var firstCombatX = currentCombatX;
    var wrappedOnce = false;
    var combatJ = 0;
    
    combatCharacter = -1;
    
    while (true) {
        currentCombatX += 1;
        
        if (currentCombatX >= obj_scene.numberOfPositions) {
            currentCombatX = 0;
            if (wrappedOnce) break;
            wrappedOnce = true;
        }
        
        var posList = obj_scene.positionList[| currentCombatX];
        if (ds_list_size(posList) > 0) {
            combatCharacter = posList[| 0];
            
            //Check for poison on this character
            with (ability_pigpoison_sub) {
                if (protectTarget == other.combatCharacter) {
                    var thisPoison = id;
                    with (instance_create(x, y, obj_ability_pigpoison_minipoison))
                        targety = thisPoison.targety;
                        
                    var ret = character_do_damage(other.combatCharacter, 1);
                    if (ret[1]) {
                        combat_show_result_message(other.combatCharacter[? "name"] + " has been killed by poison!", -1);
                        exit;
                    }
                }
            }
            
            if (combatCharacter[? "hasAbilities"]) {
                break;
            }
        }
    }
    
    if (combatCharacter != -1) {
        if (combatCharacter[? "name"] == "Runar") {
            with (ability_protect_sub) fadein = false;
            with (ability_protect_sub) fadeout = true;
        }
        
        if (combatCharacter[? "alignment"] == alignment_other)
            combat_do_ai(combatCharacter);
        else
            combat_init_ability_choice_message(combatCharacter);
    }
    else {
        var msg = instance_create(0, 0, obj_message);
        msg.messageText = "Oh no, the battle exploded the universe!";
    }
}
