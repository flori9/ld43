///combat_continue()
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
        
        if (combatCharacter[? "hasAbilities"]) {
            break;
        }
    }
}

if (combatCharacter != -1) {
    combat_init_ability_choice_message(combatCharacter);
}
else {
    var msg = instance_create(0, 0, obj_message);
    msg.messageText = "Oh no, the battle exploded the universe!";
}
