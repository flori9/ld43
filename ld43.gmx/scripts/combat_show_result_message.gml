///combat_show_result_message(msg, characterForHeader)
var msg = instance_create(0, 0, obj_message);
msg.messageText = argument0;
msg.continueScript = combat_continue_witharg;
msg.headerInfo = argument1;
