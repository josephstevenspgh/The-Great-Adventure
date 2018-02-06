package{

	import org.flixel.*;
	
	public class Squiddy extends FlxSprite{
	
		//important player state variables
		private var Alive:Boolean	= true;
		
		//media
		//graphics
		[Embed(source="Images/Squiddy.png")] protected var ImgPlayer:Class;

		
		public function Squiddy(newX:uint, newY:uint){
			//set up starting position
			x	= newX;
			y	= newY;
			//load graphic
			loadGraphic(ImgPlayer,true,true,40,49);
			//set up player animations
			addAnimation("Wobble", [0, 1, 2, 3], 50, true);
			play("Wobble");
		}
		
		//update function
		public override function update():void{
			//AI will go here
			
			//update
			super.update();
		}
	}
}
