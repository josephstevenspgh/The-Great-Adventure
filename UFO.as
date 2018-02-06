package{

	import org.flixel.*;
	
	public class UFO extends FlxSprite{
	
		//important player state variables
		private var Alive:Boolean	= true;
		private var speed:Number	= 1;
		private var Direction:Boolean	= true;
		private var Shooting:Boolean	= false;
		//media
		//graphics
		[Embed(source="Images/UFO.png")] protected var ImgPlayer:Class;

		
		public function UFO(newX:uint, newY:uint){
			//set up starting position
			x	= newX;
			y	= newY;
			//load graphic
			loadGraphic(ImgPlayer,true,true,28,20);
			//set up player animations
			addAnimation("Wobble", [0, 1, 2, 3], 5, true);
			play("Wobble");
		}
		
		//update function
		public override function update():void{
			//AI will go here
			doAI();
			//update
			super.update();
		}
		
		//AI function
		private function doAI():void{
			//classic AI
			//very simple, move left, right, randomly shoot down
			//if Direction is True, go right
			//else, go left
			if(Direction){
				x += speed;
			}else{
				x -= speed;
			}
			//if you are going past a screen edge, reverse direction and increase speed, also move down some
			if(x >= FlxG.width - 40){
				Direction = false;
				speed += .25;
				y += 8;
			}else if(x < 0){
				Direction = true;
				speed += .25;
				y += 8;
			}
			
			//decide if you should fire a bullet
			if((FlxU.random()) > .99){
				Shooting	= true;
			}
		}
		
		public function GetSpeed():Number{	return speed; }
		
		public function CheckShooting():Boolean{	return Shooting; }
		
		public function StopShooting():void{	Shooting = false; }
	}
}
