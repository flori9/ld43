///arena_nextfights(member)
var standardText = "This game has been made by Florian van Strien in 48 hours for Ludum Dare 43 'Sacrifices must be made'. Thanks for playing!";
if (argument0 == "battle3_done") {
    scene_clear();
    scene_init_ownparty();
    
    with (message_create_simple("You've won! Great job! Your magic powers will be known throughout the kingdom.##" + standardText, -1, -1, -1))
        message_button_add("Play Again", -1, -1, arena_restart, -1, "", true);
}
else if (argument0 == "battle3_done_lose") {
    scene_clear();
    scene_init_ownparty();
    
    with (message_create_simple("You've lost the final, but still played well.##" + standardText, -1, -1, -1))
        message_button_add("Play Again", -1, -1, arena_restart, -1, "", true);
}
else if (argument0 == "battle3") {
    with (instance_create(0, 0, obj_combat)) {
        postBattleScript = arena_nextfights;
        postBattleScriptArg = "battle3_done";
        postBattleLoseScript = arena_nextfights;
        postBattleLoseScriptArg = "battle3_done_lose";
    }
} else if (argument0 == "battle3_start") {
    var finalTeamMembers;    

    with (obj_arena) {
        var allPeople = array("Inugor", "Povatrix", "Ezobur", "Runar", "Acorn", "Greatbeard");
        for (var i = 0; i < 3; i++) {
            var thisPerson = "";
            while (thisPerson == "") {
                var iii = irandom(5);
                thisPerson = allPeople[iii];
                if (ds_list_find_index(obj_partymanager.partyMembers, thisPerson) >= 0)
                    thisPerson = "";
                allPeople[iii] = "";
            }
            finalTeamMembers[i] = thisPerson;
        }
    }
    
    scene_clear();
    scene_init_ownparty();
    scene_add_character_other(character_get("Pig"));
    scene_add_character_other(character_get("Pig"));
    scene_add_character_other(character_get("Pig"));
    scene_add_character_other(character_get(finalTeamMembers[0]));
    scene_add_character_other(character_get(finalTeamMembers[1]));
    scene_add_character_other(character_get(finalTeamMembers[2]));

    message_create_simple("Let's fight, for the final time!", arena_nextfights, "battle3", -1);
}
else if (argument0 == "battle2_done" || argument0 == "battle2_done_lose") {
    obj_arena.twoPlayerNonPlayerTeamLoss[1] = true;
    var extraText = "";
    if (argument0 == "battle2_done_lose") {
        obj_arena.losses += 1;
        obj_arena.twoPlayerNonPlayerTeamLoss[1] = false;
        if (obj_arena.losses >= 2) {
            scene_clear();
            scene_init_ownparty();
            
            with (message_create_simple("You've lost twice now, so I'm afraid we can't let you continue. Better luck next time!", -1, -1, -1))
                message_button_add("Restart", -1, -1, arena_restart, -1, "", true);
            exit;
        }
    } else extraText = "Well done! ";
    scene_clear();
    scene_init_ownparty();
    /*scene_add_character_other(character_get("Pig"));
    scene_add_character_other(character_get("Pig"));
    scene_add_character_other(character_get("Pig"));
    scene_add_character_other(character_get(obj_arena.twoPlayerNonPlayerTeamMembers[2]));
    scene_add_character_other(character_get(obj_arena.twoPlayerNonPlayerTeamMembers[3]));*/
    
    if (obj_arena.twoPlayerNonPlayerTeamLoss[0] + obj_arena.twoPlayerNonPlayerTeamLoss[1] == 2) {
        var addedName = "";
        var teamMemberOptions;
        if (irandom(1) == 1) {
            teamMemberOptions = array(obj_arena.twoPlayerNonPlayerTeamMembers[0], obj_arena.twoPlayerNonPlayerTeamMembers[1]);
        } else {
            teamMemberOptions = array(obj_arena.twoPlayerNonPlayerTeamMembers[2], obj_arena.twoPlayerNonPlayerTeamMembers[3]);
        }  
        with (message_create_simple(extraText + "The final fight will be played with two teams of three mages. As you won both battles, you may choose a team member from the team that lost both battles. The other team will get the remaining team member, so choose wisely!", -1, -1, -1)) {
            forceButtonsAtThirdW = true;
            message_button_add("Inugor", spr_mage2_icon, -1, arena_nextfights_choosefinal, "Inugor", "A dark mage.", teamMemberOptions[0] == "Inugor" || teamMemberOptions[1] == "Inugor");
            message_button_add("Povatrix", spr_mage5_icon, -1, arena_nextfights_choosefinal, "Povatrix", "Can always call pigs.", teamMemberOptions[0] == "Povatrix" || teamMemberOptions[1] == "Povatrix");
            message_button_add("Ezobur", spr_mage3_icon, -1, arena_nextfights_choosefinal, "Ezobur", "Loves making things fly!", teamMemberOptions[0] == "Ezobur" || teamMemberOptions[1] == "Ezobur");
            message_button_add("Runar", spr_mage0_icon, -1, arena_nextfights_choosefinal, "Runar", "A wise wizard.", teamMemberOptions[0] == "Runar" || teamMemberOptions[1] == "Runar");
            message_button_add("Acorn", spr_mage6_icon, -1, arena_nextfights_choosefinal, "Acorn", "Likes poison and nature.", teamMemberOptions[0] == "Acorn" || teamMemberOptions[1] == "Acorn");
            message_button_add("Greatbeard", spr_mage4_icon, -1, arena_nextfights_choosefinal, "Greatbeard", "A great healer.", teamMemberOptions[0] == "Greatbeard" || teamMemberOptions[1] == "Greatbeard");
        }
    } else {
        var addedName = "";
        if (obj_arena.twoPlayerNonPlayerTeamLoss[0]) {
            addedName = choose(obj_arena.twoPlayerNonPlayerTeamMembers[0], obj_arena.twoPlayerNonPlayerTeamMembers[1]);
        }
        if (obj_arena.twoPlayerNonPlayerTeamLoss[1]) {
            addedName = choose(obj_arena.twoPlayerNonPlayerTeamMembers[2], obj_arena.twoPlayerNonPlayerTeamMembers[3]);
        }
        
        message_create_simple(extraText + "The final fight will be played with two teams of three mages. As you lost one of your battles, the other team member could choose their extra team member, and " + addedName + " has been added to your team.", arena_nextfights, "battle3_start", -1);
    }
} else if (argument0 == "battle2") {
    with (instance_create(0, 0, obj_combat)) {
        //todo: losing this battle
        postBattleScript = arena_nextfights;
        postBattleScriptArg = "battle2_done";
        postBattleLoseScript = arena_nextfights;
        postBattleLoseScriptArg = "battle2_done_lose";
    }
} else if (argument0 == "battle_done") {
    scene_clear();
    scene_init_ownparty();
    scene_add_character_other(character_get("Pig"));
    scene_add_character_other(character_get("Pig"));
    scene_add_character_other(character_get("Pig"));
    scene_add_character_other(character_get(obj_arena.twoPlayerNonPlayerTeamMembers[2]));
    scene_add_character_other(character_get(obj_arena.twoPlayerNonPlayerTeamMembers[3]));
    obj_arena.twoPlayerNonPlayerTeamLoss[0] = 1;
    
    message_create_simple("Good job! Ready for the next battle?", arena_nextfights, "battle2", -1);
}
else if (argument0 == "battle_done_lose") {
    scene_clear();
    obj_arena.losses += 1;
    scene_init_ownparty();
    scene_add_character_other(character_get("Pig"));
    scene_add_character_other(character_get("Pig"));
    scene_add_character_other(character_get("Pig"));
    scene_add_character_other(character_get(obj_arena.twoPlayerNonPlayerTeamMembers[2]));
    scene_add_character_other(character_get(obj_arena.twoPlayerNonPlayerTeamMembers[3]));
    obj_arena.twoPlayerNonPlayerTeamLoss[0] = 0;
    
    message_create_simple("Too bad that you lost, but losing a battle can happen. Just don't lose this one too, or we'll have to split up your team for the final battle.", arena_nextfights, "battle2", -1);
}
else if (argument0 == "battle") {
    with (instance_create(0, 0, obj_combat)) {
        //todo: losing this battle
        postBattleScript = arena_nextfights;
        postBattleScriptArg = "battle_done";
        postBattleLoseScript = arena_nextfights;
        postBattleLoseScriptArg = "battle_done_lose";
    }
} else {
    ds_list_add(obj_partymanager.partyMembers, argument0);
    
    with (obj_arena) {
        var allPeople = array("Inugor", "Povatrix", "Ezobur", "Runar", "Acorn", "Greatbeard");
        for (var i = 0; i < 4; i++) {
            var thisPerson = "";
            while (thisPerson == "") {
                var iii = irandom(5);
                thisPerson = allPeople[iii];
                if (ds_list_find_index(obj_partymanager.partyMembers, thisPerson) >= 0)
                    thisPerson = "";
                allPeople[iii] = "";
            }
            twoPlayerNonPlayerTeamMembers[i] = thisPerson;
        }
    }
    
    scene_clear();
    scene_init_ownparty();
    scene_add_character_other(character_get("Pig"));
    scene_add_character_other(character_get("Pig"));
    scene_add_character_other(character_get("Pig"));
    scene_add_character_other(character_get(obj_arena.twoPlayerNonPlayerTeamMembers[0]));
    scene_add_character_other(character_get(obj_arena.twoPlayerNonPlayerTeamMembers[1]));
    
    message_create_simple("Let's fight!", arena_nextfights, "battle", -1);
}
