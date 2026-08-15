//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	//pegando como a sprite está sendo desenhada normalmente
	vec4 cor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	//fasendo a sprite ficar toda branca
	cor.rgb = vec3(1.0, 1.0, 1.0);
	
	//ele desenha minha sprite normalmente
    gl_FragColor = cor;
}
