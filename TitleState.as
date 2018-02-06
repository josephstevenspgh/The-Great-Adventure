package{
	import org.flixel.*;
	import flash.ui.Keyboard;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.external.ExternalInterface;	

 
	public class TitleState extends FlxState{

		private var SiteLock:Boolean	= true;
		private var grail:Grail;
		private var MenuTime:Boolean	= false;
		private var PlayMenu:Boolean	= false;
		
		//awards
		private var AwardsMenu:Boolean	= false;
		
		//menu groups
		private var PressSpace:PixelFont;
		private var MenuBG:FlxGroup;
		private var MenuButtons:FlxGroup;
		private var AwardsGroup:FlxGroup;
		private var CreditsGroup:FlxGroup;
		private var RolloverGroup:FlxGroup;
		//buttons
		private var MenuButtonPlay:FlxSprite;
		private var MenuButtonAwards:FlxSprite;
		private var MenuButtonCredits:FlxSprite;
		private var MenuButtonMoreGames:FlxSprite;
		private var MenuFrame:FlxSprite;
		//different maps
		private var Map1Button:FlxSprite;
		private var Map2Button:FlxSprite;
		private var Map3Button:FlxSprite;
		private var Map4Button:FlxSprite;
		private var Map5Button:FlxSprite;
		private var Map6Button:FlxSprite;
		private var Map7Button:FlxSprite;
		private var ClassicText:FlxSprite;
		private var ExtendedText:FlxSprite;
		private var MapSelectionOverlay:FlxSprite;
		//bgs
		private var MenuGameSelectArea:FlxSprite;
		
		//map selection
		private var MapSelected:Number;
		private var GreyGroup:FlxGroup;
		private var CodeNum:uint	= 0;
		
		
		//awards
		protected var AwardList:Array;
		protected var AwardGroup:FlxGroup;
		protected var AwardTimer:uint;
		protected var NOTYET:Boolean	= true;
		
		//this handles initializing everything
		override public function create():void{
			AwardList = AdventureLibrary.InitAwards();
			//play music
			FlxG.playMusic(AdventureLibrary.TitleMusic);
			
			//make mouse visible
			FlxG.mouse.show();
			
			//set up title elements
			grail 			= new Grail(28,98);
			grail.x			= (FlxG.width/2) - 8;
			grail.y			= 172;
			PressSpace = new PixelFont(AdventureLibrary.ImgBigFont, 0, (FlxG.height/2)-8, "Press Space", "Center", 16, 16);		
			add(new FlxSprite(0,0,AdventureLibrary.ImgBG));
			add(PressSpace);
			add(AdventureLibrary.DrawClassicFont(8, (240-16), "Created by Joseph Stevens", "Right"));
			add(grail);
			
			var DoNothing:Boolean = false;
			
			//SITELOCK BS
			if(SiteLock){
				var allowed_site:String = "flashgamelicense.com"; 
				var domain:String = ExternalInterface.call('window.location.href.toString').split("/")[2];
				if (domain.indexOf(allowed_site) != (domain.length - allowed_site.length)) { 
					// kill
					DoNothing = true;		
				}
			}
			
			if(!DoNothing){
				//initialize some screens that will be temporary
				initMenu();
				initAwards();
				initCredits();
				initAwardsGroup();
				
				//show awards
				ShowEarnedAwards();
				
				//hide everything in groups so title shows
				hideElements(MenuBG);
				hideElements(MenuButtons);
				hideElements(AwardsGroup);
				hideElements(CreditsGroup);
				GreyOut();
				hideElements(GreyGroup);
			}
			
			super.update();
		}
		
		private function initAwardsGroup():void{
			//setup awards
			var FlashSprite:FlxSprite = new FlxSprite(152, 8);
			FlashSprite.createGraphic(16, 16, 0xBBFFFFFF);
			FlashSprite.alpha = 0;
			AwardGroup = new FlxGroup();
			AwardGroup.add(new AwardSprite());
			AwardGroup.add(FlashSprite);
			add(AwardGroup);		
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
			CheckCode();
			if(MenuTime){		
				//show main menu	
				//check for mouse press
				
					
				//awards rollovers
				if(AwardsMenu){
					//this is ugh
					var mouseovering:Boolean = false;
					for(var i:uint = 0;i < (AwardsGroup.members.length);i++){
						if(AdventureLibrary.ClickOnSprite(AwardsGroup.members[i])){
							//set up X/Y
							var rx:uint;
							//check to see if X will cause text to go offscreen
							if(((FlxG.mouse.x - 10) + (AdventureLibrary.AwardsText[i].length * 8) + 4) >= 320){
								//too much - move it back
								rx	= 320 - ((AdventureLibrary.AwardsText[i].length * 8) + 4);
							}else{
								//you're good, proceed
								rx	= FlxG.mouse.x - 10;
							}
							var ry:uint	= FlxG.mouse.y - 10;
							
							//show this rollover
							RolloverGroup.members[0].x	= rx;
							RolloverGroup.members[0].y	= ry;
							RolloverGroup.members[1]	= AdventureLibrary.DrawClassicFont(rx+2, ry+2, AdventureLibrary.AwardsText[i]);
							//recreate dark area graphic
							RolloverGroup.members[0].createGraphic(((AdventureLibrary.AwardsText[i].length * 8) + 4),12, 0x80000000);
							mouseovering = true;
						}
					}
					if(!mouseovering){
						//hide rollover
						RolloverGroup.members[0].x	= 1000;
						RolloverGroup.members[0].y	= 1000;
						RolloverGroup.members[1].destroy();
					}
				}
				
				if(FlxG.mouse.justPressed()){
					//check for buttons
					
					//Main Buttons
					
					//Play button
					if(!PlayMenu){
						//show main play menu again if you click play button
						if(AdventureLibrary.ClickOnSprite(MenuButtonPlay)){						
							showMenu();
						}
					}else{
						CheckPlayMenu();
					}
					
					//Awards button
					if(AdventureLibrary.ClickOnSprite(MenuButtonAwards)){
						//Show Award Screen
						showAwards();
						FlxG.play(AdventureLibrary.PlayerGetItemSF);
					}
					
					//Credits button
					if(AdventureLibrary.ClickOnSprite(MenuButtonCredits)){
						//Show Credits Screen
						showCredits();
						FlxG.play(AdventureLibrary.PlayerGetItemSF);
					}
					
					//More Games button
					if(AdventureLibrary.ClickOnSprite(MenuButtonMoreGames)){
						//Link to Sponsor
						FlxG.play(AdventureLibrary.PlayerGetItemSF);
						//http link here
						FlxU.openURL("http://www.splixel.com");
						GiveAward(35);
						AwardsGroup.members[34].alpha = 1;
					}
				}
			}else{
				//enter the menu on space or mouseclick
				if(FlxG.keys.SPACE || FlxG.mouse.justPressed()){
					MenuTime = true;
					//flash the screen
					FlxG.flash.start(0xFFFFFFFF);
					//add a bunch of awesome
					showMenu();
				}
			}
			super.update();
		}
		
		private function hideElements(Group:FlxGroup):void{
			for(var i:uint = 0;i <  Group.members.length;i++){
				Group.members[i].visible = false;
			}
		}
		
		private function showElements(Group:FlxGroup):void{
			for(var i:uint = 0;i < Group.members.length;i++){
				Group.members[i].visible = true;
			}
		}
		
		private function showMenu():void{
			//hide awards, hide credits
			hideElements(AwardsGroup);
			hideElements(CreditsGroup);
			//show menu
			showElements(MenuBG);
			showElements(MenuButtons);
			showElements(GreyGroup);
			//set up flags
			PlayMenu 	= true;
			AwardsMenu 	= false;
		}
		
		private function showAwards():void{
			//hide menu, credits, show awards
			
			hideElements(MenuButtons);
			hideElements(CreditsGroup);
			showElements(AwardsGroup);
			hideElements(GreyGroup);
			PlayMenu 	= false;
			AwardsMenu 	= true;
			CheckMaster();
		}
		
		private function showCredits():void{
			//hide menu, awards, show credits
			hideElements(MenuButtons);
			hideElements(AwardsGroup);
			showElements(CreditsGroup);
			hideElements(GreyGroup);
			PlayMenu 	= false;
			AwardsMenu 	= false;
			GiveAward(34);
			AwardsGroup.members[33].alpha	= 1;
		}
		
		private function CheckMaster():void{
			//Count Awards
			var ACount:uint = 0;
			for(var i:uint = 0; i < 36; i++){
				if(AdventureLibrary.LoadAward(i+1) == "true"){
					ACount++;
				}
			}
			if(ACount >= 5){
				GiveAward(5);
				AwardsGroup.members[4].alpha	= 1;
			}
			if(ACount >= 10){
				GiveAward(6);
				AwardsGroup.members[5].alpha	= 1;
			}
			if(ACount >= 15){
				GiveAward(7);
				AwardsGroup.members[6].alpha	= 1;
			}
			if(ACount >= 20){
				GiveAward(8);
				AwardsGroup.members[7].alpha	= 1;
			}
			if(ACount >= 30){
				GiveAward(31);
				AwardsGroup.members[30].alpha	= 1;
			}
			if(ACount >= 35){
				GiveAward(36);
				AwardsGroup.members[35].alpha	= 1;
			}
		}
		
		private function initAwards():void{
			//add dummy award to make code easier
			//set up awards screen
			//for now, lets just fill up the box with as many as we can, tastefully
			AwardsGroup = new FlxGroup();
			//add box sprites for awards
			var tempsprite:FlxSprite;
			var Counter:uint = 1;
			for(var i:uint = 0;i < 9;i++){
				for(var j:uint = 0;j < 4;j++){
					tempsprite = new FlxSprite((28 + (i*31)), ((FlxG.height/2) + 8 + (j*24)));
					tempsprite.loadGraphic(AdventureLibrary.ImgAwards, false, false, 16, 16);
					tempsprite.visible = false;
					tempsprite.frame = Counter;
					tempsprite.alpha = .25;
					AwardsGroup.add(tempsprite);
					Counter++;
				}
			}
			add(AwardsGroup);
			//create dummy rollover
			RolloverGroup = new FlxGroup();
			var ssprite:FlxSprite = new FlxSprite(1000,1000);
			ssprite.createGraphic(12,12, 0x80000000);
			RolloverGroup.add(ssprite);
			RolloverGroup.add(AdventureLibrary.DrawEnhancedFont(1000,1000,"0"));
			add(RolloverGroup);
		}
		
		private function ShowEarnedAwards():void{
			for(var i:uint = 1;i < (AwardsGroup.members.length + 1);i++){
				var tmpstring:String = AdventureLibrary.LoadAward(i);
				if(tmpstring == "true"){
					AwardsGroup.members[i - 1].alpha = 1;
				}
			}
		}
		
		private function initCredits():void{
			//set up credits screen
			CreditsGroup = new FlxGroup();
			var ax:uint = 22;
			var ay:uint = ((FlxG.height/2) + 4);
			CreditsGroup.add(AdventureLibrary.DrawEnhancedFont(ax, ay, "Art, Code, Design, Sound: "));
			CreditsGroup.add(AdventureLibrary.DrawEnhancedFont(ax, ay+8, "Joseph Stevens", "Right"));
			CreditsGroup.add(AdventureLibrary.DrawEnhancedFont(ax, ay+16, "Music: "));
			CreditsGroup.add(AdventureLibrary.DrawEnhancedFont(ax, ay+24, "Dustin Wyatt", "Right"));
			CreditsGroup.add(AdventureLibrary.DrawEnhancedFont(ax, ay+32, "Special Thanks: "));
			CreditsGroup.add(AdventureLibrary.DrawEnhancedFont(ax, ay+40, "Kelsey, Shannon Connolly", "Right"));
			CreditsGroup.add(AdventureLibrary.DrawEnhancedFont(ax, ay+48, "Warren Robinett", "Right"));
			CreditsGroup.add(AdventureLibrary.DrawEnhancedFont(ax, ay+56, "Tools: "));
			CreditsGroup.add(AdventureLibrary.DrawEnhancedFont(ax, ay+64, "Cosmigo Pro Motion", "Right"));
			CreditsGroup.add(AdventureLibrary.DrawEnhancedFont(ax, ay+72, "Flixel", "Right"));
			CreditsGroup.add(AdventureLibrary.DrawEnhancedFont(ax, ay+80, "sfxr", "Right"));
			CreditsGroup.add(AdventureLibrary.DrawEnhancedFont(ax, ay+88, "See you next game! :)", "Center"));
			add(CreditsGroup);
		}
		
		private function CheckCode():void{
			if(FlxG.keys.justPressed("UP") || FlxG.keys.justPressed("DOWN") || FlxG.keys.justPressed("LEFT") || FlxG.keys.justPressed("RIGHT") || FlxG.keys.justPressed("B") || FlxG.keys.justPressed("A")){
				switch(CodeNum){
					default:
						CodeNum = 0;
						break;
					case 0:
						if(FlxG.keys.justPressed("UP")){CodeNum++;}else{CodeNum=0;}
						break;
					case 1:
						if(FlxG.keys.justPressed("UP")){CodeNum++;}else{CodeNum=0;}
						break;
					case 2:
						if(FlxG.keys.justPressed("DOWN")){CodeNum++;}else{CodeNum=0;}
						break;
					case 3:
						if(FlxG.keys.justPressed("DOWN")){CodeNum++;}else{CodeNum=0;}
						break;
					case 4:
						if(FlxG.keys.justPressed("LEFT")){CodeNum++;}else{CodeNum=0;}
						break;
					case 5:
						if(FlxG.keys.justPressed("RIGHT")){CodeNum++;}else{CodeNum=0;}
						break;
					case 6:
						if(FlxG.keys.justPressed("LEFT")){CodeNum++;}else{CodeNum=0;}
						break;
					case 7:
						if(FlxG.keys.justPressed("RIGHT")){CodeNum++;}else{CodeNum=0;}
						break;
					case 8:
						if(FlxG.keys.justPressed("B")){CodeNum++;}else{CodeNum=0;}
						break;
					case 9:
						if(FlxG.keys.justPressed("A")){CodeNum++;}else{CodeNum=0;}
						break;
				}
				if(CodeNum	== 10){
					UnlockAllMaps();
					GiveAward(33);
					AwardsGroup.members[32].alpha	= 1;
//					AdventureLibrary.ClearAwards();
				}
			}
		}
		
		private function UnlockAllMaps():void{
			hideElements(GreyGroup);
		}
		
		private function initMenu():void{
			//set up menu screen
			//init groups
			MapSelected = 1;
			
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
					tempsprite.addAnimation("Cycle", [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31], 10, true);
					tempsprite.play("Cycle");
					MenuBG.add(tempsprite);
				}
			}
					
			//game buttons
			MenuButtonPlay 		= new FlxSprite();
			MenuButtonAwards 	= new FlxSprite();
			MenuButtonCredits 	= new FlxSprite();
			MenuButtonMoreGames = new FlxSprite();
			MenuGameSelectArea	= new FlxSprite();
			MenuFrame			= new FlxSprite;
			
			MenuButtonPlay.loadGraphic(AdventureLibrary.ImgMenuButtons, true, true, 56, 64);
			MenuButtonAwards.loadGraphic(AdventureLibrary.ImgMenuButtons, true, true, 56, 64);
			MenuButtonCredits.loadGraphic(AdventureLibrary.ImgMenuButtons, true, true, 56, 64);
			MenuButtonMoreGames.loadGraphic(AdventureLibrary.ImgMenuButtons, true, true, 56, 64);
			MenuGameSelectArea.createGraphic((320-32), (FlxG.height/2)-16, 0x80000000);
			MenuFrame.loadGraphic(AdventureLibrary.ImgFrame, true, true, 288, 104);
			
			MenuButtonPlay.frame		= 1;
			MenuButtonAwards.frame		= 2;
			MenuButtonCredits.frame		= 3;
			MenuButtonMoreGames.frame	= 6;
			
			MenuButtonPlay.x		= 16;
			MenuButtonPlay.y		= 32;
			MenuButtonAwards.x		= 16+61+16;
			MenuButtonAwards.y		= 32;
			MenuButtonCredits.x		= 16+61+61+32;
			MenuButtonCredits.y		= 32;
			MenuButtonMoreGames.x	= 16+61+61+61+48;
			MenuButtonMoreGames.y	= 32;
			
			MenuGameSelectArea.x	= 16;
			MenuGameSelectArea.y	= (FlxG.height/2);
			
			MenuFrame.x				= 16;
			MenuFrame.y				= (FlxG.height/2);
			
			//map selection buttons
			Map1Button = new FlxSprite();
			Map2Button = new FlxSprite();
			Map3Button = new FlxSprite();
			Map4Button = new FlxSprite();
			Map5Button = new FlxSprite();
			Map6Button = new FlxSprite();
			Map7Button = new FlxSprite();
			
			Map1Button.loadGraphic(AdventureLibrary.ImgMapButtons, true, true, 32, 32);
			Map2Button.loadGraphic(AdventureLibrary.ImgMapButtons, true, true, 32, 32);
			Map3Button.loadGraphic(AdventureLibrary.ImgMapButtons, true, true, 32, 32);
			Map4Button.loadGraphic(AdventureLibrary.ImgMapButtons, true, true, 32, 32);
			Map5Button.loadGraphic(AdventureLibrary.ImgMapButtons, true, true, 32, 32);
			Map6Button.loadGraphic(AdventureLibrary.ImgMapButtons, true, true, 32, 32);
			Map7Button.loadGraphic(AdventureLibrary.ImgMapButtons, true, true, 32, 32);
			
			Map1Button.frame	= 1;
			Map2Button.frame	= 2;
			Map3Button.frame	= 3;
			Map4Button.frame	= 4;
			Map5Button.frame	= 5;
			Map6Button.frame	= 6;
			Map7Button.frame	= 7;
			
			Map1Button.x	= (FlxG.width/2) - 116;
			Map1Button.y	= (FlxG.height/2)+10+7;
			Map2Button.x	= Map1Button.x + 50;
			Map2Button.y	= Map1Button.y;
			
			Map3Button.x	= Map1Button.x;
			Map3Button.y	= Map2Button.y+34+10;
			Map4Button.x	= Map3Button.x + 50;
			Map4Button.y	= Map3Button.y;
			Map5Button.x	= Map4Button.x + 50;
			Map5Button.y	= Map4Button.y;
			Map6Button.x	= Map5Button.x + 50;
			Map6Button.y	= Map5Button.y;
			Map7Button.x	= Map6Button.x + 50;
			Map7Button.y	= Map6Button.y;
			
			//overlay
			MapSelectionOverlay	= new FlxSprite();
			MapSelectionOverlay.createGraphic(32, 32, 0x80FFFFFF);
			MapSelectionOverlay.x = Map1Button.x;
			MapSelectionOverlay.y = Map1Button.y;
			
			//add elements to groups
			MenuBG.add(MenuButtonPlay);
			MenuBG.add(MenuButtonAwards);
			MenuBG.add(MenuButtonCredits);
			MenuBG.add(MenuButtonMoreGames);
			MenuBG.add(MenuGameSelectArea);
			MenuBG.add(MenuFrame);
			
			//map buttons
			MenuButtons.add(AdventureLibrary.DrawClassicFont(24, (FlxG.height/2)+7, "classic maps"));
			MenuButtons.add(AdventureLibrary.DrawEnhancedFont(24, Map2Button.y+34, "extended maps"));
			MenuButtons.add(Map1Button);
			MenuButtons.add(Map2Button);
			MenuButtons.add(Map3Button);
			MenuButtons.add(Map4Button);
			MenuButtons.add(Map5Button);
			MenuButtons.add(Map6Button);
			MenuButtons.add(Map7Button);
			MenuButtons.add(MapSelectionOverlay);
			
			//add groups
			add(MenuBG);
			add(MenuButtons);
		}
		
		private function GreyOut():void{
			//grey out maps you can't play yet
			GreyGroup = new FlxGroup();
			if(AdventureLibrary.LoadAward(33) == "false"){			
				//Cover up places you dont like
				if(AdventureLibrary.LoadData("MapCompleted1") != "Completed"){
					GreyGroup.add(DummyButton(Map2Button));
					GreyGroup.add(DummyButton(Map3Button));
				}
				if(AdventureLibrary.LoadData("MapCompleted3") != "Completed"){
					GreyGroup.add(DummyButton(Map4Button));
				}
				if(AdventureLibrary.LoadData("MapCompleted4") != "Completed"){
					GreyGroup.add(DummyButton(Map5Button));
				}
				if(AdventureLibrary.LoadData("MapCompleted5") != "Completed"){
					GreyGroup.add(DummyButton(Map6Button));
				}
				if(AdventureLibrary.LoadData("MapCompleted6") != "Completed"){
					GreyGroup.add(DummyButton(Map7Button));
				}
			}
			
			add(GreyGroup);		
		}
		
		private function DummyButton(B:FlxSprite):FlxSprite{
			var GBlock:FlxSprite = new FlxSprite();
			GBlock.makeGraphic(32, 32, 0x80000000);
			GBlock.x	= B.x;
			GBlock.y	= B.y;
			return GBlock;
		}
		
		private function CheckPlayMenu():void{
		//check for play menu
			if(AdventureLibrary.ClickOnSprite(MenuButtonPlay)){
				//play Selected Map						
				switch(MapSelected){
					case 1:
						FlxG.state = new Map1();
						break;
					case 2:
						if(AdventureLibrary.LoadData("MapCompleted1") == "Completed" || AdventureLibrary.LoadAward(33) == "true"){
							FlxG.state = new Map2();
						}
						break;
					case 3:
						if(AdventureLibrary.LoadData("MapCompleted1") == "Completed" || AdventureLibrary.LoadAward(33) == "true"){
							FlxG.state = new Map3();
						}
						break;
					case 4:
						if(AdventureLibrary.LoadData("MapCompleted3") == "Completed" || AdventureLibrary.LoadAward(33) == "true"){
							FlxG.state = new Map4();
						}
						break;
					case 5:
						if(AdventureLibrary.LoadData("MapCompleted4") == "Completed" || AdventureLibrary.LoadAward(33) == "true"){
							FlxG.state = new Map5();
						}
						break;
					case 6:
						if(AdventureLibrary.LoadData("MapCompleted5") == "Completed" || AdventureLibrary.LoadAward(33) == "true"){
							FlxG.state = new Map6();
						}
						break;
					case 7:
						if(AdventureLibrary.LoadData("MapCompleted6") == "Completed" || AdventureLibrary.LoadAward(33) == "true"){
							FlxG.state = new Map7();
						}
						break;
				}
			}
		
			//Map 1
			if(AdventureLibrary.ClickOnSprite(Map1Button)){
				//select map
				MapSelectionOverlay.x = Map1Button.x;
				MapSelectionOverlay.y = Map1Button.y;
				MapSelected = 1;
				FlxG.play(AdventureLibrary.PlayerGetItemSF);
			}					
			//Map 2
			if(AdventureLibrary.ClickOnSprite(Map2Button) && ((AdventureLibrary.LoadData("MapCompleted1") == "Completed") || (AdventureLibrary.LoadAward(33) == "true"))){
				//select map
				MapSelectionOverlay.x = Map2Button.x;
				MapSelectionOverlay.y = Map2Button.y;
				MapSelected = 2;
				FlxG.play(AdventureLibrary.PlayerGetItemSF);
			}					
			//Map 3
			if(AdventureLibrary.ClickOnSprite(Map3Button) && ((AdventureLibrary.LoadData("MapCompleted1") == "Completed") || (AdventureLibrary.LoadAward(33) == "true"))){
				//select map
				MapSelectionOverlay.x = Map3Button.x;
				MapSelectionOverlay.y = Map3Button.y;
				MapSelected = 3;
				FlxG.play(AdventureLibrary.PlayerGetItemSF);
			}					
			//Map 4
			if(AdventureLibrary.ClickOnSprite(Map4Button) && ((AdventureLibrary.LoadData("MapCompleted3") == "Completed") || (AdventureLibrary.LoadAward(33) == "true"))){
				//select map
				MapSelectionOverlay.x = Map4Button.x;
				MapSelectionOverlay.y = Map4Button.y;
				MapSelected = 4;
				FlxG.play(AdventureLibrary.PlayerGetItemSF);
			}					
			//Map 5
			if(AdventureLibrary.ClickOnSprite(Map5Button) && ((AdventureLibrary.LoadData("MapCompleted4") == "Completed") || (AdventureLibrary.LoadAward(33) == "true"))){
				//select map
				MapSelectionOverlay.x = Map5Button.x;
				MapSelectionOverlay.y = Map5Button.y;
				MapSelected = 5;
				FlxG.play(AdventureLibrary.PlayerGetItemSF);
			}					
			//Map 6
			if(AdventureLibrary.ClickOnSprite(Map6Button) && ((AdventureLibrary.LoadData("MapCompleted5") == "Completed") || (AdventureLibrary.LoadAward(33) == "true"))){
				//select map
				MapSelectionOverlay.x = Map6Button.x;
				MapSelectionOverlay.y = Map6Button.y;
				MapSelected = 6;
				FlxG.play(AdventureLibrary.PlayerGetItemSF);
			}					
			//Map 7
			if(AdventureLibrary.ClickOnSprite(Map7Button) && ((AdventureLibrary.LoadData("MapCompleted6") == "Completed") || (AdventureLibrary.LoadAward(33) == "true"))){
				//select map
				MapSelectionOverlay.x = Map7Button.x;
				MapSelectionOverlay.y = Map7Button.y;
				MapSelected = 7;
				FlxG.play(AdventureLibrary.PlayerGetItemSF);
			}
		}
	}
}
