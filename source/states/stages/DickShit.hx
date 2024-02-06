package states.stages;

import objects.Character;
import objects.HealthIcon;
//import objects.Bar;
//import shaders.SinWave;

class DickShit extends BaseStage
{
	var sky:BGSprite;
	var castillo:BGSprite;
	var fireL:BGSprite;
	var fireR:BGSprite;
	var platform0:BGSprite;
	var starmanPOW:BGSprite;
	var platform1:BGSprite;
	var platform2:BGSprite;
	var floor:BGSprite;
	var girlfriend:Character;
	var hovFac:Float = 0;
	var horFac:Float = 0;
	var iconGF:HealthIcon;
	//var wave:SinWave;
	override function create()
	{
		sky = new BGSprite('SS_sky', -1100, -600, 0.1, 0.1);
		add(sky);
		castillo = new BGSprite('SS_castle', -1125, -600, 0.2, 0.2);
		add(castillo);
		fireL = new BGSprite('Starman_BG_Fire_Assets', -1400, -850, 0.4, 0.4, ['fire anim effects'], true);
		add(fireL);		
		fireR = new BGSprite('Starman_BG_Fire_Assets', 700, -850, 0.4, 0.4, ['fire anim effects'], true);
		fireR.flipX = true;
		add(fireR);
		platform0 = new BGSprite('SS_farplatforms', -950, -600, 0.55, 0.55);
		add(platform0);
		starmanPOW = new BGSprite('SS_POWblock', 835, 610, 0.55, 0.55);
		add(starmanPOW);
		platform1 = new BGSprite('SS_midplatforms', -850, -600, 0.65, 0.65);
		add(platform1);
		floor = new BGSprite('SS_floor', -750, -600);
		add(floor);
		platform2 = new BGSprite('SS_foreground', -1100, -600, 1.3, 1.3);
		add(platform2);
		girlfriend = new Character(1900, 425, 'gfexe', false);
		add(girlfriend);
		// wave = new SinWave();
		// game.camHUD.shader = wave.shader;
	}
	override function createPost() 
	{
		iconGF = new HealthIcon('johndick', false);
		game.uiGroup.add(iconGF);
	}
	override function beatHit() {
		if (girlfriend != null && curBeat % Math.round(PlayState.gfSpeed * girlfriend.danceEveryNumBeats) == 0 && !girlfriend.getAnimationName().startsWith('sing') && !girlfriend.stunned)
			girlfriend.dance();
		iconGF.scale.set(2, 1);
		iconGF.updateHitbox();
	}
	override function update(elapsed:Float) {
		if(curStep >= 2 && curStep < 200){
			for(i in 0...PlayState.strumLineNotes.members.length){
				var curPos:Float = (Conductor.songPosition/1000)*(Conductor.bpm / 60);
				PlayState.strumLineNotes.members[i].y += FlxMath.fastSin(curPos + i * 0.25); //Kade Engine Wave
				//Lib.
			}
		}
		iconGF.x = game.iconP2.x - 70;
		iconGF.y = ClientPrefs.data.downScroll ? game.iconP2.y - (-15) : game.iconP2.y - 35;
		var mult:Float = FlxMath.lerp(1, iconGF.scale.x, Math.exp(-elapsed * 9 * game.playbackRate));
		iconGF.scale.set(mult, 1);
		iconGF.updateHitbox();
	}
}