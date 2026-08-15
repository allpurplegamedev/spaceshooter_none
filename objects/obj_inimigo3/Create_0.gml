//definindo a vida do inimigo
vida = 10;

//variavel que controla os estado
estado = "chegando";

//timer de carregando
tempo_carregando = game_get_speed(gamespeed_fps) * 3;
timer_carregando = 0;

//escolhendo a direção que vai fugir
escolhe_dir = false;
 
//contador
contador = 0;

inicia_efeito_mola();
inicia_efeito_branco();

//state machine
maquina_de_estados = function()
{
	//switch (variavel que estou checando o valor)
	switch(estado)
	{
		//Casos + estado de "chegando"
		case "chegando":
		{
			if(y < 160)
			{
				vspeed = 1.2;	
			}
			else
			{
				//mudando o estado quando chegar no local y = 160
				estado = "carregando"
			}
			
		}
		//finalizando o case
		break;
		
		//caso carregando
		case "carregando":
		{
			//eu vou parar
			vspeed = 0;
			
			//timer para carregar
			timer_carregando++;
			
			if(timer_carregando >= tempo_carregando)
			{
				estado = choose("atirando", "atirando2");
				
				//reiniciando timer
				timer_carregando = 0;
				
				contador++;
			}
				
		}
		//finalizando estado de carregando
		break;
		
		case "atirando":
		{
			//pegando a direção do player
			if(instance_exists(obj_player))
			{
				som_efeito(sfx_laser2, .1);
				//fazendo o tiro seguir o player
				var _direcao = point_direction(x, y, obj_player.x, obj_player.y);
			
				//criando tiro
				var _tiro = instance_create_layer(x, y, "Tiro", obj_tiro_inimigo3);
				_tiro.speed = 2;
				_tiro.direction = _direcao;
				_tiro.image_angle = _direcao + 90;
			}
			
			if(contador < 4)
			{
				//voltando para o estado carregando
				estado = "carregando";
			}
			else
			{
				estado = "fugir";	
			}
		}
		break;
		
		case "atirando2":
		{
			som_efeito(sfx_laser2, .1);
			//angulo inicial do tiro
			var _ang = 225;
			
			//repetir a criação do tiro 3x
			repeat(3)
			{
				//criando tiro 2
				var _tiro2 = instance_create_layer(x, y, "Tiro", obj_tiro_inimigo3b);
				_tiro2.vspeed = 2;
				_tiro2.direction = _ang;
				
				//cada vez o angulo aumenta em 45
				_ang += 45;
			}
			
			//se o contador ainda nao chegou em 4 ele volta a carregar
			if(contador < 4)
			{
				//voltando para o estado carregando
				estado = "carregando";
			}
			//se não, ele foge
			else
			{
				estado = "fugir";	
			}

				
		}
		break;
		
		case "fugir":
		{
			if(escolhe_dir == false)
			{
				vspeed = -1;
				hspeed = choose(2, -2); 
				escolhe_dir = true;
			}
			
			if(estado = "fugir" and y <= -32)
			{
				instance_destroy();
			}
				
		}
	}
		
}

//fazendo o inimigo morrer
morrendo = function()
{
	destorce_mola(1.3, 0.8);
	tempo_efeito_branco(3);
	
	if(vida > 1)//se o inimigo ainda tiver vida
	{
		vida--;	
		screenshake(5);
	}
	else//se nao
	{
		som_efeito(sfx_explosion, .1)	
		//cria a explosão
		sendo_destruido(obj_explosao_inimigo);
	}
}