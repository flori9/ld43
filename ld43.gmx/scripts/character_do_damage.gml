///character_do_damage(target, damage)
var doDmgOn = argument0, dmgAmount = argument1;
dmgAmount = clamp(dmgAmount, 0, doDmgOn[? "hp"]); //defences etc.
doDmgOn[? "hp"] -= dmgAmount;
var defeated = false;
if (doDmgOn[? "hp"] <= 0) {
    scene_destroy_character(doDmgOn);
    defeated = true;
} else {
    doDmgOn[? "hpAnim"] = 1;
    doDmgOn[? "previousHP"] = doDmgOn[? "hp"] + dmgAmount;
}

return array(dmgAmount, defeated);
