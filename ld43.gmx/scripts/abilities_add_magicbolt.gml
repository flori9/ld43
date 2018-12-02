///abilities_add_magicbolt()
ds_list_add_map(argument0, ability_create("Magic Bolt", "A weak spell that does one damage.", ability_choose_target, array(alignment_other, ability_do_fromstaff, ability_magicbolt, "Magic Bolt", strategyLowestHP), requirement_create(), 1));
