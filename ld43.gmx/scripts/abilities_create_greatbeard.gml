///abilities_create_greatbeard()
var abilities = ds_list_create();
ds_list_add_map(abilities, ability_create("Heal", "Heal a single person (or pig).", ability_choose_target, array(alignment_you, ability_do_fromstaff, ability_normalheal, "Heal", strategySelf), requirement_create(), aiPrioHeal));
ds_list_add_map(abilities, ability_create("Pig Blood Healing", "Heal the whole party.", ability_do_fromstaff_noTarget, ability_pigbloodheal, requirement_set_pigs(requirement_create(), 1, 0), aiPrioHealParty));
return abilities;
