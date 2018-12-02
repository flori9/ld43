///message_create_simple(text, continueScript, continueArg, headerInfo)
var msg = instance_create(0, 0, obj_message);
msg.messageText = argument0;
msg.continueScript = argument1;
msg.continueScriptArg = argument2;
msg.headerInfo = argument3;
return msg;
