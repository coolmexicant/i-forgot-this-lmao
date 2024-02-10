package backend; //This is just so nothing can be in PlayState. Meh

import objects.Character;
import lime.app.Application;

class Modchart {
    public static function onStepHit(curSong:String, curStep:Int){
        if(curSong != null) {
            switch(curSong.toLowerCase()){
                case 'tutorial':
                    switch(curStep){
                        case 10:
                            trace("STEP HITS WORK!!!");
                    }
                case 'bloom':
                    switch(curStep){
                        case 767:
                            FlxTween.tween(Application.current.window, {width: 1920, height: 1080, x: 0, y: 0}, 0.1, {ease: FlxEase.expoOut});
                            PlayState.instance.cameraSpeed = 800;
                            PlayState.instance.camIntensity = 0;
                            PlayState.instance.camZooming = false;
                            PlayState.instance.iconZooming = false;
                        case 800:
                            FlxTween.tween(Application.current.window, {width: 1800, height: 1012, x: 60, y: 34}, 0.1, {ease: FlxEase.expoOut});
                        case 831:
                            FlxTween.tween(Application.current.window, {width: 1500, height: 843, x: 210, y: 118}, 0.1, {ease: FlxEase.expoOut});
                        case 863:
                            FlxTween.tween(Application.current.window, {width: 1280, height: 720, x: 320, y: 180}, 0.1, {ease: FlxEase.expoOut});
                        case 895:
                            FlxTween.tween(Application.current.window, {width: 1100, height: 618, x: 410, y: 231}, 0.1, {ease: FlxEase.expoOut});
                        case 911:
                            FlxTween.tween(Application.current.window, {width: 800, height: 450, x: 560, y: 315}, 0.1, {ease: FlxEase.expoOut});
                        case 927:
                            FlxTween.tween(Application.current.window, {width: 700, height: 393, x: 610, y: 343}, 0.1, {ease: FlxEase.expoOut});
                        case 943:
                            FlxTween.tween(Application.current.window, {width: 550, height: 309, x: 685, y: 385}, 0.1, {ease: FlxEase.expoOut});
                        case 959:
                            FlxTween.tween(Application.current.window, {width: 460, height: 225, x: 760, y: 427}, 0.1, {ease: FlxEase.expoOut});
                        case 975:
                            FlxTween.tween(Application.current.window, {width: 300, height: 168, x: 810, y: 456}, 0.1, {ease: FlxEase.expoOut});
                        case 991:
                            FlxTween.tween(Application.current.window, {width: 200, height: 112, x: 860, y: 484}, 0.1, {ease: FlxEase.expoOut});
                        case 1007:
                            FlxTween.tween(Application.current.window, {width: 100, height: 56, x: 910, y: 512}, 0.1, {ease: FlxEase.expoOut});
                        case 1023:
                            FlxTween.tween(Application.current.window, {width: 1280, height: 720, x: 320, y: 180}, 1, {ease: FlxEase.sineOut});
                            PlayState.instance.cameraSpeed = 1;
                            PlayState.instance.camIntensity = 100;
                            PlayState.instance.camZooming = true;
                            PlayState.instance.iconZooming = true;
                    }
                default:
                    trace("There is no Song defined, therefore, no Modchart.");
            }
        }else{
            trace("There is no Song defined, therefore, no Modchart.");
        }
    }
}