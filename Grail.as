package{

	import org.flixel.*;
	
	public class Grail extends AdventureItem{
	
		//media
		[Embed(source="Images/Grail.png")] protected var Img:Class;
		
		//constructor
		public function Grail(X:Number = 0, Y:Number = 0, XOffset:Number = 0, YOffset:Number = 0){
		
			super(X,Y);
			loadGraphic(Img,true,false,16,16,true);
			
			height 	= 16;
			width  	= 16;
			
			xoffset = XOffset;
			yoffset = YOffset;
			trueX 	= x;
			trueY 	= y;
			x		= -100;
			y		= -100;
			
			//animate!
			addAnimation("Cycle", [0,1,2,4,5], 20, true);
			
			play("Cycle", true);
			
		}
		
		//update
		public override function update():void{
			super.update();
		}
		
		override public function GetName():String{
			return "Grail";
		}
	}
}
