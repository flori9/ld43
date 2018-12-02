///character_get(name)
switch (argument0)
{
    case "Inugor":
        return character_create_ext(spr_mage2, 0, 19, 11,
            "Inugor", ", a Young Dark Mage", spr_mage2_icon,
            7, abilities_create_inugor(), "he", 12, 16);
        break;
    case "Runar":
        return character_create_ext(spr_mage0, 0, 19, 11,
            "Runar", ", the Wise", spr_mage0_icon,
            9, abilities_create_runar(), "he", 12, 16);
        break;
    case "Tom":
        return character_create_ext(spr_mage1, 0, 20, 10,
            "Tom", ", the Stupid", spr_mage1_icon,
            7, ds_list_create(), "he", 12, 16);
        break;
    case "Farmer":
        return character_create_ext(spr_farmer, 0, 20, 8,
            "Paulo", ", the Pig Farmer", spr_farmer_icon,
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
