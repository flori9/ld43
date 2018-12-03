///arena_scene_show_all(showFarmer)
scene_clear();

scene_add_character_you(character_get("Inugor"));
scene_add_character_you(character_get("Povatrix"));
scene_add_character_you(character_get("Ezobur"));
scene_add_character_you(character_get("Runar"));
scene_add_character_you(character_get("Acorn"));
scene_add_character_you(character_get("Greatbeard"));

scene_add_character_other(character_get("Pig"));
if (argument0)
    scene_add_character_other(character_get("Farmer"));
