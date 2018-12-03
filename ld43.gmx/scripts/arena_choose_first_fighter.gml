///arena_choose_first_fighter(fighter)
if (argument0 == "battle_done_fail") {
    scene_clear();
    
    with (message_create_simple("Sorry, but we can't let you participate if you can't even defeat the farmer. Please train some more and come back later.", -1, -1, -1))
        message_button_add("Restart", -1, -1, arena_restart, -1, "", true);
} else if (argument0 == "battle_done") {
    arena_scene_show_all(false);

    with (message_create_simple("Good job! Now, you'll continue fighting in pairs. Who will be your fighting partner?", -1, -1, -1)) {
        arena_init_charchoice(arena_nextfights);
    }
} else if (argument0 == "battle") {
    with (instance_create(0, 0, obj_combat)) {
        //todo: losing this battle
        postBattleScript = arena_choose_first_fighter;
        postBattleScriptArg = "battle_done";
        
        postBattleLoseScript = arena_choose_first_fighter;
        postBattleLoseScriptArg = "battle_done_fail";
    }
} else {
    ds_list_add(obj_partymanager.partyMembers, argument0);
    scene_clear();
    scene_init_ownparty();
    scene_add_character_other(character_get("Pig"));
    var farmer = character_get("Farmer");
    if (argument0 == "Greatbeard") {
        farmer[? "hp"] = 2;
        farmer[? "maxHP"] = 2;
    }
    scene_add_character_other(farmer);
    
    message_create_simple("Alright, good luck!", arena_choose_first_fighter, "battle", -1);
}
