draw_self();

//efeito de brilho
gpu_set_blendmode(bm_add);

//adicionando efeitos a particula de explosão
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * 1.3, image_yscale * 1.3, image_angle, c_fuchsia, .3);

//resetando efeito de brilho
gpu_set_blendmode(bm_normal);