package states;

import backend.WeekData;
import backend.Highscore;
import backend.Song;

import objects.HealthIcon;
//import objects.MusicPlayer;

import substates.GameplayChangersSubstate;
import substates.ResetScoreSubState;

import flixel.math.FlxMath;

class FreeplayState extends MusicBeatState 
{
	private static var curSelected:Int = 0;
	var curDifficulty:Int = -1;
	private static var lastDifficultyName:String = Difficulty.getDefault();
	var bg:FlxSprite;
	var tutorial:FlxSprite;
	var starman:FlxSprite;
	var thing:FlxSprite;
	var thing2:FlxSprite;
	var bar:FlxSprite;

	override function create(){
		persistentUpdate = true;
		PlayState.isStoryMode = false;
		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.antialiasing = ClientPrefs.data.antialiasing;
		add(bg);
		bg.screenCenter();

		tutorial = new FlxSprite(779,42).loadGraphic(Paths.image('freeplayMenu/Tutorial'));
		tutorial.antialiasing = ClientPrefs.data.antialiasing;
		add(tutorial);

		starman = new FlxSprite(0,51).loadGraphic(Paths.image('freeplayMenu/Starman Slaughter'));
		starman.antialiasing = ClientPrefs.data.antialiasing;
		add(starman);

		bar = new FlxSprite(0,696).makeGraphic(181, 24, FlxColor.BLACK);
		add(bar);

		super.create();
	}

	override function update(elapsed:Float) {
		// if (controls.UI_UP_P)
		// {
		// 	changeSelection(-shiftMult);
		// 	holdTime = 0;
		// }
		// if (controls.UI_DOWN_P)
		// {
		// 	changeSelection(shiftMult);
		// 	holdTime = 0;
		// }
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}
		if (FlxG.mouse.overlaps(starman) && FlxG.mouse.justPressed)
		{
			persistentUpdate = false;
			try
			{
				PlayState.SONG = Song.loadFromJson(Paths.formatToSongPath('starman-slaughter'),Paths.formatToSongPath('starman-slaughter'));
				PlayState.isStoryMode = false;
			}
			catch(e:Dynamic)
			{
				trace('ERROR! $e');
				var errorStr:String = e.toString();
				if(errorStr.startsWith('[file_contents,assets/data/')) errorStr = 'Missing file: ' + errorStr.substring(34, errorStr.length-1); //Missing chart
				FlxG.sound.play(Paths.sound('cancelMenu'));
				return;
			}
			LoadingState.loadAndSwitchState(new PlayState());
	
			FlxG.sound.music.volume = 0;
						
			#if (MODS_ALLOWED && DISCORD_ALLOWED)
				DiscordClient.loadModRPC();
			#end
		}
		if (FlxG.mouse.overlaps(tutorial) && FlxG.mouse.justPressed)
		{
			persistentUpdate = false;
			try
			{
				PlayState.SONG = Song.loadFromJson(Paths.formatToSongPath('tutorial'),Paths.formatToSongPath('tutorial'));
				PlayState.isStoryMode = false;
			}
			catch(e:Dynamic)
			{
				trace('ERROR! $e');
				var errorStr:String = e.toString();
				if(errorStr.startsWith('[file_contents,assets/data/')) errorStr = 'Missing file: ' + errorStr.substring(34, errorStr.length-1); //Missing chart
				FlxG.sound.play(Paths.sound('cancelMenu'));
				return;
			}
			LoadingState.loadAndSwitchState(new PlayState());
	
			FlxG.sound.music.volume = 0;
						
			#if (MODS_ALLOWED && DISCORD_ALLOWED)
				DiscordClient.loadModRPC();
			#end
		}
		if (FlxG.mouse.overlaps(bar)){
			if(bar.x < 0 || bar.x == 0)
				bar.x = 0;
			else if(bar.x > 1099 || bar.x == 1099)
				bar.x = 1099;
			else
				bar.x += FlxG.mouse.x;
		}
		super.update(elapsed);
	}
}