package{

	import org.flixel.*;
	
	public class Bridge extends AdventureItem{
	
		//media
		[Embed(source="Images/Bridge.png")] protected var ImgItem:Class;
		
		//constructor
		public function Bridge(X:Number = 0, Y:Number = 0, XOffset:Number = 0, YOffset:Number = 0){
		
			super(X,Y);
			loadGraphic(ImgItem,true,true,64,64);
			
			height 	= 64;
			width  	= 64;
			
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
			return "Bridge";
		}
	}
}
