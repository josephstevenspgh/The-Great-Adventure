package{
	import org.flixel.*;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
 
	public class Map5 extends AdventureMap{
		//load media
		
		//map tilesets		
		[Embed(source="Maps/Adventure_ExtendedMap2Tiles.png")] protected var Tileset:Class;
		
		//map data files
		[Embed(source="Maps/ExtendedMap_2_01.txm",		mimeType="application/octet-stream")] protected var Map01_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_2_01Walls.txm",	mimeType="application/octet-stream")] protected var Map01_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_2_02.txm",		mimeType="application/octet-stream")] protected var Map02_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_2_02Walls.txm",	mimeType="application/octet-stream")] protected var Map02_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_2_03.txm",		mimeType="application/octet-stream")] protected var Map03_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_2_03Walls.txm",	mimeType="application/octet-stream")] protected var Map03_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_2_04.txm",		mimeType="application/octet-stream")] protected var Map04_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_2_04Walls.txm",	mimeType="application/octet-stream")] protected var Map04_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_2_05.txm",		mimeType="application/octet-stream")] protected var Map05_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_2_05Walls.txm",	mimeType="application/octet-stream")] protected var Map05_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_2_10.txm",		mimeType="application/octet-stream")] protected var Map10_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_2_10Walls.txm",	mimeType="application/octet-stream")] protected var Map10_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_2_11.txm",		mimeType="application/octet-stream")] protected var Map11_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_2_11Walls.txm",	mimeType="application/octet-stream")] protected var Map11_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_2_13.txm",		mimeType="application/octet-stream")] protected var Map13_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_2_13Walls.txm",	mimeType="application/octet-stream")] protected var Map13_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_2_14.txm",		mimeType="application/octet-stream")] protected var Map14_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_2_14Walls.txm",	mimeType="application/octet-stream")] protected var Map14_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_2_20.txm",		mimeType="application/octet-stream")] protected var Map20_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_2_20Walls.txm",	mimeType="application/octet-stream")] protected var Map20_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_2_21.txm",		mimeType="application/octet-stream")] protected var Map21_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_2_21Walls.txm",	mimeType="application/octet-stream")] protected var Map21_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_2_22.txm",		mimeType="application/octet-stream")] protected var Map22_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_2_22Walls.txm",	mimeType="application/octet-stream")] protected var Map22_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_2_23.txm",		mimeType="application/octet-stream")] protected var Map23_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_2_23Walls.txm",	mimeType="application/octet-stream")] protected var Map23_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_2_24.txm",		mimeType="application/octet-stream")] protected var Map24_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_2_24Walls.txm",	mimeType="application/octet-stream")] protected var Map24_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_2_25.txm",		mimeType="application/octet-stream")] protected var Map25_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_2_25Walls.txm",	mimeType="application/octet-stream")] protected var Map25_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_2_30.txm",		mimeType="application/octet-stream")] protected var Map30_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_2_30Walls.txm",	mimeType="application/octet-stream")] protected var Map30_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_2_31.txm",		mimeType="application/octet-stream")] protected var Map31_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_2_31Walls.txm",	mimeType="application/octet-stream")] protected var Map31_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_2_33.txm",		mimeType="application/octet-stream")] protected var Map33_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_2_33Walls.txm",	mimeType="application/octet-stream")] protected var Map33_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_2_34.txm",		mimeType="application/octet-stream")] protected var Map34_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_2_34Walls.txm",	mimeType="application/octet-stream")] protected var Map34_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_2_41.txm",		mimeType="application/octet-stream")] protected var Map41_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_2_41Walls.txm",	mimeType="application/octet-stream")] protected var Map41_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_2_42.txm",		mimeType="application/octet-stream")] protected var Map42_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_2_42Walls.txm",	mimeType="application/octet-stream")] protected var Map42_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_2_43.txm",		mimeType="application/octet-stream")] protected var Map43_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_2_43Walls.txm",	mimeType="application/octet-stream")] protected var Map43_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_2_44.txm",		mimeType="application/octet-stream")] protected var Map44_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_2_44Walls.txm",	mimeType="application/octet-stream")] protected var Map44_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_2_45.txm",		mimeType="application/octet-stream")] protected var Map45_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_2_45Walls.txm",	mimeType="application/octet-stream")] protected var Map45_Data_Walls:Class;

		//this handles initializing everything
		override public function create():void{
			GameNumber = 5;
			GoalMapX = 3;
			GoalMapY = 0;
			InitializeMap(2, 5);

			//set up item positions
			gkey.trueX		= 240;
			gkey.trueY 		= 80;
			bkey.trueX		= 160;
			bkey.trueY		= 32;
			sword.trueX		= (FlxG.width/2);
			sword.trueY		= 160;
			grail.trueX		= 184;
			grail.trueY 	= 184;
			bridge.trueX	= 200;
			bridge.trueY	= 120;
			magnet.trueX	= 200;
			magnet.trueY	= 160;
			
			//object room IDs
			gkey.roomIDX	= 2;
			gkey.roomIDY	= 2;
			sword.roomIDX	= 4;
			sword.roomIDY	= 5;
			bkey.roomIDX	= 1;
			bkey.roomIDY	= 3;
			bridge.roomIDX	= 0;
			bridge.roomIDY	= 5;
			magnet.roomIDX	= 3;
			magnet.roomIDY	= 4;
			grail.roomIDX	= 1;
			grail.roomIDY	= 0;
			ggate.roomIDX	= 3;
			ggate.roomIDY	= 1;
			bgate.roomIDX	= 0;
			bgate.roomIDY	= 4;
			GDragon.roomIDX	= 0;
			GDragon.roomIDY	= 3;
			YDragon.roomIDX	= 4;
			YDragon.roomIDY	= 2;
			RDragon.Target = new Dot(1000, 1000);

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
				case '01':
					return true;
					break;	
				case '02':
					return true;
					break;	
				case '03':
					return true;
					break;
				case '04':
					return true;
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
				case '13':
					return true;
					break;	
				case '14':
					return true;
					break;	
				case '20':
					return true;
					break;	
				case '21':
					return true;
					break;	
				case '22':
					return true;
					break;	
				case '23':
					return true;
					break;				
				case '24':
					return true;
					break;	
				case '25':
					return true;
					break;				
				case '30':
					return true;
					break;				
				case '31':
					return true;
					break;				
				case '33':
					return true;
					break;				
				case '34':
					return true;
					break;				
				case '41':
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
			}
		}
		
		//this function handles moving one screen up		
		override public function MoveUp():void{
			var NewMapX:uint = CurrentMapX;
			var NewMapY:uint = CurrentMapY;
			NewMapY -= 1;
			
			if(MapExists(NewMapX, NewMapY)){
				//no mazes on this map
				//normal movement
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
				//no mazes on this map
				if(CurrentMapX == 0 && CurrentMapY == 0){
					CurrentMapX = 0;
					CurrentMapY = 0;
				}else{
					//normal movement
					CurrentMapY += 1;
				}
				if(Player.HasItem){
					Player.CurrentItem.roomIDX = CurrentMapX;
					Player.CurrentItem.roomIDY = CurrentMapY;
				}
				Player.LastDirection = Player.DOWN;
				//special behavior for screens with gates
				if (CurrentMapX == 0 && CurrentMapY == 4){
					Player.y = FlxG.height-50;
				}else if (CurrentMapX == 3 && CurrentMapY == 1){
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
			//no mazes on this map
			if(CurrentMapX == 0 && CurrentMapY == 0){
				CurrentMapX = 0;
				CurrentMapY = 0;
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
			//no mazes on this map
			if(CurrentMapX == 0 && CurrentMapY == 0){
				CurrentMapX = 0;
				CurrentMapY = 0;
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
				case '01':
					CurrentMap_Walls.loadMap(new Map01_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map01_Data_Floor,Tileset,8,8);
					StartSnowing();
					break;	
				case '02':
					CurrentMap_Walls.loadMap(new Map02_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map02_Data_Floor,Tileset,8,8);
					StartSnowing();
					break;	
				case '03':
					CurrentMap_Walls.loadMap(new Map03_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map03_Data_Floor,Tileset,8,8);
					break;	
				case '04':
					CurrentMap_Walls.loadMap(new Map04_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map04_Data_Floor,Tileset,8,8);
					break;	
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
					StartSnowing();
					break;	
				case '13':
					CurrentMap_Walls.loadMap(new Map13_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map13_Data_Floor,Tileset,8,8);
					InCave	= true;
					break;	
				case '14':
					CurrentMap_Walls.loadMap(new Map14_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map14_Data_Floor,Tileset,8,8);
					break;	
				case '20':
					CurrentMap_Walls.loadMap(new Map20_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map20_Data_Floor,Tileset,8,8);
					StartSnowing();
					break;	
				case '21':
					CurrentMap_Walls.loadMap(new Map21_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map21_Data_Floor,Tileset,8,8);
					StartSnowing();
					break;	
				case '22':
					CurrentMap_Walls.loadMap(new Map22_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map22_Data_Floor,Tileset,8,8);
					InCave	= true;
					break;	
				case '23':
					CurrentMap_Walls.loadMap(new Map23_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map23_Data_Floor,Tileset,8,8);
					InCave	= true;
					break;	
				case '24':
					CurrentMap_Walls.loadMap(new Map24_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map24_Data_Floor,Tileset,8,8);
					InCave	= true;
					break;	
				case '25':
					CurrentMap_Walls.loadMap(new Map25_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map25_Data_Floor,Tileset,8,8);
					break;	
				case '30':
					CurrentMap_Walls.loadMap(new Map30_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map30_Data_Floor,Tileset,8,8);
					break;	
				case '31':
					CurrentMap_Walls.loadMap(new Map31_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map31_Data_Floor,Tileset,8,8);
					break;	
				case '33':
					CurrentMap_Walls.loadMap(new Map33_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map33_Data_Floor,Tileset,8,8);
					InCave	= true;
					break;	
				case '34':
					CurrentMap_Walls.loadMap(new Map34_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map34_Data_Floor,Tileset,8,8);
					InCave	= true;
					break;	
				case '41':
					CurrentMap_Walls.loadMap(new Map41_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map41_Data_Floor,Tileset,8,8);
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
			}
			
			//show necessary objects
			AdventureLibrary.ShowHideObject(CurrentMapX, CurrentMapY, gkey);
			AdventureLibrary.ShowHideObject(CurrentMapX, CurrentMapY, bkey);
			AdventureLibrary.ShowHideObject(CurrentMapX, CurrentMapY, grail);
			AdventureLibrary.ShowHideObject(CurrentMapX, CurrentMapY, bridge);
			AdventureLibrary.ShowHideObject(CurrentMapX, CurrentMapY, sword);
			AdventureLibrary.ShowHideObject(CurrentMapX, CurrentMapY, magnet);
			AdventureLibrary.ShowHideGate(CurrentMapX, CurrentMapY, ggate);
			AdventureLibrary.ShowHideGate(CurrentMapX, CurrentMapY, bgate);
			AdventureLibrary.ShowHideDragon(CurrentMapX, CurrentMapY, Player, GDragon);
			AdventureLibrary.ShowHideDragon(CurrentMapX, CurrentMapY, Player, YDragon);
			AdventureLibrary.ShowHideDragon(CurrentMapX, CurrentMapY, Player, RDragon);
			
			//check gamewin
			GameWin();
			
			super.update();
			
		}
	}
}










