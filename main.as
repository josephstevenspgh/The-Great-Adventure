package{
	import org.flixel.*;
	import mochi.as3.*;	
	[SWF(width="640", height="480", backgroundcolor="#887090")]
	[Frame(factoryClass="Preloader")]

	public class main extends FlxGame{
		public function main(){
		MochiAd.showPreGameAd({clip:root, id:"4b654d06aa584c78", res:"640x480", background:0x1C3D49, color:0x61B1E6, outline:0x177EA5, no_bg:false});
			super(320,240,TitleState,2);
		}
	}
}
