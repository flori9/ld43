///abilities_create_runar()
var abilities = ds_list_create();
//ds_list_add_map(abilities, ability_create("Flying Pig", "Let a pig fly, and drop it on an enemy.", ability_choose_target, array(alignment_other, ability_do_fromstaff, ability_flyingpig, "Flying Pig", strategyHighestHP), requirement_set_pigs(requirement_create(), 1, 0), 1));
ds_list_add_map(abilities, ability_create("Protect and Charge", "Prevent one damage for each team member this round. Gain one mana.", ability_pay_mana_noTarget, array(-1, ability_do_fromstaff_noTarget, ability_protect), requirement_create(), 2));
ds_list_add_map(abilities, ability_create("Magic Anger", "When angry, Runar can use powerful damage spells.", ability_pay_mana_noTarget, array(3, ability_do_fromstaff_noTarget, ability_transform_angry), requirement_set_mana(requirement_create(), 3), 10));

return abilities;
