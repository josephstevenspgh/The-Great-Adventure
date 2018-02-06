package{

	import org.flixel.*;
	
	public class AdventureDragon extends AdventureItem{
		public var speed:Number			= 0;
		public var Target:Dot;
		public var Alive:Boolean		= true;
		public var XOffset:Number		= 2;
		public var YOffset:Number		= -8;
		public var Counter:Number		= 0;
		public var Biting:Boolean		= false;
		public var BiteTime:Number		= 1;
		public var ChompSFX:FlxSound;
		public var MissedAChomp:Boolean	= false;
		
		//constructor
		public function AdventureDragon(target:Dot, X:Number = 0, Y:Number = 0){
		
			super(X,Y);
			
			width  	= 32;
			height 	= 48;
		}
		
		//function to eat player
		protected function Attack():void{
			//sound effect
			FlxG.play(AdventureLibrary.DragonChompSF);
			var Miss:Boolean	= true;
			//if target is within biting area
			if(facing == RIGHT){
				if(((Target.x + XOffset) - x < 10) && ((Target.x + XOffset) - x > - 4) 
				&& ((Target.y + YOffset) - y < 4) && ((Target.y + YOffset) - y > - 4)){
					//eat that mother fucker!
					MarkEaten();
					Miss	= false;
					Target.eaten();
				}
			}else if (facing == LEFT){
				if(((Target.x + XOffset - width + 4) - x < 4) && ((Target.x + XOffset - width + 4) - x > - 10) 
				&& ((Target.y + YOffset) - y < 4) && ((Target.y + YOffset) - y > - 4)){
					//eat that mother fucker!
					MarkEaten();
					Miss	= false;
					Target.eaten();
				}
			
			}
			if(Miss	== true){
				MissedAChomp	= true;
			}
			Biting = false;
		}
		
		protected function MarkEaten():void{}
		
		protected function ChasePlayer():Boolean{
			
			acceleration.x = 0;
			acceleration.y = 0;
		
			//run towards player
			//locate player: if within half a screen, chase him down
			//check to see if you're in the correct position to bite
			
			if(overlaps(Target)){
				//bite!
				return true;
			}else if(((Target.x-x)+(Target.y-y) < 200)){
				//player is within your sight
				if(x > (Target.x + XOffset)){
					acceleration.x = -drag.x;
				}	
				if(x < (Target.x + XOffset)){
					acceleration.x = drag.x;
				}	
				if(y > (Target.y + YOffset)){
					acceleration.y = -drag.y;
				}	
				if(y < (Target.y + YOffset)){
					acceleration.y = drag.y;
				}
			}
			if(overlaps(Target)){
				//if you catch the player, eat the player
				
			}
			super.update();
			return false;
		}
	}
}
