///character_get(name)
switch (argument0)
{
    case "Inugor":
        return character_create_ext(spr_mage2, 0, 19, 11,
            "Inugor", ", the Dark", spr_mage2_icon,
            7, abilities_create_inugor(), "he", 12, 16);
        break;
    case "Povatrix":
        var povatrix = character_create_ext(spr_mage5, 0, 19, 11,
            "Povatrix", ", the Pigcaller", spr_mage5_icon,
            6, abilities_create_povatrix(), "he", 12, 16);
        povatrix[? "mana"] = 0;
        povatrix[? "maxMana"] = 2;
        return povatrix;
        break;
    case "Ezobur":
        return character_create_ext(spr_mage3, 0, 19, 11,
            "Ezobur", ", the Levitator", spr_mage3_icon,
            5, abilities_create_ezobur(), "he", 12, 16);
        break;
    case "Runar":
        var runar = character_create_ext(spr_mage0, 0, 19, 11,
            "Runar", ", the Wise", spr_mage0_icon,
            9, abilities_create_runar(), "he", 12, 16);
        runar[? "mana"] = 0;
        runar[? "maxMana"] = 3;
        return runar;
        break;
    case "Tom":
        return character_create_ext(spr_mage1, 0, 20, 10,
            "Tom", ", the Stupid", spr_mage1_icon,
            7, ds_list_create(), "he", 12, 16);
        break;
    case "Greatbeard":
       // abilities_create_greatbeard
       var greatbeard = character_create_ext(spr_mage4, 0, 20, 10,
            "Greatbeard", ", the Green", spr_mage4_icon,
            8, abilities_create_greatbeard(), "he", 12, 16);
        greatbeard[? "mana"] = 3;
        greatbeard[? "maxMana"] = 3;
        return greatbeard;
        break;
    case "Farmer":
        return character_create_ext(spr_farmer, 0, 20, 8,
            "Paulo", ", the Pig Farmer Wizard", spr_farmer_icon,
            5, abilities_create_pigfarmer(), "he", 12, 15);
        break;
        
    case "Pig":
    case "pig":
        return character_create(spr_pig, 0, "pig", 3, "the pig", 8, 16);
    case "Rat":
    case "rat":
        var theStupidRat =  character_create_ext(spr_rat, 0, 20, 10,
            "the rat", "", spr_rat_icon,
            2, ds_list_create(), "it", 10, 16);
        theStupidRat[? "waitText"] = "The rat squeaked.";
        return theStupidRat;
}
