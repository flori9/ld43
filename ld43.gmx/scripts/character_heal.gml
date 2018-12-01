///character_heal(target, hp)
var doHealOn = argument0, dmgAmount = argument1;
dmgAmount = clamp(dmgAmount, 0, doHealOn[? "maxHP"] - doHealOn[? "hp"]);
doHealOn[? "hp"] += dmgAmount;

doHealOn[? "hpAnim"] = 1;
doHealOn[? "previousHP"] = doHealOn[? "hp"] - dmgAmount;

return array(dmgAmount);
