//CHROMATIC ABBERATION SCTIPT 

#pragma header
//shader initializers

uniform int amount = 4; //the abberation offset parameter. uniform means it'll be set by the lua script

vec2 uv = openfl_TextureCoordv.xy;// the pixel coordinates. ranges from [0,1] rather than [0,size]
vec2 pixel = uv*openfl_TextureSize.xy; // the pixel coordinates. ranges from [0,size]
vec2 size = openfl_TextureSize;
void main(void){

	vec4 col; //making a new pixel data

	col.r = flixel_texture2D(bitmap,vec2(uv.x+amount/openfl_TextureSize.x,uv.y)).r; //shift red pixel to the left
	col.g = flixel_texture2D(bitmap,uv).g; // keep green pixel still
	col.b = flixel_texture2D(bitmap,vec2(uv.x-amount/openfl_TextureSize.x,uv.y)).b; //shift blue pixel to the left
	col.a = flixel_texture2D(bitmap,uv).a; // keep alpha pixel still

	gl_FragColor = col; // image pixel data as the new pixel data


}