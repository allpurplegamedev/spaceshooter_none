//se desenhando
desenha_efeito_branco(desenha_efeito_mola);

//debub
if(global.debug)
{
	draw_text(x, y, vida);	
	draw_text(x, y - 20, estado);
	draw_text(x + 20, y - 40, contador);
}
