package{

	import org.flixel.*;
	
	public class GoldKey extends AdventureItem{
	
		//media
		[Embed(source="Images/GoldKey.png")] protected var ImgGKey:Class;
		
		//constructor
		public function GoldKey(X:Number = 0, Y:Number = 0, XOffset:Number = 0, YOffset:Number = 0){
		
			super(X,Y);
			loadGraphic(ImgGKey,true,true,13,6);
			
			height 	= 6;
			width  	= 13;
			
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
			return "GoldKey";
		}
	}
}
