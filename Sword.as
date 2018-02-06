package{

	import org.flixel.*;
	
	public class Sword extends AdventureItem{
	
		//media
		[Embed(source="Images/Sword.png")] protected var ImgSword:Class;
		
		//constructor
		public function Sword(X:Number = 0, Y:Number = 0, XOffset:Number = 0, YOffset:Number = 0){
		
			super(X,Y);
			loadGraphic(ImgSword,true,true,12,8);
			
			height 	= 8;
			width  	= 12;
			
			xoffset = XOffset;
			yoffset = YOffset;
			trueX 	= x;
			trueY 	= y;
			x		= -100;
			y		= -100;
			
		}
		
		//update
		public override function update():void{
			super.update();
		}
		
		override public function GetName():String{
			return "Sword";
		}
	}
}
