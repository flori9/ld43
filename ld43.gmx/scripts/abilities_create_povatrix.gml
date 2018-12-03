///abilities_create_povatrix()
var abilities = ds_list_create();
ds_list_add_map(abilities, ability_create("Charging Bolt", "Does one damage. Also gain one mana.", ability_choose_target, array(alignment_other, ability_pay_mana, array(-1, ability_do_fromstaff, ability_magicbolt), "Magic Bolt", strategyLowestHP), requirement_create(), 1));
ds_list_add_map(abilities, ability_create("Call Pig", "Call a pig. Also gain one mana.", ability_pay_mana_noTarget, array(-1, ability_do_fromstaff_noTarget, ability_callpig), requirement_add_space(requirement_create(), 1), 3));
ds_list_add_map(abilities, ability_create("Pig Bolt", "Does damage equal to the number of pigs you have.", ability_choose_target, array(alignment_other, ability_pay_mana, array(2, ability_do_fromstaff, ability_pigbolt), "Pig Bolt", strategyLowestHP), requirement_set_mana(requirement_create(), 2), 10));

//ds_list_add_map(abilities, ability_create("Pig Blood Healing", "Heal the whole party for up to 5 damage.", ability_pay_mana_noTarget, array(1, ability_do_fromstaff_noTarget, ability_pigbloodheal), requirement_set_mana(requirement_set_pigs(requirement_create(), 1, 0), 1), aiPrioHealParty));
return abilities;
