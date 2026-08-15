
//parando todos os sons
audio_stop_all();
//iniciando a musica do jogo
audio_play_sound(snd_musica, 0, 1);
 
 #region variaveis
 
	// velocidade do player
	vel			= 2;
	
	//vidas
	vidas		= 3;
	
	//escudos
	escudos		= 3;
	
	//tempo de espera do tiro
	espera_tiro	= 10;
	//timer do tiro
	timer_tiro	= 0;
	
	//level do meu tiro
	level_tiro	= 1;
	
	//variavel do escudo
	meu_escudo = noone;
	
	//invencibilidade
	tempo_invencivel = game_get_speed(gamespeed_fps);
	timer_invencivel = 10;
	
	//checando se tomei dano
	inicia_efeito_branco();
	
	////pegando a escala do personagem
	//escalax = 1;
	//escalay = 1;
	
	inicia_efeito_mola();
	
 #endregion
 
 #region funções
//sistema de movimentação do jogador
//função com os controles do player
controla_player = function()
{
	//iniciando timer de invencibilidade
	timer_invencivel--;
	
	//pegando as teclas
	var _cima, _baixo, _esquer, _dir, _atira;
	
	//w vai pra cima
	_cima	= keyboard_check(ord("W")) or keyboard_check(vk_up); // vk = virtual keyboard ou teclado virtual
	
	//s vai pra baixo
	_baixo	= keyboard_check(ord("S")) or keyboard_check(vk_down);
	
	//A vai pra esquerda
	_esquer = keyboard_check(ord("A")) or keyboard_check(vk_left);
	
	//D vai pra direita
	_dir	= keyboard_check(ord("D")) or keyboard_check(vk_right);
	
	//barra de espaço atira
	_atira	= keyboard_check(vk_space) or mouse_check_button(mb_left); //mb = mouse buttom ou botão do mouse
	
	//movimentação horizontal:
	//se dir = 1 e esquer = 0, 1 - 0 = 1, o player se mover para a esquerda
	//e a logica se repete para as diferentes combinações
	// 1 - 0 = 1 * vel = 2
	// 0 - 1 = -1 * vel = -2
	// 0 - 0 = 0 * vel = 0
	// 1 - 1 = 0 * vel = 0
	var _velh = (_dir - _esquer) * vel; //multiplica o resultado pela variavel
	x += _velh;
	
	//movimentação vertical
	var _velv = (_baixo - _cima) * vel;
	y += _velv;
	
	/*
	//limitando a posição horizontal do player
	if(x <= sprite_width / 2) x = sprite_width / 2;
	if(x >= room_width - sprite_width / 2)
	{
		x = room_width - sprite_width / 2;
	}
	
	//limitando a posição vertical do player
	y = clamp(y, 19, room_height - 19);
	
	//monitorando os botoes
	//show_debug_message(_cima);
	*/
	
	//limitando a posição do player (usando clamp):
	// limitando a posição horizontal
	x = clamp(x, sprite_width / 2, room_width - sprite_width / 2);
	//limitando posição vertical
	y = clamp(y, sprite_height / 2, room_height - sprite_height / 2);
	
	//mudando o level do tiro
	muda_tiro();
	
	//contando o tempo do tiro
	timer_tiro--;
	
	//criando o tiro
	if(_atira and timer_tiro <= 0)
	{
		audio_stop_sound(sfx_laser1);
		//tocando som do tiro
		som_efeito(sfx_laser1, .2)
		//alterando a escala do player quando ele atirar
		destorce_mola(0.8, 1.2);
		
		if(level_tiro = 1) tiro_1();
		if(level_tiro = 2) tiro_2();
		if(level_tiro = 3) tiro_3();
		
		//quando ele atirar o timer reinicia
		timer_tiro = espera_tiro;
		
	}
	
	//usando escudo
	if(keyboard_check_pressed(ord("E")))
	{
		usa_escudo();	
	}
	
	com_escudo()
	
	
}

//mudando level do tiro (metodo)
muda_tiro = function()
{
	//aumenta o level do tiro
	var _cima = keyboard_check_pressed(ord("O"));
	if(_cima)level_tiro++;
	
	//diminui o level do tiro
	var _baixo = keyboard_check_pressed(ord("L"));
	if(_baixo)level_tiro--;
}

//criando metodo do tiro 1

tiro_1 = function()
{
	var _tiro = instance_create_layer(x, y, "Tiro", obj_tiro);
	_tiro.vspeed = -10;
}

//criando metodo do tiro 2
tiro_2 = function()
{	
	var _tiro = instance_create_layer(x - 10, y, "Tiro", obj_tiro);
	_tiro.vspeed = -10;
	
	_tiro = instance_create_layer(x + 10, y, "Tiro", obj_tiro);
	_tiro.vspeed = -10;
}

//metodo do tiro 3
tiro_3 = function()
{	
	tiro_1();
	tiro_2();
}

//fazendo o player ganhar level
muda_level = function()
{
		if(level_tiro < 3)
	
		level_tiro++;
	}

desenha_icone = function(_icone, _qtd, _gui_height)
{

	//definindo a posição horizontal da vida
	var _x_vida = 20;
	
	//fazendo a sprite se repetir com base na variavel vida
	repeat(_qtd)
	{
		//desenhando icone de vida
		draw_sprite_ext(_icone, 0, _x_vida, _gui_height, 1, 1, 0, c_white, 0.5);
	
		//separando as vidas horizontalmente
		_x_vida += 30;
	}
}

perde_vida = function()
{
	//se estiver invencivel, nao perder vida
	if(timer_invencivel > 0) return;
	
		if(vidas > 0) //se tiver mais que zero vidas
		{
			//perde vida
			vidas--;	
			
			//inicia o timer de invencivel
			timer_invencivel = tempo_invencivel;
			
			//definindo quanto tempo o personagem fica branco ao tomar dano
			tempo_efeito_branco(3);
			
			//tremendo a tela
			screenshake(20);
			
			//efeito mola
			destorce_mola(2, 0.5);
		}

		else
		{
			instance_destroy();	
			instance_create_layer(x, y, "Particulas", obj_explosao_player);
			screenshake(50);
			layer_sequence_create("sq_transicao", x, y, sq_transicao1);
			global.transicao = true;
		}
}

//criando instancia do escudo e armazenando em variavel
usa_escudo = function()
{
	if(escudos > 0 and meu_escudo = noone)
	{
		//tocando com do escudo sendo criado
		som_efeito(sfx_shieldUp, .1);
		
		//diminuindo a quantidade de escudos
		escudos--;
		
		//criando escudo
		meu_escudo = instance_create_layer(x, y, "Escudos", obj_escudo);
	}
}

com_escudo = function()
{
		//se a instancia do escudo existir
	if(instance_exists(meu_escudo))
	{
		//ela segue o player
		meu_escudo.x = x;
		meu_escudo.y = y;
	
		//tempo invencivel
		timer_invencivel = 10;
	}

	else
	{
		meu_escudo = noone;	
	}	
}

layer_sequence_create("sq_transicao", x, y, sq_transicao2);
global.destino = rm_inicio;

#endregion