morrendo = function()
{
	//destroi o tiro ao sair da room por baixo
	if(y > room_height)
	{
		instance_destroy();
	}

	////checando se o tiro colidiu com o player
	//bateu = place_meeting(x, y, obj_player);

	////criando particula ao colidir com player
	//if(bateu)
	//{
	//	instance_create_layer(x, y, "Inimigo", obj_tiro_explosao);
	//	instance_destroy();	
	//}

	//bateu_escudo = place_meeting(x, y, obj_escudo)

	//if(bateu_escudo)
	//{
	//	instance_destroy();	
	//}

}