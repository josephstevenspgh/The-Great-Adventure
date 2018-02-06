package{
	import org.flixel.*;
	import AdventureLibrary;
 
	public class AdventureMap extends FlxState{
		//each map will embed its own data
		
		//graphics
		[Embed(source="Images/DarkCave.png")] 		protected var ImgDarkCave:Class;
		[Embed(source="Images/LightSnow.png")] 		protected var ImgLightSnow:Class;
		[Embed(source="Images/DarkSnow.png")] 		protected var ImgDarkSnow:Class;
		[Embed(source="Images/DarkSnowLight.png")] 		protected var ImgDarkSnowLight:Class;

		//create Variables
		protected var GameNumber:uint;
		public var CurrentMapX:uint;
		public var CurrentMapY:uint;
		public var GrailFound:Boolean = false;
		protected var GameTimer:Number;
		
		//achievement variables
		protected var AwardGroup:FlxGroup;
		protected var AwardTimer:uint;
		protected var NOTYET:Boolean	= true;

		//weather/screen effects
		protected var DarkCave:FlxSprite;
		protected var DarkCaveLeft:FlxSprite;
		protected var DarkCaveRight:FlxSprite;
		protected var DarkCaveUp:FlxSprite;
		protected var DarkCaveDown:FlxSprite;
		protected var InCave:Boolean;
		protected var LightSnow:FlxGroup;
		protected var InLightSnow:Boolean;
		protected var Blizzard:FlxGroup;
		protected var DarkSnow:FlxSprite;
		protected var DarkSnowLeft:FlxSprite;
		protected var DarkSnowRight:FlxSprite;
		protected var DarkSnowUp:FlxSprite;
		protected var DarkSnowDown:FlxSprite;
		protected var InBlizz:Boolean;
		
		//block movement sprite/groups
		protected var bUp:FlxSprite;
		protected var bDown:FlxSprite;
		protected var bLeft:FlxSprite;
		protected var bRight:FlxSprite;

		//create entities
		protected var 	Player:Dot;
		public var 	sword:Sword;
		public var 	gkey:GoldKey;
		protected var 	ggate:GoldGate;
		public var 	bkey:BlackKey;
		protected var 	bgate:BlackGate;
		public var 	wkey:WhiteKey;
		protected var 	wgate:WhiteGate;
		public var 	bridge:Bridge;
		public var 	grail:Grail;
		public var 	magnet:Magnet;
		private var	SwordGrabbed:Boolean	= false;
		private var	BridgeGrabbed:Boolean	= false;
		private var	GrailGrabbed:Boolean	= false;
		private var	MagnetGrabbed:Boolean	= false;
		private var	GKeyGrabbed:Boolean	= false;
		private var	BKeyGrabbed:Boolean	= false;
		private var	WKeyGrabbed:Boolean	= false;
		
		//enemies
		public var GDragon:GreenDragon;
		public var YDragon:YellowDragon;
		public var RDragon:RedDragon;
		protected var GDragonC:FlxSprite;
		protected var YDragonC:FlxSprite;
		protected var RDragonC:FlxSprite;
		
		//invisible bridge barriers
		protected var bridgeleft:FlxSprite;
		protected var bridgeright:FlxSprite
		
		//create groups
		protected var ItemGroup:FlxGroup;
		protected var GateGroup:FlxGroup;
		protected var WallGroup:FlxGroup;
		protected var PlayerGroup:FlxGroup;
		protected var DragonGroup:FlxGroup;
		protected var DragonCollisionGroup:FlxGroup;
		protected var FloorGroup:FlxGroup;
		protected var BridgeGroup:FlxGroup;
		protected var WeatherGroup:FlxGroup;

		//create maps		
		protected var CurrentMap_Floor:FlxTilemap;
		protected var CurrentMap_Walls:FlxTilemap;
		public var MapList:Array;
		protected var GoalMapX:uint;
		protected var GoalMapY:uint;
		
		//text output, temporary?
		protected var OutputText:FlxText;
		
		//awards
		protected var TotalTimeSpent:Number;
		protected var AwardList:Array;
		protected var Pacifist:Boolean			= true;
		protected var FirstSetKilled:Boolean	= false;
		protected var Minimalist:Boolean		= true;

		//this handles initializing everything
		protected function InitializeMap(StartMapX:Number, StartMapY:Number):void{	
			//Mark map as played
			AdventureLibrary.SaveData("PlayedMap"+GameNumber, "true");
			
			//initialize awards
			AwardList = AdventureLibrary.InitAwards();
			//load total time spent in game
			TotalTimeSpent = (Number)(AdventureLibrary.LoadData("TotalTimeSpent"));
			//setup awards
			var FlashSprite:FlxSprite = new FlxSprite(152, 8);
			FlashSprite.createGraphic(16, 16, 0xBBFFFFFF);
			FlashSprite.alpha = 0;
			AwardGroup = new FlxGroup();
			AwardGroup.add(new AwardSprite());
			AwardGroup.add(FlashSprite);
			
			//setup the state
			FlxState.bgColor = 0xFF888888;
			
			//reset DeathCounter
			GameTimer = 0;

			//set up entities
			Player 		= new Dot(GameNumber, (FlxG.width/2),(FlxG.height-50));
			gkey 		= new GoldKey(50,120,0,0);
			ggate 		= new GoldGate(144,144);
			bkey 		= new BlackKey(64,150,0,0);
			bgate 		= new BlackGate(144,144);
			wkey		= new WhiteKey(85,110,0,0);
			wgate		= new WhiteGate(144,144);
			sword 		= new Sword(50,180,0,0);
			grail 		= new Grail((FlxG.width/2),(FlxG.height/2),0,0);
			bridge 		= new Bridge(((FlxG.width/2)-(32)),(FlxG.height/2),0,0);
			magnet		= new Magnet(100,100,0,0);
			
			//Weather/Screen effects
			//dark cave
			DarkCave 		= new FlxSprite(1000,1000);
			DarkCaveLeft	= new FlxSprite(1000,0);
			DarkCaveRight	= new FlxSprite(1000,0);
			DarkCaveUp		= new FlxSprite(0,1000);
			DarkCaveDown	= new FlxSprite(0,1000);
			
			DarkCaveLeft.createGraphic(320,240,0xFF000000);
			DarkCaveRight.createGraphic(320,240,0xFF000000);
			DarkCaveUp.createGraphic(320,240,0xFF000000);
			DarkCaveDown.createGraphic(320,240,0xFF000000);
			
			DarkCave.loadGraphic(ImgDarkCave,true,true,96,96);
			DarkCave.addAnimation("InOut_DarkCave", [0,1,2,3,4,5,6,7,6,5,4,3,2,1], 10, true);
			DarkCave.play("InOut_DarkCave");
			
			//snow
			LightSnow 		= new FlxGroup();			
			DarkSnow 		= new FlxSprite(1000,1000);
			DarkSnowLeft	= new FlxSprite(1000,0);
			DarkSnowRight	= new FlxSprite(1000,0);
			DarkSnowUp		= new FlxSprite(0,1000);
			DarkSnowDown	= new FlxSprite(0,1000);
			
			DarkSnowLeft.createGraphic(320,240,0xFFEDF3FF);
			DarkSnowRight.createGraphic(320,240,0xFFEDF3FF);
			DarkSnowUp.createGraphic(320,240,0xFFEDF3FF);
			DarkSnowDown.createGraphic(320,240,0xFFEDF3FF);
			
			DarkSnow.loadGraphic(ImgDarkSnowLight,true,true,96,96);
			DarkSnow.addAnimation("InOut_Blizzard", [0,1,2,3,4,5,6,7,6,5,4,3,2,1], 5, true);
			DarkSnow.play("InOut_Blizzard");
			
			InitSnow();
			InitBlizzard();
			StopSnow();
			StopBlizzard();
			
			//enemies
			GDragon			= new GreenDragon(Player, 40, 50);
			YDragon 		= new YellowDragon(Player, 50, 111);
			RDragon 		= new RedDragon(Player, 260, 75);
			GDragonC		= new FlxSprite(10,10);
			YDragonC		= new FlxSprite(10,10);
			RDragonC		= new FlxSprite(10,10);
			GDragonC.width	= 12;
			GDragonC.height	= 34;
			GDragonC.fixed 	= true;
			YDragonC.width	= 12;
			YDragonC.height	= 34;
			YDragonC.fixed 	= true;
			RDragonC.width	= 12;
			RDragonC.height	= 34;
			RDragonC.fixed 	= true;

			//bridge barriers
			bridgeleft 			= new FlxSprite(0,0);
			bridgeright 		= new FlxSprite(0,0);
			bridgeleft.width 	= 16;
			bridgeleft.height 	= 64;
			bridgeright.width 	= 16;
			bridgeright.height 	= 64;
			bridgeleft.fixed	= true;
			bridgeright.fixed	= true;
			
			//Load Map
			CurrentMapX = StartMapX;
			CurrentMapY = StartMapY;
			CurrentMap_Floor = new FlxTilemap();
			CurrentMap_Walls = new FlxTilemap();

			
			//set up groups
			GateGroup 				= new FlxGroup();
			ItemGroup 				= new FlxGroup();
			PlayerGroup 			= new FlxGroup();
			FloorGroup 				= new FlxGroup();
			WallGroup 				= new FlxGroup();
			BridgeGroup				= new FlxGroup();
			DragonGroup 			= new FlxGroup();
			DragonCollisionGroup	= new FlxGroup();
			WeatherGroup			= new FlxGroup();

			//set up blocking areas
			InitBlocking();

			//Item Group Members
			ItemGroup.add(bridge);
			ItemGroup.add(sword);
			ItemGroup.add(gkey);	
			ItemGroup.add(bkey);	
			ItemGroup.add(wkey);	
			ItemGroup.add(grail);	
			ItemGroup.add(magnet);		
			
			//Gate Group members
			GateGroup.add(ggate);			
			GateGroup.add(bgate);			
			GateGroup.add(wgate);
			
			//Player Group
			PlayerGroup.add(Player);
			
			//enemy groups
			DragonGroup.add(GDragon);
			DragonGroup.add(YDragon);
			DragonGroup.add(RDragon);
			
			//Boundary Groups
			FloorGroup.add(CurrentMap_Floor);			
			WallGroup.add(CurrentMap_Walls);
			BridgeGroup.add(bridgeleft);
			BridgeGroup.add(bridgeright);
			DragonCollisionGroup.add(GDragonC);
			DragonCollisionGroup.add(YDragonC);
			DragonCollisionGroup.add(RDragonC);

			//Weather/effect group
			WeatherGroup.add(DarkCave);
			WeatherGroup.add(DarkCaveLeft);
			WeatherGroup.add(DarkCaveRight);
			WeatherGroup.add(DarkCaveUp);
			WeatherGroup.add(DarkCaveDown);
			WeatherGroup.add(DarkSnow);
			WeatherGroup.add(DarkSnowLeft);
			WeatherGroup.add(DarkSnowRight);
			WeatherGroup.add(DarkSnowUp);
			WeatherGroup.add(DarkSnowDown);

			//add groups		
			add(DragonCollisionGroup);	
			add(BridgeGroup);
			add(FloorGroup);
			add(GateGroup);
			add(WallGroup);
			add(ItemGroup);
			add(PlayerGroup);
			add(DragonGroup);
			add(LightSnow);
			add(Blizzard);
			add(WeatherGroup);
			add(AwardGroup);

			//play music
			FlxG.playMusic(AdventureLibrary.GameMusic);
		}	
		
		private function CheckAwards():void{
			//Check for Chomp
			if(GDragon.MissedAChomp || YDragon.MissedAChomp || RDragon.MissedAChomp){
				GiveAward(30);
			}
			//Hoarder
			if(SwordGrabbed && BridgeGrabbed && GrailGrabbed && MagnetGrabbed && GKeyGrabbed && BKeyGrabbed && WKeyGrabbed){
				GiveAward(27);
			}
			
			//check for time-related awards
			if(TotalTimeSpent >= (600)){
				//ten minutes
				GiveAward(1);
			}
			if(TotalTimeSpent >= (1800)){
				//30 minutes
				GiveAward(2);
			}
			if(TotalTimeSpent >= (3600)){
				//one hour
				GiveAward(3);
			}
			if(TotalTimeSpent >= (7200)){
				//two hours
				GiveAward(4);
			}
			
			//Check to see if you've played every map
			if(AdventureLibrary.LoadData("PlayedMap1") == "true" && 
				AdventureLibrary.LoadData("PlayedMap2") == "true" && 			
				AdventureLibrary.LoadData("PlayedMap3") == "true" && 			
				AdventureLibrary.LoadData("PlayedMap4") == "true" && 			
				AdventureLibrary.LoadData("PlayedMap5") == "true" && 			
				AdventureLibrary.LoadData("PlayedMap6") == "true" &&
				AdventureLibrary.LoadData("PlayedMap7") == "true"){
				
				GiveAward(32);
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
			//Hoarder Check
			//Also, minimalist
			var ItemName:String = "";
			if(Player.CurrentItem != null){
				ItemName	= Player.CurrentItem.GetName();
			}
			switch(ItemName){
				default:
					break;
				case "Sword":
					SwordGrabbed	= true;
					Minimalist		= false;
					break;
				case "Bridge":
					BridgeGrabbed	= true;
					Minimalist		= false;
					break;
				case "Grail":
					GrailGrabbed	= true;
					break;
				case "Magnet":
					MagnetGrabbed	= true;
					Minimalist		= false;
					break;
				case "GoldKey":
					GKeyGrabbed	= true;
					break;
				case "BlackKey":
					BKeyGrabbed	= true;
					break;
				case "WhiteKey":
					WKeyGrabbed	= true;
					break;
			}
			
			//Pacifism Check
			if(!GDragon.Alive || !YDragon.Alive || !RDragon.Alive){
				//Dragon Kill Checks
				var AnyAlive:Boolean	= false;
				if(!GDragon.Alive){
					GiveAward(17);
				}else{
					AnyAlive	= true;
				}
				if(!YDragon.Alive){
					GiveAward(18);
				}else{
					AnyAlive	= true;
				}
				if(!RDragon.Alive){
					GiveAward(19);
				}else{
					AnyAlive	= true;
				}
				if(AdventureLibrary.LoadData("DragonsKilled") >= 25){
					GiveAward(20);
				}
				Pacifist = false;
				
				if(AnyAlive	== false){
					if(GrailFound){
						GiveAward(25);
					}else{
						FirstSetKilled	= true;
					}
				}
			}
			
			if(GameNumber == 1){
				DoTut();
			}
			//Increase Timers
			var IncTime:Number = FlxG.elapsed;
			GameTimer 		+= IncTime;
			TotalTimeSpent 	+= IncTime;
			
			//check for any awards the player might have just gotten
			CheckAwards();
			
			//check for player death
			if(Player.Alive == false){
				//save new total time
				TotalTimeSpent = TotalTimeSpent + GameTimer;
				AdventureLibrary.SaveData("TotalTimeSpent", TotalTimeSpent);
				//set to losestate
				FlxG.state = new LoseState(GameNumber);
			}

			//check to play different music if you found the grail
			if(!GrailFound){
				if(Player.CurrentItem == grail){
					//start the second half
					GrailGrabbed = true;
					FlxG.music.stop();
					FlxG.playMusic(AdventureLibrary.PinchMusic);
					GrailFound = true;
					//revive the dragons
					GDragon.Alive = true;
					YDragon.Alive = true;
					RDragon.Alive = true;
					GDragon.play("Walk");
					YDragon.play("Walk");
					RDragon.play("Walk");
				}
			}
						
			//move around dragon collision boxes
			GDragonC.x	= GDragon.x + 10;
			GDragonC.y	= GDragon.y + 10;
			YDragonC.x	= YDragon.x + 10;
			YDragonC.y	= YDragon.y + 10;
			RDragonC.x	= RDragon.x + 10;
			RDragonC.y	= RDragon.y + 10;
			
			//items
			AdventureLibrary.GiveItemToPlayer(Player, sword);
			AdventureLibrary.GiveItemToPlayer(Player, gkey);
			AdventureLibrary.GiveItemToPlayer(Player, bkey);
			AdventureLibrary.GiveItemToPlayer(Player, wkey);
			AdventureLibrary.GiveItemToPlayer(Player, magnet);
			AdventureLibrary.GiveItemToPlayer(Player, grail);
			
			//special bridge code
			AdventureLibrary.BridgeBehavior(Player, bridge, bridgeleft, bridgeright);
			
			//dragon death check
			if(GDragon.overlaps(sword) && GDragon.Alive && !GDragon.Biting && Player.Alive){
				GDragon.die();
			}
			if(YDragon.overlaps(sword) && YDragon.Alive && !YDragon.Biting && Player.Alive){
				YDragon.die();
			}
			if(RDragon.overlaps(sword) && RDragon.Alive){
				RDragon.die();
			}
			
			//magnet
			AdventureLibrary.MagnetPull(CurrentMapX, CurrentMapY, magnet, sword);
			AdventureLibrary.MagnetPull(CurrentMapX, CurrentMapY, magnet, gkey);
			AdventureLibrary.MagnetPull(CurrentMapX, CurrentMapY, magnet, bkey);
			AdventureLibrary.MagnetPull(CurrentMapX, CurrentMapY, magnet, wkey);
			AdventureLibrary.MagnetPull(CurrentMapX, CurrentMapY, magnet, bridge);
			AdventureLibrary.MagnetPull(CurrentMapX, CurrentMapY, magnet, grail);
			
			
			//gate opening
			if(AdventureLibrary.GateMechanics(Player, gkey, ggate)){FlxG.play(AdventureLibrary.GateOpenSF);};
			if(AdventureLibrary.GateMechanics(Player, wkey, wgate)){FlxG.play(AdventureLibrary.GateOpenSF);};
			if(AdventureLibrary.GateMechanics(Player, bkey, bgate)){FlxG.play(AdventureLibrary.GateOpenSF);};
			
			//handle screen changing
			if(Player.x < (-4) ){
				MoveLeft();
			}
			if(Player.x > (FlxG.width-4)){
				MoveRight();
			}
			if(Player.y < (-4)){
				MoveUp();
			}
			if(Player.y > (FlxG.height-4)){
				MoveDown();
			}
			
			
			//dark cave effects
			if(InCave){
				DarkCave.x 		= Player.x-48;
				DarkCave.y 		= Player.y-48;
				DarkCaveLeft.x	= (DarkCave.x - 320);
				DarkCaveRight.x	= (DarkCave.x + 96);
				DarkCaveUp.y	= (DarkCave.y - 240);
				DarkCaveDown.y	= (DarkCave.y + 96);
			}else if(DarkCave.x != 1000){
				DarkCave.x 		= 1000;
				DarkCaveLeft.x 	= 1000;
				DarkCaveRight.x = 1000;
				DarkCaveUp.y 	= 1000;
				DarkCaveDown.y 	= 1000;
			}
			
			//dark snow effect			
			if(InBlizz){
				DarkSnow.x 		= Player.x-48;
				DarkSnow.y 		= Player.y-48;
				DarkSnowLeft.x	= (DarkSnow.x - 320);
				DarkSnowRight.x	= (DarkSnow.x + 96);
				DarkSnowUp.y	= (DarkSnow.y - 240);
				DarkSnowDown.y	= (DarkSnow.y + 96);
			}else if(DarkSnow.x != 1000){
				DarkSnow.x 		= 1000;
				DarkSnowLeft.x 	= 1000;
				DarkSnowRight.x = 1000;
				DarkSnowUp.y 	= 1000;
				DarkSnowDown.y 	= 1000;
			}
			
			super.update();		
			//collision
			AdventureLibrary.Collision(Player, WallGroup, BridgeGroup, DragonCollisionGroup, GateGroup, bridge);
		}

		public function InitSnow():void{
			//set up the lightsnow group
			LightSnow = new FlxGroup();
			var i:int;
			var j:int;
			var tempsprite:FlxSprite;
			for(i = 0; i < 5; i++){
				for(j = 0;j < 4; j++){
					tempsprite = new FlxSprite((i*64),(j*64));
					tempsprite.loadGraphic(ImgLightSnow,true,true,64,64);
					tempsprite.addAnimation("Falling", [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31], 20, true);
					tempsprite.play("Falling");
					LightSnow.add(tempsprite);
				}
			}
			add(LightSnow);
		}
		
		public function StartSnowing():void{
			//light snow effect
			InLightSnow = true;
			var i:int;
			var j:int;
			var counter:int = 0;
			for(i = 0; i < 5; i++){
				for(j = 0; j < 4; j++){
					LightSnow.members[counter].x = i*64;
					counter++;
				}
			}
		}
		
		public function StopSnow():void{
			//move all the snow offscreen
			var i:int;
			var j:int;
			var counter:int = 0;
			for(i = 0; i < 5; i++){
				for(j = 0; j < 4; j++){
					LightSnow.members[counter].x = 320;
					counter++;
				}
			}
			InLightSnow = false;
		}
		
		public function InitBlizzard():void{
			Blizzard = new FlxGroup();
			InBlizz = true;
			var i:int;
			var j:int;
			var tempsprite:FlxSprite;
			for(i = 0; i < 5; i++){
				for(j = 0;j < 4; j++){
					tempsprite = new FlxSprite((i*64),(j*64));
					tempsprite.loadGraphic(ImgDarkSnow,true,true,64,64);
					tempsprite.addAnimation("Falling", [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31], 40, true);
					tempsprite.play("Falling");
					Blizzard.add(tempsprite);
				}
			}
			add(Blizzard);
		}
		
		public function StartBlizzard():void{
			//blizzard effect
			var i:int;
			var j:int;
			var counter:int = 0;
			for(i = 0; i < 5; i++){
				for(j = 0; j < 4; j++){
					Blizzard.members[counter].x = i*64;
					counter++;
				}
			}		
			InBlizz = true;
			StartSnowing();
		}
		
		public function StopBlizzard():void{
			//move all the snow offscreen
			var i:int;
			var j:int;
			var counter:int = 0;
			for(i = 0; i < 5; i++){
				for(j = 0; j < 4; j++){
					Blizzard.members[counter].x = 320;
					counter++;
				}
			}
			InBlizz = false;
		}
		
		//initializes the blocking areas
		public function InitBlocking():void{
			bUp			= new FlxSprite();
			bDown		= new FlxSprite();
			bLeft		= new FlxSprite();
			bRight		= new FlxSprite();
			
			//now set up their properties
			bUp.x			= 0;
			bUp.y			= -28;
			bUp.createGraphic(320,32);
			bUp.fixed		= true;
			
			bDown.x			= 0;
			bDown.y			= 236;
			bDown.createGraphic(320,32);
			bDown.fixed		= true;
			
			bLeft.x			= -32;
			bLeft.y			= 0;
			bLeft.createGraphic(32,240);
			bLeft.fixed		= true;
			
			bRight.x		= 320;
			bRight.y		= 0;
			bRight.createGraphic(32,240);
			bRight.fixed	= true;
			
			//add to groups
			BridgeGroup.add(bUp);
			BridgeGroup.add(bDown);
			BridgeGroup.add(bLeft);
			BridgeGroup.add(bRight);
		}				

		//this function checks to see if you won the game
		public function GameWin():void{
			if((grail.roomIDX == GoalMapX) && (grail.roomIDY == GoalMapY)){
				//save new total time
				TotalTimeSpent = TotalTimeSpent + GameTimer;
				AdventureLibrary.SaveData("TotalTimeSpent", TotalTimeSpent);
				//start the winstate
				FlxG.state = new WinState(GameNumber, GameTimer, Pacifist, Minimalist);
			}
		}


		//these handle moving screens, and mazes
		public function MapExists(NewMapX:uint, NewMapY:uint):Boolean{ return false;}
		public function MoveLeft():void{}		
		public function MoveRight():void{}		
		public function MoveUp():void{}		
		public function MoveDown():void{}
		
		
		//this function handles loading the correct map and displaying the correct everything
		public function LoadMap():void{}
		
		//Tutorial for map 1
		public function DoTut():void{}


		
		
	}
}
