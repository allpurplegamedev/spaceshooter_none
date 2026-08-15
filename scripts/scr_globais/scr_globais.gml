global.debug = false;

global.destino = rm_jogo;

global.transicao = false;

#region funções

//função para destruir objetos e criar particulas
function sendo_destruido(_particula = obj_tiro_explosao)//escolhendo particula
{
	//destroi o objeto 
	instance_destroy();
	//cria uma particula armazenada na variavel
	instance_create_layer(x, y, "Particulas", _particula);
	
}

//função de screenshake
function screenshake(_treme = 20)
{
	//se o objeto de screenshake existir
	if(instance_exists(obj_screenshake))
	{
		with(obj_screenshake)
		{
			
			if(_treme > treme)
			{
				treme = _treme;	
			}
		}
	}
}


//efeito de mola
function inicia_efeito_mola()
{
	escalax = 1;
	escalay = 1;
}

//destorce o tamanho da sprite
function destorce_mola(_escalax = 0.8, _escalay = 1.3)
{
	escalax = _escalax;
	escalay = _escalay;
}

//faz a sprite voltar ao tamanho original
function solta_mola(_qtd = .1)
{
	escalax = lerp(escalax, 1, _qtd);
	escalay = lerp(escalay, 1, _qtd);
}

function desenha_efeito_mola()
{
	//desenhando o player
	draw_sprite_ext(sprite_index, image_index, x, y, escalax, escalay, image_angle, c_white, image_alpha);
}

//efeito branco ao tomar bando
function inicia_efeito_branco()
{
	tomei_dano = false;
}

function tempo_efeito_branco(_tempo = 3)
{
	tomei_dano = _tempo;	
}

function timer_efeito_branco()
{
	if(tomei_dano > 0) tomei_dano--;
}

function desenha_efeito_branco(_funcao_desenho = draw_self)
{
	if(tomei_dano > 0)
	{
		shader_set(sh_branco);
		_funcao_desenho();	
		shader_reset();
	}
	else
	{
		_funcao_desenho();
	}
}	

function som_efeito(_som = sfx_explosion, _variacao = .1)
{
	//variavel de variação do som
	var _pitch = random_range(1 - _variacao, 1 + _variacao);
	//tocando som de colisão com o tiro
	audio_play_sound(_som, 0, 0, , , _pitch);
}

function muda_room()
{
	room_goto(global.destino);	
	audio_stop_all();
}

function finaliza_transicao()
{
	global.transicao = false;
}

#endregion