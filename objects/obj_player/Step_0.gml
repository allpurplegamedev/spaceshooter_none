//ativando a função de controle
controla_player();

//ativa e desativa o debug
if(keyboard_check_released(vk_tab)) 
{
	global.debug = !global.debug;
}

//sempre que eu apertar enter ele perder 1 de vida
if(keyboard_check_pressed(vk_enter)) 
{
	perde_vida();
}

//voltando ao tamanho inicial da sprite
solta_mola(.1);

//fazendo o player voltar da cor inicial depois de tomar dano
timer_efeito_branco();



