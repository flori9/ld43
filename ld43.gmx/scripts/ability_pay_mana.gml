///ability_pay_mana([mana; thenCall, withArg], fromCharacter, onCharacter)
var args = argument0;

character_remove_mana(argument1, args[0]);
script_execute(args[1], args[2], argument1, argument2);
