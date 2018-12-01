///character_get(name)
switch (argument0)
{
    case "Inugor":
        return character_create_ext(spr_mage2, 0, 19, 11,
            "Inugor", ", a Young Dark Mage", spr_mage2_icon,
            10, abilities_create_inugor());
        break;
    case "Runar":
        return character_create_ext(spr_mage0, 0, 19, 11,
            "Runar", ", the Wise", spr_mage0_icon,
            10, ds_list_create());
        break;
    case "Tom":
        return character_create_ext(spr_mage1, 0, 20, 10,
            "Tom", ", the Stupid", spr_mage1_icon,
            10, ds_list_create());
        break;
    case "Farmer":
        return character_create_ext(spr_farmer, 0, 20, 8,
            "Paulo", ", the Pig Farmer", spr_farmer_icon,
            10, ds_list_create());
        break;
        
    case "Pig":
        return character_create(spr_pig, 0, "pig", 3);
}
