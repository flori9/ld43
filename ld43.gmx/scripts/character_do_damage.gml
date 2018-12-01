///character_do_damage(target, damage)
var doDmgOn = argument0, dmgAmount = argument1;
dmgAmount = clamp(dmgAmount, 0, doDmgOn[? "hp"]); //defences etc.
doDmgOn[? "hp"] -= dmgAmount;
var defeated = false;
if (doDmgOn[? "hp"] <= 0) {
    scene_destroy_character(doDmgOn);
    defeated = true;
}

return array(dmgAmount, defeated);
