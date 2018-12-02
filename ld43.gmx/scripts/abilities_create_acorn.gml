///abilities_create_acorn()
var abilities = ds_list_create();
abilities_add_magicbolt(abilities);
//ds_list_add_map(abilities, ability_create("Minor Heal", "Heal a single person (or pig) for 2 damage.", ability_choose_target, array(alignment_you, ability_pay_mana, array(1, ability_do_fromstaff, ability_normalheal), "Minor Heal", strategySelf), requirement_set_mana(requirement_create(), 1), aiPrioHeal));
ds_list_add_map(abilities, ability_create("Pig Poison", "Make poison from a pig. This then does one damage per turn.", ability_choose_target, array(alignment_other, ability_do_fromstaff, ability_pigpoison, "Pig Poison", strategyHighestHP), requirement_set_pigs(requirement_create(), 1, 0), 5));

//ds_list_add_map(abilities, ability_create("Protect and Charge", "Prevent one damage for each team member this round. Gain one mana.", ability_pay_mana_noTarget, array(-1, ability_do_fromstaff_noTarget, ability_protect), requirement_create(), 2));
//ds_list_add_map(abilities, ability_create("Magic Anger", "When angry, Runar can use powerful damage spells.", ability_pay_mana_noTarget, array(3, ability_do_fromstaff_noTarget, ability_transform_angry), requirement_set_mana(requirement_create(), 3), 10));

return abilities;
