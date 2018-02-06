package{

	import org.flixel.*;
	
	public class RedDragon extends AdventureDragon{
	
		//media
		[Embed(source="Images/RedDragon.png")] 	protected var ImgDragon:Class;
		
		//constructor
		public function RedDragon(target:Dot, X:Number = 0, Y:Number = 0){
		
			super(target, X,Y);
			loadGraphic(ImgDragon,true,true,48,48);
			
			
			Offscreen = false;
			
			//dimensions
			width  	= 48;
			height 	= 48;
			
			//target is the player
			Target = target;			
			
			//speed settings
			maxVelocity.x 	= 140;
			maxVelocity.y 	= 144;		
			drag.x 			= 5000;
			drag.y 			= 5000;
			
			//offscreen memory
			trueX 		= x;
			trueY 		= y;	
			
			//how long it takes this dragon to bite
			BiteTime	= .3;
			
			//create animations
			addAnimation("Walk", [0,1,2,3,4,5,6,7],	10, true);
			addAnimation("Bite", [8,9,10,11],		20, false);
			addAnimation("Die",  [12,13,14],	10, false);
			play("Walk");
			super.update();
		}
		
		//update
		public override function update():void{
			//if I'm still alive
			if(Alive){
				//and also if I'm not offscreen
				if(!Offscreen){
					//oh yeah, if I'm not biting too
					if(!Biting){
						if(x > Target.x){
							//player is to the right: face right
							facing = RIGHT;
						}else{
							//player must be to the left: face left
							facing = LEFT;
						}
						//chase that player!
						if(ChasePlayer()){
							//if i catch him, bite the shit out of him
							Target.InJaws = true;
							Target.JawDir = facing;
							Biting = true;
							//check facing to align sprite
							if(facing == RIGHT){
								x = Target.x + XOffset;
								y = Target.y + YOffset;
							}else if(facing == LEFT){
								x = Target.x + XOffset - width + 4;
								y = Target.y + YOffset;
							}
							play("Bite");
						}
					}else{
						//om nom nom
						playbite();
						super.update();
					}
				}
			}else{
				if(frame != 14){
					super.update();
				}
			}
		}
		
		//die from sword
		public function die():void{
			AdventureLibrary.SaveData("DragonsKilled", (AdventureLibrary.LoadData("DragonsKilled")+1));
			play("Die");
			Alive = false;
			//sound effect
			FlxG.play(AdventureLibrary.DragonDieSF);
		}
		
		override protected function MarkEaten():void{
			AdventureLibrary.SaveData("RedDragonEaten", "true");
		}
		
		//bite player
		public function playbite():void{
			//set up a timer
			Counter += FlxG.elapsed;
			if (Counter >= BiteTime){
				//okay, time to close those jaws
				play("Walk");
				super.update();
				Counter = 0;
				//try to eat the player
				Attack();
			}
		}
	}
}
