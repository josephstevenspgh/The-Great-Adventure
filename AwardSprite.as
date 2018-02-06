package{
	import org.flixel.*;
 
	public class AwardSprite extends FlxSprite{
		private var Fading:Boolean	= false;
		private var Flash:Boolean	= false;
		private var FlashSprite:FlxSprite;
		private var FlashCount:uint;
		
		public function AwardSprite(){
			super(152, 8);
			loadGraphic(AdventureLibrary.ImgAwards, false, false, 16, 16);
			alpha = 0;
		}
		
		//this is the update() function
		override public function update():void{
			if(Flash){
				if(FlashSprite.alpha > 0){
					FlashSprite.alpha -= (FlxG.elapsed);
				}else{
					FlashCount += 1;
					if(FlashCount >= 3){
						FlashCount = 0;
						Flash = false;
						Fading = true;
					}else{
						FlashSprite.alpha = 1;
					}
				}
			}
			if(Fading){
				if(alpha > 0){
					alpha -= (FlxG.elapsed*.5)
				}else{
					Fading = false;
				}
			}
			super.update();
		}
		
		public function StartFade(fs:FlxSprite):void{
			FlashSprite = fs;
			visible = true;
			alpha = 1;
			FlashSprite.alpha = 1;
			Flash = true;
		}
	}
}
