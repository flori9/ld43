///character_remove_mana(target, mana)
var doDmgOn = argument0, dmgAmount = argument1;
dmgAmount = clamp(dmgAmount, -doDmgOn[? "maxMana"], doDmgOn[? "mana"]); //defences etc.
doDmgOn[? "mana"] -= dmgAmount;

doDmgOn[? "manaAnim"] = 1;
doDmgOn[? "prevMana"] = doDmgOn[? "mana"] + dmgAmount;

return dmgAmount;
