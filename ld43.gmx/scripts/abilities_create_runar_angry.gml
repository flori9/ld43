///abilities_create_runar_angry()
var abilities = ds_list_create();
//ds_list_add_map(abilities, ability_create("Flying Pig", "Let a pig fly, and drop it on an enemy.", ability_choose_target, array(alignment_other, ability_do_fromstaff, ability_flyingpig, "Flying Pig", strategyHighestHP), requirement_set_pigs(requirement_create(), 1, 0), 1));
//ds_list_add_map(abilities, ability_create("Protect and Charge", "Prevent one damage for each team member this round. Gain one mana.", ability_pay_mana_noTarget, array(-1, ability_do_fromstaff_noTarget, ability_protect), requirement_create(), 0));
ds_list_add_map(abilities, ability_create("Greater Bolt", "A standard spell that does two damage.", ability_choose_target, array(alignment_other, ability_do_fromstaff, ability_greaterbolt, "Greater Bolt", strategyLowestHP), requirement_create(), 1));
ds_list_add_map(abilities, ability_create("Flying Pig", "Let a pig fly, and drop it on an enemy, doing 4 damage.", ability_choose_target, array(alignment_other, ability_do_fromstaff, ability_flyingpig, "Flying Pig", strategyHighestHP), requirement_set_pigs(requirement_create(), 1, 0), 2));
ds_list_add_map(abilities, ability_create("Blood Bolt", "A powerful spell that does five damage at the cost of some blood.", ability_choose_target, array(alignment_other, ability_pay_hp, array(1, ability_do_fromstaff, ability_bloodbolt), "Blood Bolt", strategyHighestHP), requirement_set_hp(requirement_create(), 2), 3));

return abilities;
