///abilities_create_pigfarmer()
var abilities = ds_list_create();
ds_list_add_map(abilities, ability_create("Magic Bolt", "A weak spell that does one damage.", ability_choose_target, array(alignment_other, ability_do_fromstaff, ability_magicbolt, "Magic Bolt", strategyLowestHP), requirement_create(), 1));
return abilities;
