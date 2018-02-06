package{
	import org.flixel.*;
	import flash.ui.Keyboard;
	import flash.events.Event;
	import flash.events.KeyboardEvent;

 
	public class LoseState extends FlxState{

		//menu groups
		private var MenuBG:FlxGroup;
		private var MenuButtons:FlxGroup;
		//buttons
		private var MenuButtonRePlay:FlxSprite;
		private var MenuButtonTitle:FlxSprite;
		private var MenuButtonMoreGames:FlxSprite;
		private var MenuFrame:FlxSprite;
		//bgs
		private var MenuGameSelectArea:FlxSprite;
		
		//stats!
		private var MapSelected:Number;
		//awards
		protected var AwardList:Array;
		protected var AwardGroup:FlxGroup;
		protected var AwardTimer:uint;
		protected var NOTYET:Boolean	= true;
		
		public function LoseState(CurrentMap:Number){
			//initialize some things
			MapSelected = CurrentMap;
		}
		
		//this handles initializing everything
		override public function create():void{
			//Increase Deaths
			AdventureLibrary.SaveData("Deaths", (AdventureLibrary.LoadData("Deaths")+1));
			AwardList = AdventureLibrary.InitAwards();
			//flash screen red
			FlxG.flash.start(0xFFFF0000);
			
			//make mouse visible
			FlxG.mouse.show();
						
			FlxG.playMusic(AdventureLibrary.PinchMusic);
			
			MakeMenu();
			
			CheckAwards();
			
			super.update();
		}
		
		private function CheckAwards():void{
			if(AdventureLibrary.LoadData("Deaths") >= 25){
				GiveAward(12);
			}
			if(AdventureLibrary.LoadData("GreenDragonEaten") ==  "true"){
				GiveAward(9);
			}
			if(AdventureLibrary.LoadData("YellowDragonEaten") == "true"){
				GiveAward(10);
			}
			if(AdventureLibrary.LoadData("RedDragonEaten") == "true"){
				GiveAward(11);
			}
		}
		
		private function GiveAward(Award:uint):void{
			//only give the award if they don't have it yet
			if(AwardList[Award] == "false"){
				AwardGroup.members[0].frame		= Award;
				AwardGroup.members[0].StartFade(AwardGroup.members[1]);
				//save award
				AdventureLibrary.SaveAward(Award);
				//set award to gotten
				AwardList[Award] = "true";
			}
		}
		
		//this is the update() function
		override public function update():void{
			//check for mouse press
			if(FlxG.mouse.justPressed()){
				//check for buttons
				
				//Main Buttons
				//RePlay button
				if(AdventureLibrary.ClickOnSprite(MenuButtonRePlay)){
					//replay the map							
					switch(MapSelected){
						case 1:
							FlxG.state = new Map1();
							break;
						case 2:
							FlxG.state = new Map2();
							break;
						case 3:
							FlxG.state = new Map3();
							break;
						case 4:
							FlxG.state = new Map4();
							break;
						case 5:
							FlxG.state = new Map5();
							break;
						case 6:
							FlxG.state = new Map6();
							break;
						case 7:
							FlxG.state = new Map7();
							break;
						case 8:
//							FlxG.state = new Map8();
							break;
						case 9:
//							FlxG.state = new Map9();
							break;
					}
				}
				
				//Title button
				if(AdventureLibrary.ClickOnSprite(MenuButtonTitle)){
					//Show Title Screen
					FlxG.play(AdventureLibrary.PlayerGetItemSF);
					FlxG.state = new TitleState();
				}
				//More Games button
				if(AdventureLibrary.ClickOnSprite(MenuButtonMoreGames)){
					//Link to Sponsor
					FlxG.play(AdventureLibrary.PlayerGetItemSF);
						//http link here
						FlxU.openURL("http://www.splixel.com");
						GiveAward(35);
				}
			}
			super.update();
		}
		
		private function MakeMenu():void{
			//init groups			
			MenuBG 		= new FlxGroup();
			MenuButtons	= new FlxGroup();
			
			//background
			var i:int;
			var j:int;
			var tempsprite:FlxSprite;
			for(i = 0; i < 10; i++){
				for(j = 0;j < 8; j++){
					tempsprite = new FlxSprite((i*32),(j*32));
					tempsprite.loadGraphic(AdventureLibrary.ImgMenuBG,true,true,32,32);
					tempsprite.addAnimation("Cycle", [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31], 30, true);
					tempsprite.play("Cycle");
					MenuBG.add(tempsprite);
				}
			}
					
			//game buttons
			MenuButtonRePlay	= new FlxSprite();
			MenuButtonTitle 	= new FlxSprite();
			MenuButtonMoreGames = new FlxSprite();
			MenuGameSelectArea	= new FlxSprite();
			MenuFrame			= new FlxSprite;
			
			MenuButtonRePlay.loadGraphic(AdventureLibrary.ImgMenuButtons, true, true, 56, 64);
			MenuButtonTitle.loadGraphic(AdventureLibrary.ImgMenuButtons, true, true, 56, 64);
			MenuButtonMoreGames.loadGraphic(AdventureLibrary.ImgMenuButtons, true, true, 56, 64);
			MenuGameSelectArea.createGraphic((320-32), (FlxG.height/2)-16, 0x80000000);
			MenuFrame.loadGraphic(AdventureLibrary.ImgFrame, true, true, 288, 104);
			
			MenuButtonRePlay.frame		= 4;
			MenuButtonTitle.frame		= 5;
			MenuButtonMoreGames.frame	= 6;
			
			MenuButtonRePlay.x		= 16;
			MenuButtonRePlay.y		= 32;
			MenuButtonTitle.x		= 16+61+16;
			MenuButtonTitle.y		= 32;
			MenuButtonMoreGames.x	= 16+61+61+61+48;
			MenuButtonMoreGames.y	= 32;
			
			MenuGameSelectArea.x	= 16;
			MenuGameSelectArea.y	= (FlxG.height/2);
			
			MenuFrame.x				= 16;
			MenuFrame.y				= (FlxG.height/2);
			
			//add elements to groups
			MenuButtons.add(MenuButtonRePlay);
			MenuButtons.add(MenuButtonTitle);
			MenuButtons.add(MenuButtonMoreGames);
			MenuButtons.add(MenuGameSelectArea);
			MenuButtons.add(MenuFrame);
			MenuButtons.add(AdventureLibrary.DrawEnhancedFont(MenuFrame.x+8, MenuFrame.y+8,    "It seems you have been eaten!"));
			MenuButtons.add(AdventureLibrary.DrawEnhancedFont(MenuFrame.x+8, MenuFrame.y+8+20, "In the future, I would try to"));
			MenuButtons.add(AdventureLibrary.DrawEnhancedFont(MenuFrame.x+8, MenuFrame.y+8+30, "avoid this. You can either stab"));
			MenuButtons.add(AdventureLibrary.DrawEnhancedFont(MenuFrame.x+8, MenuFrame.y+8+40, "the nasty beast with a sword, or "));
			MenuButtons.add(AdventureLibrary.DrawEnhancedFont(MenuFrame.x+8, MenuFrame.y+8+50, "you could run away."));
			MenuButtons.add(AdventureLibrary.DrawEnhancedFont(MenuFrame.x+8, MenuFrame.y+8+70, "Would you like to try that again?"));
			
			//add groups
			add(MenuBG);
			add(MenuButtons);
			
						var FlashSprite:FlxSprite = new FlxSprite(152, 8);
			FlashSprite.createGraphic(16, 16, 0xBBFFFFFF);
			FlashSprite.alpha = 0;
			AwardGroup	= new FlxGroup();
			AwardGroup.add(new AwardSprite());
			AwardGroup.add(FlashSprite);
			
			add(AwardGroup);
		}
	}
}
