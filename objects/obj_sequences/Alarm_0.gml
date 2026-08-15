//criando sequencia armazenada na array "ondas"
layer_sequence_create("sq_inimigo", 0, 0, ondas[atual]);

//só aumento o valor da da onda atual se não chegou no final da array
if(atual < array_length(ondas) - 1)
{
	//aumentando o valor do indice
	atual++;

	//reiniciando o alarme
	alarm[0] = 400;
}