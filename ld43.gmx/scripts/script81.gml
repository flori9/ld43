///abilities_create_runar_angry()
var abilities = ds_list_create();
//ds_list_add_map(abilities, ability_create("Flying Pig", "Let a pig fly, and drop it on an enemy.", ability_choose_target, array(alignment_other, ability_do_fromstaff, ability_flyingpig, "Flying Pig", strategyHighestHP), requirement_set_pigs(requirement_create(), 1, 0), 1));
ds_list_add_map(abilities, ability_create("Protect and Charge", "Prevent one damage for each team member this round. Gain one mana.", ability_pay_mana_noTarget, array(-1, ability_do_fromstaff_noTarget, ability_protect), requirement_create(), 0));
return abilities;
