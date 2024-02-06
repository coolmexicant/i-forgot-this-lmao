package shaders;

// STOLEN FROM HAXEFLIXEL DEMO LOL
import flixel.system.FlxAssets.FlxShader;

class SinWave
{
	public var shader(default, null):SinShader = new SinShader();
	// public var effectType(default, set):WiggleEffectType = DREAMY;
	// public var waveSpeed(default, set):Float = 0;
	// public var waveFrequency(default, set):Float = 0;
	// public var waveAmplitude(default, set):Float = 0;

	public function new():Void
	{
		shader.iTime.value = [0];
	}

	public function update(elapsed:Float):Void
	{
		shader.iTime.value[0] += elapsed;
	}

	public function setValue(value:Float):Void
	{
		shader.iTime.value[0] = value;
	}
}

class SinShader extends FlxShader
{
	@:glFragmentSource("
    // Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel
    // https://www.shadertoy.com/view/MsX3DN

    #pragma header
    
    #define round(a) floor(a + 0.5)
    #define iResolution vec3(openfl_TextureSize, 0.)
    uniform float // Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

    #pragma header
    
    #define round(a) floor(a + 0.5)
    #define iResolution vec3(openfl_TextureSize, 0.)
    uniform float iTime;
    #define iChannel0 bitmap
    uniform sampler2D iChannel1;
    uniform sampler2D iChannel2;
    uniform sampler2D iChannel3;
    #define texture flixel_texture2D
    
    // third argument fix
    vec4 flixel_texture2D(sampler2D bitmap, vec2 coord, float bias) {
        vec4 color = texture2D(bitmap, coord, bias);
        if (!hasTransform)
        {
            return color;
        }
        if (color.a == 0.0)
        {
            return vec4(0.0, 0.0, 0.0, 0.0);
        }
        if (!hasColorTransform)
        {
            return color * openfl_Alphav;
        }
        color = vec4(color.rgb / color.a, color.a);
        mat4 colorMultiplier = mat4(0);
        colorMultiplier[0][0] = openfl_ColorMultiplierv.x;
        colorMultiplier[1][1] = openfl_ColorMultiplierv.y;
        colorMultiplier[2][2] = openfl_ColorMultiplierv.z;
        colorMultiplier[3][3] = openfl_ColorMultiplierv.w;
        color = clamp(openfl_ColorOffsetv + (color * colorMultiplier), 0.0, 1.0);
        if (color.a > 0.0)
        {
            return vec4(color.rgb * color.a * openfl_Alphav, color.a * openfl_Alphav);
        }
        return vec4(0.0, 0.0, 0.0, 0.0);
    }
    
    // variables which is empty, they need just to avoid crashing shader
    uniform float iTimeDelta;
    uniform float iFrameRate;
    uniform int iFrame;
    #define iChannelTime float[4](iTime, 0., 0., 0.)
    #define iChannelResolution vec3[4](iResolution, vec3(0.), vec3(0.), vec3(0.))
    uniform vec4 iMouse;
    uniform vec4 iDate;
    
    void mainImage( out vec4 fragColor, in vec2 fragCoord )
    {
        // Get the UV Coordinate of your texture or Screen Texture, yo!
        vec2 uv = fragCoord.xy / iResolution.xy;
        
        // Modify that X coordinate by the sin of y to oscillate back and forth up in this.
        uv.y += cos(uv.x*10.0+iTime)/10.0;
        
        // The theory be that you turn this sucka into basically a graph 
        // (like on them TI-80 whatevers)
        // The sin of y says that y at 0 is the start of your sin wave
        // Then the bottom of your image is the end of one sin wave
        // (go ahead and delete them 10s and give her a try)
        // This will show 3 images waving back and forth like the JUST DON'T CARE
        // That's because ya'll is waving the x from -1 to 1 (-1, 0, 1)
        // So we need to get all amplitude and freqency on this bitch
        // That's where the 10s come in, and they could be any one of them numbers
        // the multply by 10 increases the frequency making the waves tight or loose as ... well ... you know...
        // the divide by 10 decreases that amplitude til it's wavy as FUCK
        // So play around with them shits.
        
        
        // Get the pixel color at the index.
        vec4 color = texture(iChannel0, uv);
        
        fragColor = color;
    }
    
    void main() {
        mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
    };
    #define iChannel0 bitmap
    uniform sampler2D iChannel1;
    uniform sampler2D iChannel2;
    uniform sampler2D iChannel3;
    #define texture flixel_texture2D
    
    // third argument fix
    vec4 flixel_texture2D(sampler2D bitmap, vec2 coord, float bias) {
        vec4 color = texture2D(bitmap, coord, bias);
        if (!hasTransform)
        {
            return color;
        }
        if (color.a == 0.0)
        {
            return vec4(0.0, 0.0, 0.0, 0.0);
        }
        if (!hasColorTransform)
        {
            return color * openfl_Alphav;
        }
        color = vec4(color.rgb / color.a, color.a);
        mat4 colorMultiplier = mat4(0);
        colorMultiplier[0][0] = openfl_ColorMultiplierv.x;
        colorMultiplier[1][1] = openfl_ColorMultiplierv.y;
        colorMultiplier[2][2] = openfl_ColorMultiplierv.z;
        colorMultiplier[3][3] = openfl_ColorMultiplierv.w;
        color = clamp(openfl_ColorOffsetv + (color * colorMultiplier), 0.0, 1.0);
        if (color.a > 0.0)
        {
            return vec4(color.rgb * color.a * openfl_Alphav, color.a * openfl_Alphav);
        }
        return vec4(0.0, 0.0, 0.0, 0.0);
    }
    
    // variables which is empty, they need just to avoid crashing shader
    uniform float iTimeDelta;
    uniform float iFrameRate;
    uniform int iFrame;
    #define iChannelTime float[4](iTime, 0., 0., 0.)
    #define iChannelResolution vec3[4](iResolution, vec3(0.), vec3(0.), vec3(0.))
    uniform vec4 iMouse;
    uniform vec4 iDate;
    
    void mainImage( out vec4 fragColor, in vec2 fragCoord )
    {
        // Get the UV Coordinate of your texture or Screen Texture, yo!
        vec2 uv = fragCoord.xy / iResolution.xy;
        
        // Modify that X coordinate by the sin of y to oscillate back and forth up in this.
        uv.y += cos(uv.x*10.0+iTime)/10.0;
        
        // The theory be that you turn this sucka into basically a graph 
        // (like on them TI-80 whatevers)
        // The sin of y says that y at 0 is the start of your sin wave
        // Then the bottom of your image is the end of one sin wave
        // (go ahead and delete them 10s and give her a try)
        // This will show 3 images waving back and forth like the JUST DON'T CARE
        // That's because ya'll is waving the x from -1 to 1 (-1, 0, 1)
        // So we need to get all amplitude and freqency on this bitch
        // That's where the 10s come in, and they could be any one of them numbers
        // the multply by 10 increases the frequency making the waves tight or loose as ... well ... you know...
        // the divide by 10 decreases that amplitude til it's wavy as FUCK
        // So play around with them shits.
        
        
        // Get the pixel color at the index.
        vec4 color = texture(iChannel0, uv);
        
        fragColor = color;
    }
    
    void main() {
        mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
    }")
	public function new()
	{
		super();
	}
}