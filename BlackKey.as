package{

	import org.flixel.*;
	
	public class BlackKey extends AdventureItem{
	
		//media
		[Embed(source="Images/BlackKey.png")] protected var ImgKey:Class;
		
		//constructor
		public function BlackKey(X:Number = 0, Y:Number = 0, XOffset:Number = 0, YOffset:Number = 0){
		
			super(X,Y);
			loadGraphic(ImgKey,true,true,13,6);
			
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
			return "BlackKey";
		}
	}
}
