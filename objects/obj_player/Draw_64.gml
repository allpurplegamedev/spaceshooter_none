//mostra o debug na tela
if(global.debug)
{
	//desenhando debug dos tiros
	draw_text(20, 20, "Level do tiro: " + string(level_tiro));
}

if(global.transicao) exit;
//pegando o tamanho do display
var _gui_height = display_get_gui_height();
	
//desenhando escudos
desenha_icone(spr_gui_escudo, escudos, _gui_height - 20);

//desenhando vida
desenha_icone(spr_gui_vida, vidas, _gui_height - 60);


