///abilities_create_inugor()
var abilities = ds_list_create();
ds_list_add_map(abilities, ability_create("Flying Pig", "Let a pig fly, and drop it on an enemy.", ability_choose_target, array(alignment_other, ability_do_fromstaff, ability_flyingpig, "Flying Pig", strategyHighestHP), requirement_set_pigs(requirement_create(), 1, 0), 1));
ds_list_add_map(abilities, ability_create("Pigsteal", "Steal a pig from the enemy.", ability_do_fromstaff_noTarget, ability_pigsteal, requirement_set_pigs(requirement_create(), 0, 1), 0));
ds_list_add_map(abilities, ability_create("Pig Blood Healing", "Heal the whole party.",
    ability_do_fromstaff_noTarget, ability_pigbloodheal, requirement_set_pigs(requirement_create(), 1, 0), -1));
return abilities;
