//voltando para o inicio
layer_sequence_create("sq_transicao", room_width / 2, room_height / 2, sq_transicao1);
global.destino = rm_inicio;

global.transicao = true;

audio_stop_all();