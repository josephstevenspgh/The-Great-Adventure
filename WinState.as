package{
	import org.flixel.*;
	import flash.ui.Keyboard;
	import flash.events.Event;
	import flash.events.KeyboardEvent;

 
	public class WinState extends FlxState{

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
		private var Time:String;
		private var TimeN:Number;
		private var BestTimeS:String;
		private var BestTime:Number;
		private var MapSelected:Number;
		
		//Flixel Loading/Saving
		private var TempBestTime:Number = 1800;

		//awards
		protected var AwardList:Array;
		protected var AwardGroup:FlxGroup;
		protected var AwardTimer:uint;
		protected var NOTYET:Boolean	= true;
		protected var Pacifist:Boolean;
		protected var Minimalist:Boolean;
		
		//bull
		private var FirstTimeWin:Boolean	= false;
				
		public function WinState(CurrentMap:Number, time:Number, Pacifism:Boolean, Mini:Boolean){
			//awards
			AwardList 	= AdventureLibrary.InitAwards();
			Pacifist 	= Pacifism;
			Minimalist	= Mini;
			
			//initialize some things
			MapSelected = CurrentMap;
			
			//mark map as completed
			if(AdventureLibrary.LoadData("MapCompleted"+MapSelected.toString()) != "Completed"){
				FirstTimeWin	= true;
			}
			AdventureLibrary.SaveData("MapCompleted"+MapSelected.toString(), "Completed");
			
			//load best time
			BestTime = AdventureLibrary.LoadBestTime("BestTime"+MapSelected.toString());
			//check to see if your time is the best time
			if(time < BestTime){
				BestTime = time;
				//save BestTime
				AdventureLibrary.SaveData("BestTime"+MapSelected.toString(), BestTime);
			}
			//now turn Time and BestTime into better formatted things
			Time 		= new String(TimeFormat(time));
			TimeN		= time;
			BestTimeS 	= new String(TimeFormat(BestTime));
		}	
		
		private function CheckAwards():void{
			//check for awards
			
			//Every Map Completed
			if(AdventureLibrary.LoadData("MapCompleted1") == "Completed" &&
				AdventureLibrary.LoadData("MapCompleted2") == "Completed" &&
				AdventureLibrary.LoadData("MapCompleted3") == "Completed" &&
				AdventureLibrary.LoadData("MapCompleted4") == "Completed" &&
				AdventureLibrary.LoadData("MapCompleted5") == "Completed" &&
				AdventureLibrary.LoadData("MapCompleted6") == "Completed" &&
				AdventureLibrary.LoadData("MapCompleted7") == "Completed"){
				GiveAward(29);
			}
			
			//Pacifism
			if(Pacifist){
				GiveAward(26);
			}
			
			//Minimalism
			if(Minimalist){
				GiveAward(28);
			}
			
			//maps completed
			//Count total maps completed
			var MapsBeat:uint	= 0;
			for(var i:uint=1; i < 8; i++){
				if(AdventureLibrary.LoadData("MapCompleted"+i) == "Completed"){
					MapsBeat++;
				}
			}
			if(MapsBeat >= 1){
				GiveAward(13);
			}
			if(MapsBeat >= 2){
				GiveAward(14);
			}
			if(MapsBeat >= 4){
				GiveAward(15);
			}
			if(MapsBeat >= 6){
				GiveAward(16);
			}
			
			//speed
			if(MapSelected == 1 && TimeN <= 60){
				GiveAward(21);
			}
			if(MapSelected == 3 && TimeN <= 90){
				GiveAward(22);
			}
			if(MapSelected == 5 && TimeN <= 210){
				GiveAward(23);
			}
			if(MapSelected == 7 && TimeN <= 90){
				GiveAward(24);
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
		
		private function GenerateTweet():String{
			var TweetMe:String = new String("http://www.twitter.com/?status=I just beat map "+MapSelected+" in The Great Adventure in only "+Time+"!");
			if(TimeN == BestTime){
				TweetMe += " This was my best time yet!";
			}
			TweetMe += " Play it at http://splixel.com #splixelgames";
			return TweetMe;
		}
		
		//this handles initializing everything
		override public function create():void{
			//flash screen blue
			FlxG.flash.start(0xFF8080FF);
			//make mouse visible
			FlxG.mouse.show();
						
			FlxG.playMusic(AdventureLibrary.TitleMusic);
			
			MakeMenu();
			
			super.update();
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
					}
				}
				
				//Title button
				if(AdventureLibrary.ClickOnSprite(MenuButtonTitle)){
					//Show Title Screen
					FlxG.play(AdventureLibrary.PlayerGetItemSF);
					FlxG.state = new TitleState();
				}
				//More Games button					//More Games button
				if(AdventureLibrary.ClickOnSprite(MenuButtonMoreGames)){
					//Link to Sponsor
					FlxG.play(AdventureLibrary.PlayerGetItemSF);
					//http link here
					FlxU.openURL("http://www.splixel.com");
					GiveAward(35);
				}
			}
			
			//awards 
			
			super.update();
		}
		
		private function MakeMenu():void{
			//init groups			
			MenuBG 		= new FlxGroup();
			MenuButtons	= new FlxGroup();
			
			
			var FlashSprite:FlxSprite = new FlxSprite(152, 8);
			FlashSprite.createGraphic(16, 16, 0xBBFFFFFF);
			FlashSprite.alpha = 0;
			AwardGroup	= new FlxGroup();
			AwardGroup.add(new AwardSprite());
			AwardGroup.add(FlashSprite);
			
			//background
			var i:int;
			var j:int;
			var tempsprite:FlxSprite;
			for(i = 0; i < 10; i++){
				for(j = 0;j < 8; j++){
					tempsprite = new FlxSprite((i*32),(j*32));
					tempsprite.loadGraphic(AdventureLibrary.ImgMenuBG,true,true,32,32);
					tempsprite.addAnimation("Cycle", [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31], 10, true);
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

			//Draw Text
			MenuButtons.add(AdventureLibrary.DrawEnhancedFont(MenuFrame.x + 4, MenuFrame.y + 4, "Congratulations! You beat map "+MapSelected+"!"));
			MenuButtons.add(AdventureLibrary.DrawEnhancedFont(MenuFrame.x + 4, MenuFrame.y + 14, "Your time was "+Time+"."));
			MenuButtons.add(AdventureLibrary.DrawEnhancedFont(MenuFrame.x + 4, MenuFrame.y + 24, "The best time is "+BestTimeS+"."));

			var SText1:String	= "You did great!";
			var SText2:String	= "";
			var SText3:String	= "But can you beat that time?";			
			if(FirstTimeWin){
				switch(MapSelected){
					default:break;
					case 1:
						SText1	= "Congratulations!";
						SText2	= "You did great!";
						SText3	= "You have unlocked maps 2 and 3!";
						break;
					case 3:
						SText1	= "Congratulations!";
						SText2	= "You did great!";
						SText3	= "You have unlocked map 4!";
						break;
					case 4:
						SText1	= "Congratulations!";
						SText2	= "You did great!";
						SText3	= "You have unlocked map 5!";
						break;
					case 5:
						SText1	= "Congratulations!";
						SText2	= "You did great!";
						SText3	= "You have unlocked map 6!";
						break;
					case 6:
						SText1	= "Congratulations!";
						SText2	= "You did great!";
						SText3	= "You have unlocked map 7!";
						break;
				}
			}
			
			MenuButtons.add(AdventureLibrary.DrawEnhancedFont(MenuFrame.x + 4, MenuFrame.y + 44, SText1));
			MenuButtons.add(AdventureLibrary.DrawEnhancedFont(MenuFrame.x + 4, MenuFrame.y + 54, SText2));
			if(SText2.length > 2){
				MenuButtons.add(AdventureLibrary.DrawEnhancedFont(MenuFrame.x + 4, MenuFrame.y + 74, SText3));
			}else{
				MenuButtons.add(AdventureLibrary.DrawEnhancedFont(MenuFrame.x + 4, MenuFrame.y + 64, SText3));
			}
			
			//"Tweet This!" button
			
			//add groups
			add(MenuBG);
			add(MenuButtons);
			add(AwardGroup);
			
			CheckAwards();
		}
		
		private function TimeFormat(T:Number):String{
			//if greater than 60, separate it some
			if(T >= 60){
				//its gotta be minutes:seconds
				var Minutes:String = new String((T/60).toString());
				//strip decimals
				if(Minutes.indexOf('.') > 0){
					Minutes = Minutes.substr(0, Minutes.indexOf('.'));
				}
				var Seconds:String = new String(T - (int(Minutes)*60));
				//strip decimals
				if(Seconds.indexOf('.') > 0){
					Seconds = Seconds.substr(0, Seconds.indexOf('.'));
				}
				//if seconds are less than 10, add a 0 beforehand
				if(int(Seconds) < 10){
					Seconds = new String("0"+Seconds);
				}
				//build return string
				var NewTime:String = new String(Minutes+":"+Seconds);
				return NewTime;
			}else{
				var NewT:String = T.toString();
				//cut decimals
				if(NewT.indexOf('.') > 0){
					NewT = NewT.substr(0, NewT.indexOf('.'));
				}
				//if seconds are less than 10, add a 0 beforehand
				if(int(NewT) < 10){
					NewT = new String("0"+NewT);
				}
				return new String("0:"+NewT);
			}
		}
	}
}
