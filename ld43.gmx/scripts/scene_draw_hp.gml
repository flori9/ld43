///scene_draw_hp(hpToDraw, maxHPToDraw, pos, anim, anim2, prevHP)
var hpToDraw = argument0, maxHPToDraw = argument1, i = argument2, anim = argument3, anim2 = argument4, prevHP = argument5;
var transformX = i * tileWidth + 1, transformY = groundY + 2;

if (anim < 1) {
    if (! surface_exists(miniSurf)) {
        miniSurf = surface_create(32, 32);
    }
    surface_set_target(miniSurf);
    draw_clear_alpha(c_black, 0);
    
    transformX = 0;
    transformY = 0;
}
draw_set_font(fnt_tinier);
draw_set_color(merge_color(make_color_rgb(56 * 2, 50 * 2, 44 * 2), make_color_rgb(56, 50, 44), smooth_step(anim2)));
draw_panel_sprite(transformX, transformY, tileWidth - 2, 11, spr_healthbar, 0);
draw_panel_sprite(transformX + 1, transformY, floor((tileWidth - 4) * (lerp(hpToDraw, prevHP, smooth_step(anim2)) / maxHPToDraw)), 11, spr_healthbar, 1);
draw_sprite(spr_heart, 0, transformX + 2, transformY + 2);

draw_set_halign(fa_right);
draw_text(transformX + tileWidth - 4, transformY + 2, string(floor(hpToDraw)));
draw_set_halign(fa_left);

if (anim < 1) {
    surface_reset_target();
    
    draw_set_alpha(anim);
    draw_surface(miniSurf, i * tileWidth + 1, groundY + 2/* + round((1 - anim) * 5)*/);
    draw_set_alpha(1);
}
