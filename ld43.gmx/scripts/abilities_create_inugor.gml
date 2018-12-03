///abilities_create_inugor()
var abilities = ds_list_create();
//ds_list_add_map(abilities, ability_create("Flying Pig", "Let a pig fly, and drop it on an enemy.", ability_choose_target, array(alignment_other, ability_do_fromstaff, ability_flyingpig, "Flying Pig", strategyHighestHP), requirement_set_pigs(requirement_create(), 1, 0), 1));
//ds_list_add_map(abilities, ability_create("Pigsteal", "Steal a pig from the enemy.", ability_do_fromstaff_noTarget, ability_pigsteal, requirement_set_pigs(requirement_create(), 0, 1), 0));
//ds_list_add_map(abilities, ability_create("Pig Blood Healing", "Heal the whole team.",
//    ability_do_fromstaff_noTarget, ability_pigbloodheal, requirement_set_pigs(requirement_create(), 1, 0), -1));

abilities_add_magicbolt(abilities);
ds_list_add_map(abilities, ability_create("Pig Surge", "Uses pig magic to do " + string(obj_partymanager.pigSurgeDamage) + " damage to an enemy.", ability_choose_target, array(alignment_other, ability_do_fromstaff, ability_pigsurge, "Pig Surge", strategyHighestHP), requirement_set_pigs(requirement_create(), 1, 0), 10));
ds_list_add_map(abilities, ability_create("Minor Blood Bolt", "Does two damage at the cost of some blood.", ability_choose_target, array(alignment_other, ability_pay_hp, array(1, ability_do_fromstaff, ability_smallbloodbolt), "Minor Blood Bolt", strategyHighestHP), requirement_set_hp(requirement_create(), 2), 5));

//ds_list_add_map(abilities, ability_create("Heal", "Heal a single person (or pig).", ability_choose_target, array(alignment_you, ability_do_fromstaff, ability_normalheal, "Heal", strategySelf), requirement_create(), aiPrioHeal));

return abilities;
