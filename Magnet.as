package{

	import org.flixel.*;
	
	public class Magnet extends AdventureItem{
	
		//media
		[Embed(source="Images/Magnet.png")] protected var ImgItem:Class;
		
		//constructor
		public function Magnet(X:Number = 0, Y:Number = 0, XOffset:Number = 0, YOffset:Number = 0){
		
			super(X,Y);
			loadGraphic(ImgItem,true,true,16,16);
			
			height 	= 16;
			width  	= 16;
			
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
			return "Magnet";
		}
	}
}
