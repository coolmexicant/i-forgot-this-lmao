package states.stages;

import openfl.filters.ShaderFilter;
import shaders.WiggleEffect;

class Slut extends BaseStage
{
	var whittyBG:BGSprite;
	var clocks:BGSprite;
	var clockScar:BGSprite;
	var clockFever:BGSprite;
	var wiggleEffect:WiggleEffect;
	
	override function create()
	{
		whittyBG = new BGSprite('alleyway-night', -728, -230, 0.9, 0.9, 1.25, 1.25);
		add(whittyBG);

		// wiggleEffect = new WiggleEffect();
		// //wiggleEffect.shader.effectType.value = [4]; // non h-scriptphobic version
		// wiggleEffect.waveAmplitude = 0.02;
		// wiggleEffect.waveFrequency = 3;
		// wiggleEffect.waveSpeed = 0.71;
	}
}