package{

	import org.flixel.*;
	import flash.ui.Keyboard;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	public class HurtyBullet extends FlxSprite{
		//graphics
		[Embed(source="Images/HurtyBullet.png")] protected var ImgBullet:Class;
	
		//variables
		private var speed:Number;
		
		public function HurtyBullet(s:Number){
			speed = s;
			//load graphic
			loadGraphic(ImgBullet,true,true,4,8);
			//set up player animations
			addAnimation("TheOnlyFrame", [0], 0, false);
			//initialize position onscreen
			x	= (FlxG.width/2) - 32;
			y	= FlxG.height - 32;
			play("TheOnlyFrame");
		}
		
		//update function
		public override function update():void{
			//move down
			y += speed;
			//update
			super.update();
		}
	}
}
