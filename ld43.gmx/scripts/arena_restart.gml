///arena_restart(arg)
var arg = argument0;
with (obj_arena) instance_destroy();
with (obj_partymanager) instance_destroy();
with (obj_scene) instance_destroy();
with (obj_combat) instance_destroy();

instance_create(0, 0, obj_partymanager);
instance_create(0, 0, obj_arena);

