//array com opções do menu
menu = ["Jogar", "Tutorial", "Sair"];

atual = 0;

margem = 40;

controla_menu = function()
{
	//controlando o menu
	if(keyboard_check_pressed(vk_down))
	{
		atual++;
		som_efeito(sfx_zap, .1);
		margem = 0;
	}
	if(keyboard_check_pressed(vk_up))
	{
		atual--;
		som_efeito(sfx_zap, .1);
		margem = 0;
	}

	//clamp define o valor minimo e o valor maximo da variavel "atual"
	//a função array_lenght conta quantas opções existem dentro da array
	atual = clamp(atual, 0, array_length(menu) - 1);

	margem = lerp(margem, 40, .1);
	
	//ativando o menu
	if(keyboard_check_pressed(vk_enter))
	{
		ativa_menu();
	}
}

ativa_menu = function()
{
	switch(atual)	
	{
		//jogar
		case 0:
			//criando transicao 
			layer_sequence_create("sq_transicao", 144, 256, sq_transicao1);
			global.destino = rm_jogo;
			global.transicao = true;
		break;
		
		//tutorial
		case 1:
			//criando transicao 
			layer_sequence_create("sq_transicao", 144, 256, sq_transicao1);
			global.destino = rm_tutorial;
			global.transicao = true;
		break;
		
		//sair
		case 2:
			//saindo do jogo
			game_end();
		break;
	}
}

desenha_menu = function()
{
	//definindo a fonte
	draw_set_font(font_menu);

	//definindo altura do texto
	var _alt = string_height("I");

	//pegando o a altura da tela /2
	var _meio_tela = display_get_gui_height() / 3;

	//alinhando texto verticalmente
	draw_set_valign(1);

	//laço de repetição
	for(var i = 0; i < array_length(menu); i++)
	{
		//escolhendo a cor da fonte
		var _cor = c_white;
	
		//o atual tem margem
		var _marg = 0;
	
		if(i == atual)
		{
			_cor = c_red
		
			_marg = margem;
		}
	
		draw_set_colour(_cor);
		draw_text(20 + _marg, _meio_tela + i * _alt * 1.2, menu[i]);
	}

	//resetando alinhamento e fonte
	draw_set_valign(0);
	draw_set_font(0);

}
