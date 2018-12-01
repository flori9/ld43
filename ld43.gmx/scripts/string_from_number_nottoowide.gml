///string_from_number_nottoowide(num)
if (argument0 >= 1000000)
    return string_from_number_onedigitafterdot(argument0 / 1000000, true) + "m";
if (argument0 >= 10000)
    return string(argument0 div 1000) + "k";
if (argument0 >= 1000)
    return string_from_number_onedigitafterdot(argument0 / 1000, true) + "k";
return string(floor(argument0));

