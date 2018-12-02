///scene_init_ownparty()
var pigsFound = 0;
var othersFound = 0;
for (var i = 0; i < ds_list_size(obj_partymanager.partyMembers); i++) {
    if (obj_partymanager.partyMembers[| i] != "Pig") {
        othersFound++;
    } else
        pigsFound++;
}

pigsFound = obj_partymanager.numberOfPigs;

repeat (pigsFound) {
    if (scene_find_emptynum() > othersFound) {
        scene_add_character_you(character_get("Pig"));
    }
}

for (var i = 0; i < ds_list_size(obj_partymanager.partyMembers); i++) {
    if (obj_partymanager.partyMembers[| i] != "Pig")
        scene_add_character_you(character_get(obj_partymanager.partyMembers[| i]));
}

