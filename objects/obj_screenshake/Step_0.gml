//se treme for maior que 0.1
if(treme > 0.1)
{
	//a tela treme
	var _x = random_range(-treme, treme); //escolhe um valor aleatorio 
	var _y = random_range(-treme, treme);
	
	view_set_xport(view_current, _x); //faz a camera se mover da direção desse valor
	view_set_yport(view_current, _y);
}

else//se não
{
	//a camera fica parada
	treme = 0;
	
	view_set_xport(view_current, 0);
	view_set_yport(view_current, 0);
}

//retornando a camera para a posição inicial
treme = lerp(treme, 0, .1);