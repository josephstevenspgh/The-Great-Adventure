package{

	import org.flixel.*;
	
	public class GoldGate extends AdventureGate{
	
		//media
		[Embed(source="Images/GoldGate.png")] protected var ImgGate:Class;
				
		//constructor
		public function GoldGate(X:Number = 0, Y:Number = 0){
		
			super(X,Y);
			loadGraphic(ImgGate,true,true,32,32);
			
			fixed	= true;
			height 	= 32;
			width  	= 32;
			
		}
		
		//update
		public override function update():void{
			if(!Offscreen){
				if(!Opened){
					if(!Opening){
						x = 144;
						y = 144;
					}else{
						if( y > 121 ){
							y -= 1;
						}else{
							Opening = false;
							Opened 	= true;
						}
					}
				}else{
					x = 144;
					y = 120;
				}
			}else{
				x = 400;
				y = 400;
			}
			super.update();
		}
	}
}
