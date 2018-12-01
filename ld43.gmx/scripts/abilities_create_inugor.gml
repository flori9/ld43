///abilities_create_inugor()
var abilities = ds_list_create();
ds_list_add_map(abilities, ability_create("Flying Pig", "Let a pig fly, and drop it on an enemy.", ability_choose_target, array(alignment_other, ability_do_fromstaff, ability_flyingpig, "Flying Pig")));
ds_list_add_map(abilities, ability_create("Pigsteal", "Steal a pig from the enemy.", ability_do_fromstaff_noTarget, ability_pigsteal));
return abilities;
