///scene2_do()
var arg = argument0;

var doAttack = false;
var goToEnd = false;

var thisSub = 0;
var sub = obj_scene2.currentSub;

if (thisSub == sub) {
    with (message_create_simple("After a short walk, you arrive at the pig farm.", -1, -1, -1))
        message_button_add("Steal some pigs", spr_mage2_icon, -1, scene2_do, -1, "", true);
}
thisSub++;

if (thisSub == sub) {
    var char = scene_find_identifier("pig", alignment_other, false)
    while (char  != -1) {
        scene_destroy_character(char, false);
        scene_add_character_you(character_get("Pig"));
        
        char = scene_find_identifier("pig", alignment_other, false)
    }

    message_create_simple("You steal some pigs.", scene2_do, -1, -1);
}
thisSub++;

if (thisSub == sub) {
    obj_scene2.farmerCharacter = character_get("Farmer");
    scene_add_character_other(character_get("Pig"));
    scene_add_character_other(obj_scene2.farmerCharacter);
    
    with (message_create_simple("Hey! What are you doing with my pigs?", -1, -1, obj_scene2.farmerCharacter )) {
        message_button_add("Threatening", spr_mage2_icon, -1, scene2_do, 1, "", true);
        message_button_add("Excusing", spr_mage2_icon, -1, scene2_do, 2, "", true);
        message_button_add("Attack!", spr_mage2_icon, -1, scene2_do, 3, "", true);
    }
}
thisSub++;

if (thisSub == sub) {
    switch (arg) {
        case 1:
            message_create_simple("I'm much more powerful than you, so I would just look the other way if I were you. That's much easier for both of us.", scene2_do, 1, scene_find_identifier("Inugor", alignment_you, false) );
            break;
        case 2:
            message_create_simple("I'm just looking at them. They are beautiful pigs, aren't they?", scene2_do, 2, scene_find_identifier("Inugor", alignment_you, false) );
            break;
        case 3:
            doAttack = true;
            break;
    }
}
thisSub++;

if (thisSub == sub) {
    var knowsMagicText = "Fortunately, I learned some magic when I was young";
    
    switch (arg) {
        case 1:
            with (message_create_simple(knowsMagicText + ", so I would run away if I were you!", -1, -1, obj_scene2.farmerCharacter )) {
                message_button_add("Attack!", spr_mage2_icon, -1, scene2_do, 1, "", true);
                //message_button_add("Excusing", spr_mage2_icon, -1, scene2_do, 2, "", true);
            }
            break;
        case 2:
            with (message_create_simple("There are beautiful pigs, but I don't believe you for a second! You look way too evil for that.#You must be trying to steal them. " + knowsMagicText + ", so I would run away if I were you!", -1, -1, obj_scene2.farmerCharacter )) {
                message_button_add("Deny", spr_mage2_icon, -1, scene2_do, 2, "", true);
                message_button_add("Attack!", spr_mage2_icon, -1, scene2_do, 1, "", true);
            }
            break;
    }
}
thisSub++;

if (thisSub == sub) {
    switch (arg) {
        case 1: doAttack = true; break;
        case 2:
            message_create_simple("Judging people on their appearance is not good behaviour; you know that, right? Should I call the Goodness Police? And I really was just looking at them, so you have nothing to worry about.", scene2_do, 1, scene_find_identifier("Inugor", alignment_you, false));
            break;
    }
}
thisSub++;

//Deny path!
if (thisSub == sub) {
    with (message_create_simple("I'm just a bit worried about these beautiful pigs, okay? I can't have suspicious people looking at them all day. But if you go away now, I won't do anything.",
        -1, -1, obj_scene2.farmerCharacter )) {
        message_button_add("Accept", spr_mage2_icon, -1, scene2_do, 1, "", true);
        message_button_add("Attack!", spr_mage2_icon, -1, scene2_do, 2, "", true);
    }
}
thisSub++;

if (thisSub == sub) {
    switch (arg) {
        case 1:
            message_create_simple("You walk away from the farm without the pigs you tried to steal.", scene2_do, 1, -1 );
            scene_clear();
            scene_init_ownparty();
            break;
        case 2:
            doAttack = true;
            break;
    }
}
thisSub++;

if (thisSub == sub) {
    goToEnd = true;
}
thisSub++;

if (thisSub == sub || doAttack) {
    obj_scene2.currentSub = thisSub;

    with (instance_create(0, 0, obj_combat)) {
        postBattleScript = scene2_do;
        //postBattleWinText = "";
    }
}
thisSub++;

if (thisSub == sub || goToEnd) {
    obj_scene2.currentSub = thisSub;

    message_create_simple("todo", scene2_do, 1, -1 );
}
thisSub++;

obj_scene2.currentSub += 1;
