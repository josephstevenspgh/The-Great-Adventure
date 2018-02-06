package{

	import org.flixel.*;
	
	public class AdventureLibrary{
		//Saving
		private static var save:FlxSave = new FlxSave();
	
		//Music
		[Embed(source="Sound/Menu.mp3")] 						public static var TitleMusic:Class;
		[Embed(source="Sound/Main Theme.mp3")] 			public static var GameMusic:Class;
		[Embed(source="Sound/Pinch.mp3")] 					public static var PinchMusic:Class;
		
		//Sound Effects
		[Embed(source="Sound/GateOpen.mp3")] 				public static var GateOpenSF:Class;
		[Embed(source="Sound/PlayerGetItem.mp3")]		public static var PlayerGetItemSF:Class;
		[Embed(source="Sound/PlayerDropItem.mp3")]	public static var PlayerDropItemSF:Class;
		[Embed(source="Sound/DragonEat.mp3")]				public static var DragonEatSF:Class;
		[Embed(source="Sound/DragonDie.mp3")] 			public static var DragonDieSF:Class;
		[Embed(source="Sound/DragonChomp.mp3")] 		public static var DragonChompSF:Class;
		
		//Fonts
		[Embed(source="Images/ClassicFont.png")] 		public static var ImgClassicFont:Class;
		[Embed(source="Images/EnhancedFont.png")] 	public static var ImgEnhancedFont:Class;
		[Embed(source="Images/BigFont.png")] 				public static var ImgBigFont:Class;
		
		//Graphics
		[Embed(source="Images/Awards.png")] 				public static var ImgAwards:Class;
		[Embed(source="Images/MenuButtons.png")] 		public static var ImgMenuButtons:Class;
		[Embed(source="Images/SelectionFrame.png")] public static var ImgFrame:Class;
		[Embed(source="Images/Title.png")] 					public static var ImgBG:Class;
		[Embed(source="Images/MenuBG.png")] 				public static var ImgMenuBG:Class;
		[Embed(source="Images/MapButtons.png")] 		public static var ImgMapButtons:Class;
		[Embed(source="Images/tweet.png")]					public static var ImgTweetButton:Class;
		
		
		
		
		//awards
		public static var AwardsText:Array = new Array(
				"Time Waster I",		//	Spend 30 minutes in-game							Implemented
				"Time Waster II", 		//	SPend 1 hour in-game								Implemented
				"Time Waster III",		//	SPend 2 Hours in-game								Implemented
				"Time Waster IV",		//	Spend 4 Hours in-game								Implemented
				"Completionist I",		//	Get 5 Awards										Implemented
				"Completionist II",		//	Get 10 Awards										Implemented
				"Completionist III",	//	Get 15 Awards										Implemented
				"Completionist IV",		//	Get 20 Awards										Implemented
				"Death I",				//	Get eaten by a Green Dragon							Implemented
				"Death II",				//	Get eaten by a Yellow Dragon						Implemented
				"Death III",			//	Get eaten by a red dragon							Implemented
				"Death IV",				//	Die 25 Times										Implemented
				"Maps Completed I",		//	Completed Map 1										Implemented
				"Maps Completed II",	//	Completed Map 3										Implemented
				"Maps Completed III",	//	Completed Map 5										Implemented
				"Maps Completed IV",	//	Completed Map 7										Implemented
				"Warrior I",			//	Killed a Green Dragon								Implemented
				"Warrior II",			//	Killed a Yellow Dragon								Implemented
				"Warrior III",			//	Killed a Red Dragon									Implemented
				"Warrior IV",			//	Killed 50 Dragons									Implemented
				"Speedrunner I",		//	Complete Level 1 in 60 seconds						Implemented
				"Speedrunner II",		//	Complete Level 3 in 90 seconds						Implemented
				"Speedrunner III",		//	Complete Level 5 in 210 seconds						Implemented
				"Speedrunner IV",		//	Complete Level 7 in 90 seconds						Implemented
				"Murderer",				//	Kill 6 dragons on the same level					Implemented
				"Pacifist",				//	Beat a map without killing anything					Implemented
				"Item Hoarder",			//	Grabbed Every Item									IMplemented
				"Minamalist",			//	Beat a map touching only the keys and the grail		Implemented	
				"Completionist",		//	Beat Every Map										Implemented
				"Still Alive",			//	Escape a dragon's Jaws								Implemented
				"Awards",				//	Got 30 Awards										Implemented
				"Gotta try them all!",	//	Played Every Map									Implemented
				"Oldie",				//	Konami Code											Implemented
				"Curious",				//	Viewed the credits									Implemented
				"Gamer",				//	Clicked a Sponsor Logo								Implemented
				"Adventure Master");	//	Collected Every Award								Implemented
										//														36/36 done		-- NEEDS TESTING
		//constructor
		public function AdventureLibrary(){}
		
		//getting awards
		
		//draw something using the Classic Font
		static public function DrawClassicFont(X:Number, Y:Number, Content:String, Alignment:String="None"):FlxGroup{
			//return the group
			return PixelFont.DrawFont(ImgClassicFont, X, Y, Content, Alignment);
		}
		
		//draw something using the Classic Font
		static public function DrawEnhancedFont(X:Number, Y:Number, Content:String, Alignment:String="None"):FlxGroup{
			//return the group
			return PixelFont.DrawFont(ImgEnhancedFont, X, Y, Content, Alignment);
		}
		
		//draw something using the big font
		static public function DrawBigFont(X:Number, Y:Number, Content:String, Alignment:String="None"):FlxGroup{
			//return the group
			return PixelFont.DrawFont(ImgBigFont, X, Y, Content, Alignment, 16, 16);
		}
		
		//this function handles the player picking up items
		static public function GiveItemToPlayer(Player:Dot, Object:AdventureItem):void{
			//player is touching the object, and doesn't have an item
			if((Player.overlaps(Object)) && (Player.HasItem == false)){
				//so give him this one
				Player.GiveItem(Object);
			}
		}
		
		//use for menus, see if you click on a sprite's area
		static public function ClickOnSprite(Button:FlxSprite):Boolean{
			if((FlxG.mouse.x >= Button.left) && (FlxG.mouse.x <= Button.right) 
			&& (FlxG.mouse.y >= Button.top) && (FlxG.mouse.y <= Button.bottom)){
				return true;
			}else{
				return false;
			}
		}
		
		//this function handles the player picking up items: bridge version
		static public function GiveBridgeToPlayer(Player:Dot, bridge:Bridge, bridgeleft:FlxSprite, bridgeright:FlxSprite):void{
			//player is touching the object, and doesn't have an item
				if((Player.overlaps(bridge)) && (Player.HasItem == false)){
					//so give him this one
					Player.GiveItem(bridge);					
					//set up bridge barrier positions				
					bridgeleft.x = bridge.x;
					bridgeleft.y = bridge.y;
					bridgeright.x = bridge.x + bridge.width - 16;
					bridgeright.y = bridge.y;
				}
		}		
		
		//this function handles hiding or showing Dragons if they should be onscreen or not
		static public function ShowHideDragon(CurrentMapX:Number, CurrentMapY:Number, Player:Dot, Object:AdventureDragon):void{
			//if the Dragon is supposed to be on the current map
			//and it was previously offscreen
			if((Object.roomIDX == CurrentMapX) && (Object.roomIDY == CurrentMapY) && (Object.Offscreen == true)){
				//move the object to the location its supposed to be
				Object.x			= Object.trueX;
				Object.y			= Object.trueY;
				//set the object onscreen (Offscreen = false)
				Object.Offscreen	= false;
			}
			//if the Dragon is not supposed to be on the current map
			//and the Dragon was previously onscreen
			else if(((Object.roomIDX != CurrentMapX) || (Object.roomIDY != CurrentMapY)) && (Object.Offscreen == false)){
				//if it was within 32 pixels of the screen edge, have it chase you anyway
				
				//move the dragon just off the left edge of the screen
				if((Player.LastDirection == Player.LEFT) && (Object.x < (32))){
					Object.x = FlxG.width+32;
					Object.roomIDX	= CurrentMapX;
					Object.roomIDY	= CurrentMapY;
				}else if((Player.LastDirection == Player.RIGHT) && (Object.x > (FlxG.width - 64))){
					Object.x = -32;
					Object.roomIDX	= CurrentMapX;
					Object.roomIDY	= CurrentMapY;
				}else if((Player.LastDirection == Player.UP) && (Object.y < (32))){
					Object.y = FlxG.height+32;;
					Object.roomIDX	= CurrentMapX;
					Object.roomIDY	= CurrentMapY;
				}else if((Player.LastDirection == Player.DOWN) && (Object.y > (FlxG.height - 64))){
					Object.y = -32;
					Object.roomIDX	= CurrentMapX;
					Object.roomIDY	= CurrentMapY;
				}else{
					//if it wasnt
					//set the object to be offscreen
					Object.Offscreen	= true;
					//back up the X/Y coordinates
					Object.trueX		= Object.x;
					Object.trueY		= Object.y;
					//set the X/Y coordinates to a spot that the player cannot see them
					Object.x			= -1000;
					Object.y			= -1000;				
				}
			}		
		}
		
		//this function handles hiding or showing items if they should be onscreen or not
		static public function ShowHideObject(CurrentMapX:Number, CurrentMapY:Number, Object:AdventureItem):void{
			//if the item is supposed to be on the current map
			//and the object was previously offscreen
			if((Object.roomIDX == CurrentMapX) && (Object.roomIDY == CurrentMapY) && (Object.Offscreen == true)){
				//move the object to the location its supposed to be
				Object.x			= Object.trueX;
				Object.y			= Object.trueY;
				//set the object onscreen (Offscreen = false)
				Object.Offscreen	= false;
			}
			//if the item is not supposed to be on the current map
			//and the item was previously onscreen
			else if(((Object.roomIDX != CurrentMapX) || (Object.roomIDY != CurrentMapY)) && (Object.Offscreen == false)){
				//set the object to be offscreen
				Object.Offscreen	= true;
				//back up the X/Y coordinates
				Object.trueX		= Object.x;
				Object.trueY		= Object.y;
				//set the X/Y coordinates to a spot that the player cannot see them
				Object.x			= -100;
				Object.y			= -100;				
			}		
		}			
		//this function handles hiding or showing items if they should be onscreen or not: Gate Edition
		static public function ShowHideGate(CurrentMapX:Number, CurrentMapY:Number, Object:AdventureItem):void{
			//if the item is supposed to be on the current map
			//and the object was previously offscreen
			if((Object.roomIDX == CurrentMapX) && (Object.roomIDY == CurrentMapY) && (Object.Offscreen == true)){
				//move the object to the location its supposed to be
				Object.x			= Object.trueX;
				Object.y			= Object.trueY;
				//set the object onscreen (Offscreen = false)
				Object.Offscreen	= false;
			}
			//if the item is not supposed to be on the current map
			//and the item was previously onscreen
			else if(((Object.roomIDX != CurrentMapX) || (Object.roomIDY != CurrentMapY)) && (Object.Offscreen == false)){
				//set the object to be offscreen
				Object.Offscreen	= true;
				//back up the X/Y coordinates
				Object.trueX		= Object.x;
				Object.trueY		= Object.y;
				//set the X/Y coordinates to a spot that the player cannot see them
				Object.x			= -1000;
				Object.y			= -1000;				
			}		
		}		
		
		//This function handles the Gate Mechanics
		static public function GateMechanics(Player:Dot, KeyObject:AdventureItem, GateObject:AdventureGate):Boolean{
			
			//if the gate is closed
			if(!GateObject.Opened){				
				//correct key opens gate
				if(KeyObject.overlaps(GateObject) && !GateObject.Opening){
					//open the gate
					GateObject.Opening 	= true;
					return true;
				}
			}else{
				//gate is opened: warp player to the top of the screen, so that it moves one screen north
				if((Player.x >= GateObject.x) && (Player.x < GateObject.x+40) && (Player.y >= GateObject.y) && (Player.y < GateObject.y+37)){
					Player.y = -10;
				}
			}
			return false;
		}
		
		//handle player collision
		static public function Collision(Player:Dot, WallGroup:FlxGroup, BridgeGroup:FlxGroup, DragonCollisionGroup:FlxGroup, GateGroup:FlxGroup, bridge:Bridge):void{
			//Player is not on a bridge
			Player.OnBridge = InsideBridge(Player, bridge);
			if(!Player.OnBridge){
				//player collides with walls
				FlxU.collide(Player, WallGroup);
			}
			//always do gate and dragon collisions
			FlxU.collide(Player,GateGroup);
			FlxU.collide(Player,DragonCollisionGroup);
		}

		//magnet code
		static public function MagnetPull(CurrentMapX:Number, CurrentMapY:Number, magnet:Magnet, Object:AdventureItem):void{
			//magnet is currently onscreen and the player isnt holding it
			if((CurrentMapX == magnet.roomIDX) && (CurrentMapY == magnet.roomIDY) && (CurrentMapX == Object.roomIDX) && (CurrentMapY == Object.roomIDY)){
				//pull all onscreen items close to me
				//item is to the left
				if((magnet.x+16) > Object.x){
					Object.x += 1;
				//item is to the right 
				}else if(magnet.x < Object.x){
					Object.x -= 1;
				}
				//item is above
				if(magnet.y < Object.y){
					Object.y -= 1;
				}
				//item is below
				else if((magnet.y+16) > Object.y){
					Object.y += 1;
				}
			}
		}		
		
		static public function InsideBridge(Player:Dot, bridge:Bridge):Boolean{
			//you can't be on the bridge if you're holding it
			if(Player.CurrentItem == bridge && Player.HasItem){	return false; }
			
			if(((Player.x) >= (bridge.x + 16)) && ((Player.x + Player.width) <= (bridge.x + 48))
			&& ((Player.y + Player.height + 2) >= (bridge.y)) && ((Player.y - 2) <= (bridge.y + bridge.height))){
				//player is on the inner section of the bridge, cannot pick up the bridge from this side
				return true;
			}else{
				//player is touching the bridge, but not from inside, can lift it up, not "on" the bridge
				return false;
			}
		}
		
		//Bridge code
		static public function BridgeBehavior(Player:Dot, bridge:Bridge, bridgeleft:FlxSprite, bridgeright:FlxSprite):void{
			//start here
			/*
			if(Player.overlaps(bridge)){
				//player is touching the bridge
				Player.OnBridge = InsideBridge(Player, bridge);
			}else{
				//player is not on the bridge
				Player.OnBridge = false;
			}*/
			//give the player the bridge if he is not inside of it
			if(!Player.OnBridge){
				GiveBridgeToPlayer(Player, bridge, bridgeleft, bridgeright);
			}
		}
		
		static public function HexCondense(CurrentMapX:Number, CurrentMapY:Number):String{
			var TempMapX:String;
			var TempMapY:String;
			switch(CurrentMapX){
				case 10:
					TempMapX = 'A';
					break;
				case 11:
					TempMapX = 'B';
					break;
				case 12:
					TempMapX = 'C';
					break;
				case 13:
					TempMapX = 'D';
					break;
				case 14:
					TempMapX = 'E';
					break;
				case 15:
					TempMapX = 'F';
					break;
				default:
					TempMapX = String(CurrentMapX);
					break;
			}
			switch(CurrentMapY){
				case 10:
					TempMapY = 'A';
					break;
				case 11:
					TempMapY = 'B';
					break;
				case 12:
					TempMapY = 'C';
					break;
				case 13:
					TempMapY = 'D';
					break;
				case 14:
					TempMapY = 'E';
					break;
				case 15:
					TempMapY = 'F';
					break;
				default:
					TempMapY = String(CurrentMapY);
					break;
			}
			
			return (String(TempMapX) + String(TempMapY));
		}
		
		//loading and saving functions
		
		//best time
		static public function LoadBestTime(ReadMe:String):Number{
			//specific loading for BestTimes
			if(save.bind("TGA") && (save.read(ReadMe) != null)){
				//return saved data
				return Number(save.read(ReadMe));
			}else{
				//return default value - half hour
				return 1800;
			}
		}
		
		//read an award
		static public function LoadAward(Award:uint):String{
			if(save.bind("TGA") && (save.read("Awards["+String(Award)+"]") != null)){
				//load awards
				return String(save.read("Awards["+String(Award)+"]"));
			}else{
				return "false";
			}
		}
		
		//save an award
		static public function SaveAward(Award:uint):void{
			if(save.bind("TGA")){
				save.write("Awards["+String(Award)+"]", "true");
			}
		}
		
		//clear all awards
		static public function ClearAwards():void{
			if(save.bind("TGA")){
				for(var i:uint = 0;i < 40;i++){
					save.write("Awards["+String([i+1])+"]", "false");
				}
			}
		}
		
		
		//initialize an array full of info about awards
		static public function InitAwards():Array{
			var AwardList:Array = new Array();
			for(var i:uint = 1;i < AdventureLibrary.AwardsText.length + 1; i++){
				AwardList[i] = AdventureLibrary.LoadAward(i);
			}
			return AwardList;
		}
		
		static public function LoadData(ReadMe:String):Object{
			if(save.bind("TGA")){
				return save.read(ReadMe);
			}
			return null;
		}		
		
		static public function SaveData(WriteMe:String, WriteThis:Object):void{
			if(save.bind("TGA")){
				save.write(WriteMe, WriteThis);
			}
		}
		
		//this function checks if a map exists, to prevent going out of bounds
		static public function MapExists(CurrentMap:String, MapList:Array):Boolean{
			//go through the array and compare
			var i:int;
			for(i=0;i<=MapList.length;i++){
				if(CurrentMap == MapList[i]){
					return true;
				}
			}
			return false;
		}
	}
}
