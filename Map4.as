package{
	import org.flixel.*;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
 
	public class Map4 extends AdventureMap{
		//load media
		
		//map tilesets		
		[Embed(source="Maps/Adventure_ExtendedMap3Tiles.png")] protected var Tileset:Class;
		
		//map data files
		[Embed(source="Maps/ExtendedMap_3_00.txm",		mimeType="application/octet-stream")] protected var Map00_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_3_00Walls.txm",	mimeType="application/octet-stream")] protected var Map00_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_3_01.txm",		mimeType="application/octet-stream")] protected var Map01_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_3_01Walls.txm",	mimeType="application/octet-stream")] protected var Map01_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_3_02.txm",		mimeType="application/octet-stream")] protected var Map02_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_3_02Walls.txm",	mimeType="application/octet-stream")] protected var Map02_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_3_03.txm",		mimeType="application/octet-stream")] protected var Map03_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_3_03Walls.txm",	mimeType="application/octet-stream")] protected var Map03_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_3_04.txm",		mimeType="application/octet-stream")] protected var Map04_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_3_04Walls.txm",	mimeType="application/octet-stream")] protected var Map04_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_3_10.txm",		mimeType="application/octet-stream")] protected var Map10_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_3_10Walls.txm",	mimeType="application/octet-stream")] protected var Map10_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_3_11.txm",		mimeType="application/octet-stream")] protected var Map11_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_3_11Walls.txm",	mimeType="application/octet-stream")] protected var Map11_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_3_13.txm",		mimeType="application/octet-stream")] protected var Map13_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_3_13Walls.txm",	mimeType="application/octet-stream")] protected var Map13_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_3_14.txm",		mimeType="application/octet-stream")] protected var Map14_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_3_14Walls.txm",	mimeType="application/octet-stream")] protected var Map14_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_3_23.txm",		mimeType="application/octet-stream")] protected var Map23_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_3_23Walls.txm",	mimeType="application/octet-stream")] protected var Map23_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_3_24.txm",		mimeType="application/octet-stream")] protected var Map24_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_3_24Walls.txm",	mimeType="application/octet-stream")] protected var Map24_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_3_30.txm",		mimeType="application/octet-stream")] protected var Map30_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_3_30Walls.txm",	mimeType="application/octet-stream")] protected var Map30_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_3_31.txm",		mimeType="application/octet-stream")] protected var Map31_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_3_31Walls.txm",	mimeType="application/octet-stream")] protected var Map31_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_3_33.txm",		mimeType="application/octet-stream")] protected var Map33_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_3_33Walls.txm",	mimeType="application/octet-stream")] protected var Map33_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_3_34.txm",		mimeType="application/octet-stream")] protected var Map34_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_3_34Walls.txm",	mimeType="application/octet-stream")] protected var Map34_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_3_40.txm",		mimeType="application/octet-stream")] protected var Map40_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_3_40Walls.txm",	mimeType="application/octet-stream")] protected var Map40_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_3_41.txm",		mimeType="application/octet-stream")] protected var Map41_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_3_41Walls.txm",	mimeType="application/octet-stream")] protected var Map41_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_3_42.txm",		mimeType="application/octet-stream")] protected var Map42_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_3_42Walls.txm",	mimeType="application/octet-stream")] protected var Map42_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_3_43.txm",		mimeType="application/octet-stream")] protected var Map43_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_3_43Walls.txm",	mimeType="application/octet-stream")] protected var Map43_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_3_44.txm",		mimeType="application/octet-stream")] protected var Map44_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_3_44Walls.txm",	mimeType="application/octet-stream")] protected var Map44_Data_Walls:Class;

		//this handles initializing everything
		override public function create():void{
			GameNumber = 4;
			GoalMapX = 2;
			GoalMapY = 3;
			InitializeMap(2, 4);

			//set up item positions
			gkey.trueX		= 128;
			gkey.trueY 		= 112;
			bkey.trueX		= 200;
			bkey.trueY		= 56;
			wkey.trueX		= 120;
			wkey.trueY		= 88;
			sword.trueX		= 136;
			sword.trueY		= 112;
			grail.trueX		= 224;
			grail.trueY 	= 104;
			bridge.trueX	= 144;
			bridge.trueY	= 104;
			magnet.trueX	= 272;
			magnet.trueY	= 56;
			
			//object room IDs
			gkey.roomIDX	= 3;
			gkey.roomIDY	= 0;
			bkey.roomIDX	= 3;
			bkey.roomIDY	= 3;
			wkey.roomIDX	= 1;
			wkey.roomIDY	= 0;
			sword.roomIDX	= 4;
			sword.roomIDY	= 4;
			bridge.roomIDX	= 1;
			bridge.roomIDY	= 1;
			magnet.roomIDX	= 3;
			magnet.roomIDY	= 1;
			grail.roomIDX	= 1;
			grail.roomIDY	= 3;
			ggate.roomIDX	= 2;
			ggate.roomIDY	= 4;
			bgate.roomIDX	= 0;
			bgate.roomIDY	= 2;
			wgate.roomIDX	= 4;
			wgate.roomIDY	= 2;
			GDragon.roomIDX	= 0;
			GDragon.roomIDY	= 3;
			YDragon.roomIDX	= 4;
			YDragon.roomIDY	= 3;
			
			//dummy RDragon
			RDragon.roomIDX	= 10;
			RDragon.Target = new Dot(1000, 1000);
			
			//move around the dragons
			GDragon.trueX	= FlxG.width/2;
			YDragon.trueX	= FlxG.width/2;

			//Load Maps
			LoadMap();

			//Flash the screen
			FlxG.flash.start(0xFFFFFF00);
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
		
		override public function MapExists(NewMapX:uint, NewMapY:uint):Boolean{

			var CurrentMap:String = String(NewMapX) + String(NewMapY);
			
			//load data
			switch(CurrentMap){
				default:
					return false;
					break;
				case '00':
					return true;
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
				case '23':
					return true;
					break;	
				case '24':
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
				case '40':
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
				if (CurrentMapX == 0 && CurrentMapY == 2){
					Player.y = FlxG.height-50;
				}else if (CurrentMapX == 4 && CurrentMapY == 2){
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
			//no mazes on this map
				//normal movement
				CurrentMapX -= 1;
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
				//normal movement
				CurrentMapX += 1;
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
				case '00':
					CurrentMap_Walls.loadMap(new Map00_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map00_Data_Floor,Tileset,8,8);
					break;	
				case '01':
					CurrentMap_Walls.loadMap(new Map01_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map01_Data_Floor,Tileset,8,8);
					break;	
				case '02':
					CurrentMap_Walls.loadMap(new Map02_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map02_Data_Floor,Tileset,8,8);
					break;	
				case '03':
					CurrentMap_Walls.loadMap(new Map03_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map03_Data_Floor,Tileset,8,8);
					break;	
				case '04':
					CurrentMap_Walls.loadMap(new Map04_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map04_Data_Floor,Tileset,8,8);
					break;	
				case '10':
					CurrentMap_Walls.loadMap(new Map10_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map10_Data_Floor,Tileset,8,8);
					break;	
				case '11':
					CurrentMap_Walls.loadMap(new Map11_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map11_Data_Floor,Tileset,8,8);
					break;	
				case '13':
					CurrentMap_Walls.loadMap(new Map13_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map13_Data_Floor,Tileset,8,8);
					break;	
				case '14':
					CurrentMap_Walls.loadMap(new Map14_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map14_Data_Floor,Tileset,8,8);
					break;	
				case '23':
					CurrentMap_Walls.loadMap(new Map23_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map23_Data_Floor,Tileset,8,8);
					break;	
				case '24':
					CurrentMap_Walls.loadMap(new Map24_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map24_Data_Floor,Tileset,8,8);
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
					break;	
				case '34':
					CurrentMap_Walls.loadMap(new Map34_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map34_Data_Floor,Tileset,8,8);
					break;	
				case '40':
					CurrentMap_Walls.loadMap(new Map40_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map40_Data_Floor,Tileset,8,8);
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










