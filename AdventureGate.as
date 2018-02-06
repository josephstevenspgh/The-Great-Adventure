package{

	import org.flixel.*;
	
	public class AdventureGate extends AdventureItem{
			
		public var Opened:Boolean 	= false;
		public var Opening:Boolean 	= false;
		
		//constructor
		public function AdventureGate(X:Number = 0, Y:Number = 0){
			super(X,Y);	
		}
	}
}
