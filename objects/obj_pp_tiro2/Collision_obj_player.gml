//destruindo power up ao colidir
instance_destroy(id);

//criando particula de explosao
instance_create_layer(x, y, "Tiro", obj_tiro_explosao);

//ganhando level com o pp
other.muda_level();