atirando = function()
{
	som_efeito(sfx_laser2, .1);
	//criando tiro
	var _tiro = instance_create_layer(x, y, "Inimigo", obj_tiro_inimigo);
	_tiro.vspeed = 4; //velocidade do tiro
}

//fazendo o inimigo explodir
morrendo = function()
{
	audio_stop_sound(sfx_explosion);
	//tocando som de explosão
	som_efeito(sfx_explosion, .1);
	
	//particula de explosão e destroi a instance
	sendo_destruido(obj_explosao_inimigo);	
	
	//chance do inimigo dropar um power up
	var _chance = random_range (0, 100);
	
	//10% de chance de drop
	if(_chance > 90)
	{
		instance_create_layer(x, y, layer, obj_pp_tiro2);
	}
}

//chechando se fui criado na sequencia
criado_em_sequencia = in_sequence;

//alarme do tiro
alarm[0] = game_get_speed(gamespeed_fps) * 2;