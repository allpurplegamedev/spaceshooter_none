//destroi o tiro quando sair da room
if(y <= -40)
{
	instance_destroy();	
	show_debug_message("morri");
}

image_xscale = lerp(image_xscale, 1, 0.1);
image_yscale = lerp(image_yscale, 1, 0.1);

vspeed = lerp(vspeed, -10, .1);