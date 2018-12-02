///abilities_create_greatbeard()
var abilities = ds_list_create();
ds_list_add_map(abilities, ability_create("Minor Heal", "Heal a single person (or pig).", ability_choose_target, array(alignment_you, ability_pay_mana, array(1, ability_do_fromstaff, ability_normalheal), "Minor Heal", strategySelf), requirement_set_mana(requirement_create(), 1), aiPrioHeal));
ds_list_add_map(abilities, ability_create("Pig Blood Healing", "Heal the whole party.", ability_pay_mana_noTarget, array(1, ability_do_fromstaff_noTarget, ability_pigbloodheal), requirement_set_mana(requirement_set_pigs(requirement_create(), 1, 0), 1), aiPrioHealParty));
return abilities;
