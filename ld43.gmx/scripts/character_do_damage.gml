///character_do_damage(target, damage)
var doDmgOn = argument0, dmgAmount = argument1;
with (ability_protect_sub) {
    if (doDmgOn == protectTarget && !fadeout && dmgAmount >= 1) {
        dmgAmount -= 1;
        fadeout = true;
        fadein = false;
    }
}

dmgAmount = clamp(dmgAmount, 0, doDmgOn[? "hp"]); //defences etc.

doDmgOn[? "hp"] -= dmgAmount;
var defeated = false;
if (doDmgOn[? "hp"] <= 0) {
    scene_destroy_character(doDmgOn, true);
    defeated = true;
} else {
    doDmgOn[? "hpAnim"] = 1;
    doDmgOn[? "prevHP"] = doDmgOn[? "hp"] + dmgAmount;
}

return array(dmgAmount, defeated);
