///character_heal(target, hp)
var doHealOn = argument0, dmgAmount = argument1;
doHealOn[? "prevHP"] = doHealOn[? "hp"];

dmgAmount = clamp(dmgAmount, 0, doHealOn[? "maxHP"] - doHealOn[? "hp"]);
doHealOn[? "hp"] += dmgAmount;

doHealOn[? "hpAnim"] = 1;

return array(dmgAmount);
