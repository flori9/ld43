///arena_init()
//scene_init_ownparty();

var arg = argument0;

var thisSub = 0;
var sub = obj_arena.currentSub;

if (thisSub == sub) {
    arena_scene_show_all(true);

    message_create_simple("Welcome to the Great Magic Tournament! Each year, we invite six young mages to show off their skills. And each year, we choose a different battlefield.", arena_init, -1, -1)
}
thisSub++;

if (thisSub == sub) {
    message_create_simple("This year, I'm happy to welcome you to this beautiful farm. I asked you to prepare pig-related spells. I hope you did, because there will be plenty of pigs around. In fact, you'll get three pigs to use each battle.", arena_init, -1, -1)
}
thisSub++;

if (thisSub == sub) {
    message_create_simple("Don't worry too much about any wounds, as we have great healers who will patch you up after each battle.", arena_init, -1, -1)
}
thisSub++;

if (thisSub == sub) {
    with (message_create_simple("Let's start with the traditional battle against the farmer. Who are you, anyway?", arena_init, -1, -1)) {
        arena_init_charchoice(arena_choose_first_fighter);
    }
}
thisSub++;

obj_arena.currentSub += 1;
