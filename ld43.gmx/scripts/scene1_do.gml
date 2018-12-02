///scene1_do()
var arg = argument0;

var thisSub = 0;
var sub = obj_scene1.currentSub;

if (thisSub == sub) {
    message_create_simple("After years of battle, the good have almost won in this magic kingdom. The evil mages have been driven back to remote places and struggle to survive.", scene1_do, -1, -1);
}
thisSub++;

if (thisSub == sub) {
    message_create_simple("You're Inugor, a young evil mage, and you've been hidden in this dark cave for years now.", scene1_do, -1, -1);
}
thisSub++;

if (thisSub == sub) {
    message_create_simple("You have spent your time well, though, by experimenting on the pigs in the cave.", scene1_do, -1, -1);
}
thisSub++;

if (thisSub == sub) {
    message_create_simple("And, finally, this is paying off! You just discovered a spell that uses the magic essence of pigs to wound others. You think it might be very powerful, but you'll have to test it out first!", scene1_do, -1, -1);
}
thisSub++;

if (thisSub == sub) {
    with (message_create_simple("Rats are always a good test subject, of course, and there must be some giant ones around in this cave.", -1, -1, -1))
        message_button_add("Look for Rats", spr_mage2_icon, -1, scene1_do, -1, "", true);
}
thisSub++;

if (thisSub == sub) {
    scene_add_character_other(character_get("Rat"));
    message_create_simple("Ah, there's one! Let's try your pig magic on it!", scene1_do, -1, -1);
}
thisSub++;

if (thisSub == sub) {
    with (instance_create(0, 0, obj_combat)) {
        postBattleScript = scene1_do;
        postBattleWinText = "";
    }
}
thisSub++;

if (thisSub == sub) {
    with (message_create_simple("The spell seems to work very well! The number of pigs in the cave is limited, but you know there's a pig farm nearby. Let's steal some more pigs there!", -1, -1, -1))
        message_button_add("Walk to the Pig Farm", spr_mage2_icon, -1, scene1_do, -1, "", true);
}
thisSub++;

if (thisSub == sub) {
    room_goto(rm_pigfarm);
}
thisSub++;

obj_scene1.currentSub += 1;
