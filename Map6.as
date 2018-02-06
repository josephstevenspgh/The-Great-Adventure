package{
	import org.flixel.*;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
 
	public class Map6 extends AdventureMap{
		//load media
		
		//map tilesets		
		[Embed(source="Maps/Adventure_ExtendedMap4Tiles.png")] protected var Tileset:Class;
		
		//map data files
		[Embed(source="Maps/ExtendedMap_4_05.txm",		mimeType="application/octet-stream")] protected var Map05_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_4_05Walls.txm",	mimeType="application/octet-stream")] protected var Map05_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_4_10.txm",		mimeType="application/octet-stream")] protected var Map10_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_4_10Walls.txm",	mimeType="application/octet-stream")] protected var Map10_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_4_11.txm",		mimeType="application/octet-stream")] protected var Map11_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_4_11Walls.txm",	mimeType="application/octet-stream")] protected var Map11_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_4_12.txm",		mimeType="application/octet-stream")] protected var Map12_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_4_12Walls.txm",	mimeType="application/octet-stream")] protected var Map12_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_4_13.txm",		mimeType="application/octet-stream")] protected var Map13_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_4_13Walls.txm",	mimeType="application/octet-stream")] protected var Map13_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_4_14.txm",		mimeType="application/octet-stream")] protected var Map14_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_4_14Walls.txm",	mimeType="application/octet-stream")] protected var Map14_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_4_15.txm",		mimeType="application/octet-stream")] protected var Map15_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_4_15Walls.txm",	mimeType="application/octet-stream")] protected var Map15_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_4_20.txm",		mimeType="application/octet-stream")] protected var Map20_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_4_20Walls.txm",	mimeType="application/octet-stream")] protected var Map20_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_4_25.txm",		mimeType="application/octet-stream")] protected var Map25_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_4_25Walls.txm",	mimeType="application/octet-stream")] protected var Map25_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_4_30.txm",		mimeType="application/octet-stream")] protected var Map30_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_4_30Walls.txm",	mimeType="application/octet-stream")] protected var Map30_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_4_32.txm",		mimeType="application/octet-stream")] protected var Map32_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_4_32Walls.txm",	mimeType="application/octet-stream")] protected var Map32_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_4_33.txm",		mimeType="application/octet-stream")] protected var Map33_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_4_33Walls.txm",	mimeType="application/octet-stream")] protected var Map33_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_4_34.txm",		mimeType="application/octet-stream")] protected var Map34_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_4_34Walls.txm",	mimeType="application/octet-stream")] protected var Map34_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_4_35.txm",		mimeType="application/octet-stream")] protected var Map35_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_4_35Walls.txm",	mimeType="application/octet-stream")] protected var Map35_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_4_40.txm",		mimeType="application/octet-stream")] protected var Map40_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_4_40Walls.txm",	mimeType="application/octet-stream")] protected var Map40_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_4_42.txm",		mimeType="application/octet-stream")] protected var Map42_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_4_42Walls.txm",	mimeType="application/octet-stream")] protected var Map42_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_4_43.txm",		mimeType="application/octet-stream")] protected var Map43_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_4_43Walls.txm",	mimeType="application/octet-stream")] protected var Map43_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_4_44.txm",		mimeType="application/octet-stream")] protected var Map44_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_4_44Walls.txm",	mimeType="application/octet-stream")] protected var Map44_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_4_45.txm",		mimeType="application/octet-stream")] protected var Map45_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_4_45Walls.txm",	mimeType="application/octet-stream")] protected var Map45_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_4_50.txm",		mimeType="application/octet-stream")] protected var Map50_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_4_50Walls.txm",	mimeType="application/octet-stream")] protected var Map50_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_4_55.txm",		mimeType="application/octet-stream")] protected var Map55_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_4_55Walls.txm",	mimeType="application/octet-stream")] protected var Map55_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_4_60.txm",		mimeType="application/octet-stream")] protected var Map60_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_4_60Walls.txm",	mimeType="application/octet-stream")] protected var Map60_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_4_61.txm",		mimeType="application/octet-stream")] protected var Map61_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_4_61Walls.txm",	mimeType="application/octet-stream")] protected var Map61_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_4_62.txm",		mimeType="application/octet-stream")] protected var Map62_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_4_62Walls.txm",	mimeType="application/octet-stream")] protected var Map62_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_4_63.txm",		mimeType="application/octet-stream")] protected var Map63_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_4_63Walls.txm",	mimeType="application/octet-stream")] protected var Map63_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_4_64.txm",		mimeType="application/octet-stream")] protected var Map64_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_4_64Walls.txm",	mimeType="application/octet-stream")] protected var Map64_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_4_65.txm",		mimeType="application/octet-stream")] protected var Map65_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_4_65Walls.txm",	mimeType="application/octet-stream")] protected var Map65_Data_Walls:Class;

		//this handles initializing everything
		override public function create():void{
			GameNumber = 6;
			GoalMapX = 4;
			GoalMapY = 2;
			InitializeMap(1, 5);

			//set up item positions
			gkey.trueX		= 200;
			gkey.trueY 		= 112;
			bkey.trueX		= 60;
			bkey.trueY		= 60;
			wkey.trueX		= 120;
			wkey.trueY		= 88;
			sword.trueX		= 72;
			sword.trueY		= 32;
			grail.trueX		= 152;
			grail.trueY 	= 96;
			bridge.trueX	= 144;
			bridge.trueY	= 104;
			magnet.trueX	= 272;
			magnet.trueY	= 56;
			
			//object room IDs
			gkey.roomIDX	= 6;
			gkey.roomIDY	= 0;
			bkey.roomIDX	= 1;
			bkey.roomIDY	= 0;
			wkey.roomIDX	= 0;
			wkey.roomIDY	= 0;
			sword.roomIDX	= 2;
			sword.roomIDY	= 5;
			bridge.roomIDX	= 0;
			bridge.roomIDY	= 0;
			magnet.roomIDX	= 0;
			magnet.roomIDY	= 0;
			grail.roomIDX	= 3;
			grail.roomIDY	= 2;
			ggate.roomIDX	= 4;
			ggate.roomIDY	= 3;
			bgate.roomIDX	= 3;
			bgate.roomIDY	= 3;
			wgate.roomIDX	= 0;
			wgate.roomIDY	= 0;
			GDragon.roomIDX	= 3;
			GDragon.roomIDY	= 5;
			YDragon.roomIDX	= 4;
			YDragon.roomIDY	= 5;
			RDragon.roomIDX	= 4;
			RDragon.roomIDY	= 0;
			
			//move around the dragons
			GDragon.trueX	= FlxG.width/2;
			YDragon.trueX	= FlxG.width/2;
			
			//move player
			Player.y		= FlxG.height/2;

			//Load Maps
			LoadMap();

			//Flash the screen
			FlxG.flash.start(0xFFFFFF00);
		}	

		override public function MapExists(NewMapX:uint, NewMapY:uint):Boolean{

			var CurrentMap:String = String(NewMapX) + String(NewMapY);
			
			//load data
			switch(CurrentMap){
				default:
					return false;
					break;
				case '05':
					return true;
					break;	
				case '10':
					return true;
					break;	
				case '11':
					return true;
					break;
				case '12':
					return true;
					break;	
				case '13':
					return true;
					break;	
				case '14':
					return true;
					break;	
				case '15':
					return true;
					break;	
				case '20':
					return true;
					break;	
				case '25':
					return true;
					break;	
				case '30':
					return true;
					break;	
				case '32':
					return true;
					break;	
				case '33':
					return true;
					break;	
				case '34':
					return true;
					break;				
				case '35':
					return true;
					break;	
				case '40':
					return true;
					break;				
				case '42':
					return true;
					break;				
				case '43':
					return true;
					break;				
				case '44':
					return true;
					break;				
				case '45':
					return true;
					break;				
				case '50':
					return true;
					break;		
				case '55':
					return true;
					break;		
				case '60':
					return true;
					break;		
				case '61':
					return true;
					break;		
				case '62':
					return true;
					break;		
				case '63':
					return true;
					break;		
				case '64':
					return true;
					break;		
				case '65':
					return true;
					break;	
			}
		}
		
		//this function handles moving one screen up		
		override public function MoveUp():void{
			var NewMapX:uint = CurrentMapX;
			var NewMapY:uint = CurrentMapY;
			NewMapY -= 1;
			
			if(MapExists(NewMapX, NewMapY)){
				CurrentMapY -= 1;
				if(Player.HasItem){
					Player.CurrentItem.roomIDX = CurrentMapX;
					Player.CurrentItem.roomIDY = CurrentMapY;
				}
				Player.LastDirection = Player.UP;
				Player.y = FlxG.height-8;
				LoadMap();
			}else{
				Player.y	= 0;
			}
		}

		//this function handles moving one screen down		
		override public function MoveDown():void{
			var NewMapX:uint = CurrentMapX;
			var NewMapY:uint = CurrentMapY;
			NewMapY += 1;
			
			if(MapExists(NewMapX, NewMapY)){
				CurrentMapY += 1;
				if(Player.HasItem){
					Player.CurrentItem.roomIDX = CurrentMapX;
					Player.CurrentItem.roomIDY = CurrentMapY;
				}
				Player.LastDirection = Player.DOWN;
				//special behavior for screens with gates
				if (CurrentMapX == 3 && CurrentMapY == 3){
					Player.y = FlxG.height-50;
				}else if (CurrentMapX == 4 && CurrentMapY == 3){
					Player.y = FlxG.height-50;
				}else if (CurrentMapX == 2 && CurrentMapY == 4){
					Player.y = FlxG.height-50;
				}else{
					Player.y = 0;
				}
				LoadMap();
			}else{
				Player.y	= FlxG.height - 8;
			}
		}

		//this function handles moving one screen to the left		
		override public function MoveLeft():void{
			//simple maze on this map
			if(CurrentMapX == 0 && CurrentMapY == 5){
				CurrentMapX = 6;
				CurrentMapY = 5;
			}else{
				//normal movement
				CurrentMapX -= 1;
			}
			if(Player.HasItem){
				Player.CurrentItem.roomIDX = CurrentMapX;
				Player.CurrentItem.roomIDY = CurrentMapY;
			}
			Player.LastDirection = Player.LEFT;
			Player.x = FlxG.width-8;
			LoadMap();
		}
		
		//this function handles moving one screen to the right
		override public function MoveRight():void{
			//simple maze on this map
			if(CurrentMapX == 6 && CurrentMapY == 5){
				CurrentMapX = 0;
				CurrentMapY = 5;
			}else{
				//normal movement
				CurrentMapX += 1;
			}
			if(Player.HasItem){
				Player.CurrentItem.roomIDX = CurrentMapX;
				Player.CurrentItem.roomIDY = CurrentMapY;
			}
			Player.LastDirection = Player.RIGHT;
			Player.x = 0;
			LoadMap();
		}
		
		//this function handles loading the correct map and displaying the correct everything
		override public function LoadMap():void{
			//disable weather for now, enable during map loading
			InCave = false;
			StopSnow();
			StopBlizzard();
		
			//handle maps
			if(CurrentMap_Floor != null){
				CurrentMap_Floor.kill();
				FloorGroup.remove(CurrentMap_Floor);
			}
			if(CurrentMap_Walls != null){
				CurrentMap_Walls.kill();
				WallGroup.remove(CurrentMap_Walls);
			}
					
			//re-initialize maps
			CurrentMap_Floor = new FlxTilemap();
			CurrentMap_Walls = new FlxTilemap();
			FloorGroup.add(CurrentMap_Floor);
			WallGroup.add(CurrentMap_Walls);
			WallGroup.fixed	= true;
			
			var CurrentMap:String = String(CurrentMapX) + String(CurrentMapY);
			
			//load data
			switch(CurrentMap){
				case '05':
					CurrentMap_Walls.loadMap(new Map05_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map05_Data_Floor,Tileset,8,8);
					break;	
				case '10':
					CurrentMap_Walls.loadMap(new Map10_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map10_Data_Floor,Tileset,8,8);
					break;	
				case '11':
					CurrentMap_Walls.loadMap(new Map11_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map11_Data_Floor,Tileset,8,8);
					break;	
				case '12':
					CurrentMap_Walls.loadMap(new Map12_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map12_Data_Floor,Tileset,8,8);
					break;	
				case '13':
					CurrentMap_Walls.loadMap(new Map13_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map13_Data_Floor,Tileset,8,8);
					break;	
				case '14':
					CurrentMap_Walls.loadMap(new Map14_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map14_Data_Floor,Tileset,8,8);
					break;	
				case '15':
					CurrentMap_Walls.loadMap(new Map15_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map15_Data_Floor,Tileset,8,8);
					break;	
				case '20':
					CurrentMap_Walls.loadMap(new Map20_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map20_Data_Floor,Tileset,8,8);
					break;	
				case '25':
					CurrentMap_Walls.loadMap(new Map25_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map25_Data_Floor,Tileset,8,8);
					break;	
				case '30':
					CurrentMap_Walls.loadMap(new Map30_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map30_Data_Floor,Tileset,8,8);
					break;	
				case '32':
					CurrentMap_Walls.loadMap(new Map32_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map32_Data_Floor,Tileset,8,8);
					break;	
				case '33':
					CurrentMap_Walls.loadMap(new Map33_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map33_Data_Floor,Tileset,8,8);
					break;	
				case '34':
					CurrentMap_Walls.loadMap(new Map34_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map34_Data_Floor,Tileset,8,8);
					break;	
				case '35':
					CurrentMap_Walls.loadMap(new Map35_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map35_Data_Floor,Tileset,8,8);
					break;	
				case '40':
					CurrentMap_Walls.loadMap(new Map40_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map40_Data_Floor,Tileset,8,8);
					break;	
				case '42':
					CurrentMap_Walls.loadMap(new Map42_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map42_Data_Floor,Tileset,8,8);
					break;	
				case '43':
					CurrentMap_Walls.loadMap(new Map43_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map43_Data_Floor,Tileset,8,8);
					break;	
				case '44':
					CurrentMap_Walls.loadMap(new Map44_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map44_Data_Floor,Tileset,8,8);
					break;	
				case '45':
					CurrentMap_Walls.loadMap(new Map45_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map45_Data_Floor,Tileset,8,8);
					break;	
				case '50':
					CurrentMap_Walls.loadMap(new Map50_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map50_Data_Floor,Tileset,8,8);
					break;	
				case '55':
					CurrentMap_Walls.loadMap(new Map55_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map55_Data_Floor,Tileset,8,8);
					break;	
				case '60':
					CurrentMap_Walls.loadMap(new Map60_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map60_Data_Floor,Tileset,8,8);
					break;	
				case '61':
					CurrentMap_Walls.loadMap(new Map61_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map61_Data_Floor,Tileset,8,8);
					InCave = true;
					break;	
				case '62':
					CurrentMap_Walls.loadMap(new Map62_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map62_Data_Floor,Tileset,8,8);
					InCave = true;
					break;	
				case '63':
					CurrentMap_Walls.loadMap(new Map63_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map63_Data_Floor,Tileset,8,8);
					break;	
				case '64':
					CurrentMap_Walls.loadMap(new Map64_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map64_Data_Floor,Tileset,8,8);
					break;	
				case '65':
					CurrentMap_Walls.loadMap(new Map65_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map65_Data_Floor,Tileset,8,8);
					break;	
			}
			
			//show necessary objects
			AdventureLibrary.ShowHideObject(CurrentMapX, CurrentMapY, gkey);
			AdventureLibrary.ShowHideObject(CurrentMapX, CurrentMapY, bkey);
			AdventureLibrary.ShowHideObject(CurrentMapX, CurrentMapY, wkey);
			AdventureLibrary.ShowHideObject(CurrentMapX, CurrentMapY, grail);
			AdventureLibrary.ShowHideObject(CurrentMapX, CurrentMapY, bridge);
			AdventureLibrary.ShowHideObject(CurrentMapX, CurrentMapY, sword);
			AdventureLibrary.ShowHideObject(CurrentMapX, CurrentMapY, magnet);
			AdventureLibrary.ShowHideGate(CurrentMapX, CurrentMapY, ggate);
			AdventureLibrary.ShowHideGate(CurrentMapX, CurrentMapY, bgate);
			AdventureLibrary.ShowHideGate(CurrentMapX, CurrentMapY, wgate);
			AdventureLibrary.ShowHideDragon(CurrentMapX, CurrentMapY, Player, GDragon);
			AdventureLibrary.ShowHideDragon(CurrentMapX, CurrentMapY, Player, YDragon);
			AdventureLibrary.ShowHideDragon(CurrentMapX, CurrentMapY, Player, RDragon);
			
			//check gamewin
			GameWin();
			
			super.update();
			
		}
	}
}










