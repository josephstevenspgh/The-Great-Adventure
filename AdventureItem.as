package{

	import org.flixel.*;
	
	public class AdventureItem extends FlxSprite{
			
		public var xoffset:Number 		= 0;
		public var yoffset:Number 		= 0;
		public var trueX:Number 		= 0;
		public var trueY:Number 		= 0;
		public var roomIDX:Number  		= 0;
		public var roomIDY:Number  		= 0;
		public var Offscreen:Boolean	= true;
		public var Grabbed:Boolean = false;
		
		//constructor
		public function AdventureItem(X:Number = 0, Y:Number = 0, XOffset:Number = 0, YOffset:Number = 0){
			super(X,Y);	
		}
		
		public function GetName():String{
			return "Generic";
		}
	}
}
