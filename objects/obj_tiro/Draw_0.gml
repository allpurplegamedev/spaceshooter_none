//se desenhando
draw_self();



//efeito de brilho do tiro:


//mudar a forma como o computador processa as cores
gpu_set_blendmode(bm_add);

//desenhando um segundo tiro por cima dele
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * 1.5, image_yscale * 1.5, image_angle, cor, 0.5);

//resetando a forma como o computador processa as cores
gpu_set_blendmode(bm_normal);

