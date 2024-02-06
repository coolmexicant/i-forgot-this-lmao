package backend; //This is just so nothing can be in PlayState. Meh

import objects.Character;

class Modchart {
    public static function onStepHit(curSong:String, curStep:Int){
        if(curSong != null) {
            switch(curSong.toLowerCase()){
                case 'tutorial':
                    switch(curStep){
                        case 10:
                            trace("STEP HITS WORK!!!");
                    }
            }
        }else{
            trace("There is no Song defined, therefore, no Modchart.");
        }
    }
}