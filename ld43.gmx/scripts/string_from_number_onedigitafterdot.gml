///string_from_number_onedigitafterdot(num, showDotZero)
var str = string_format(argument0, -1, 2);
var replaceDotZeroBy = "";
if (argument1)
    replaceDotZeroBy = ".0";
return string_replace_all(string_replace_all(string_delete(str, string_length(str), 1), ".0", replaceDotZeroBy), " ", "");

