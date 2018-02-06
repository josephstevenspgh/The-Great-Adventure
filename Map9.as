package{
	import org.flixel.*;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
 
	public class Map9 extends AdventureMap{
		//load media
		
		//map tilesets		
		[Embed(source="Maps/Adventure_ExtendedMap1Tiles.png")] protected var Tileset:Class;
		
		//map data files
		[Embed(source="Maps/ExtendedMap_1_02.txm",		mimeType="application/octet-stream")] protected var Map02_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_1_02Walls.txm",	mimeType="application/octet-stream")] protected var Map02_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_1_10.txm",		mimeType="application/octet-stream")] protected var Map10_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_1_10Walls.txm",	mimeType="application/octet-stream")] protected var Map10_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_1_12.txm",		mimeType="application/octet-stream")] protected var Map12_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_1_12Walls.txm",	mimeType="application/octet-stream")] protected var Map12_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_1_13.txm",		mimeType="application/octet-stream")] protected var Map13_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_1_13Walls.txm",	mimeType="application/octet-stream")] protected var Map13_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_1_15.txm",		mimeType="application/octet-stream")] protected var Map15_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_1_15Walls.txm",	mimeType="application/octet-stream")] protected var Map15_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_1_20.txm",		mimeType="application/octet-stream")] protected var Map20_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_1_20Walls.txm",	mimeType="application/octet-stream")] protected var Map20_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_1_21.txm",		mimeType="application/octet-stream")] protected var Map21_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_1_21Walls.txm",	mimeType="application/octet-stream")] protected var Map21_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_1_22.txm",		mimeType="application/octet-stream")] protected var Map22_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_1_22Walls.txm",	mimeType="application/octet-stream")] protected var Map22_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_1_23.txm",		mimeType="application/octet-stream")] protected var Map23_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_1_23Walls.txm",	mimeType="application/octet-stream")] protected var Map23_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_1_24.txm",		mimeType="application/octet-stream")] protected var Map24_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_1_24Walls.txm",	mimeType="application/octet-stream")] protected var Map24_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_1_25.txm",		mimeType="application/octet-stream")] protected var Map25_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_1_25Walls.txm",	mimeType="application/octet-stream")] protected var Map25_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_1_32.txm",		mimeType="application/octet-stream")] protected var Map32_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_1_32Walls.txm",	mimeType="application/octet-stream")] protected var Map32_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_1_33.txm",		mimeType="application/octet-stream")] protected var Map33_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_1_33Walls.txm",	mimeType="application/octet-stream")] protected var Map33_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_1_35.txm",		mimeType="application/octet-stream")] protected var Map35_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_1_35Walls.txm",	mimeType="application/octet-stream")] protected var Map35_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_1_41.txm",		mimeType="application/octet-stream")] protected var Map41_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_1_41Walls.txm",	mimeType="application/octet-stream")] protected var Map41_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_1_42.txm",		mimeType="application/octet-stream")] protected var Map42_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_1_42Walls.txm",	mimeType="application/octet-stream")] protected var Map42_Data_Walls:Class;

		//this handles initializing everything
		override public function create():void{
			GameNumber = 4;
			GoalMapX = 3;
			GoalMapY = 0;
			InitializeMap(2, 5);

			//set up item positions
			gkey.trueX		= FlxG.width/2;
			gkey.trueY 		= 120;
			bkey.trueX		= 100;
			bkey.trueY		= 150;
			sword.trueX		= (FlxG.width/2);
			sword.trueY		= (FlxG.height/2);
			grail.trueX		= 32;
			grail.trueY 	= 64;
			bridge.trueX	= FlxG.width/2 - 32;
			bridge.trueY	= 32;
			magnet.trueX	= 100;
			magnet.trueY	= 80;
			
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

		
		//this function handles moving one screen up		
		override public function MoveUp():void{
			//no mazes on this map
			if(CurrentMapX == 0 && CurrentMapY == 0){
				CurrentMapX = 0;
				CurrentMapY = 0;
			}else{
				//normal movement
				CurrentMapY -= 1;
			}
			if(Player.HasItem){
				Player.CurrentItem.roomIDX = CurrentMapX;
				Player.CurrentItem.roomIDY = CurrentMapY;
			}
			Player.LastDirection = Player.UP;
			Player.y = FlxG.height-8;
			LoadMap();
		}

		//this function handles moving one screen down		
		override public function MoveDown():void{
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
			if (CurrentMapX == 2 && CurrentMapY == 3){
				Player.y = FlxG.height-50;
			}else if (CurrentMapX == 4 && CurrentMapY == 2){
				Player.y = FlxG.height-50;
			}else{
				Player.y = 0;
			}
			LoadMap();
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
			//disable cave effect
			InCave	= false;
		
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
				case '02':
					CurrentMap_Walls.loadMap(new Map02_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map02_Data_Floor,Tileset,8,8);
					break;	
				case '10':
					CurrentMap_Walls.loadMap(new Map10_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map10_Data_Floor,Tileset,8,8);
					InCave	= true;
					break;	
				case '12':
					CurrentMap_Walls.loadMap(new Map12_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map12_Data_Floor,Tileset,8,8);
					break;	
				case '13':
					CurrentMap_Walls.loadMap(new Map13_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map13_Data_Floor,Tileset,8,8);
					break;	
				case '15':
					CurrentMap_Walls.loadMap(new Map15_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map15_Data_Floor,Tileset,8,8);
					break;	
				case '20':
					CurrentMap_Walls.loadMap(new Map20_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map20_Data_Floor,Tileset,8,8);
					InCave	= true;
					break;	
				case '21':
					CurrentMap_Walls.loadMap(new Map21_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map21_Data_Floor,Tileset,8,8);
					InCave	= true;
					break;	
				case '22':
					CurrentMap_Walls.loadMap(new Map22_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map22_Data_Floor,Tileset,8,8);
					break;	
				case '23':
					CurrentMap_Walls.loadMap(new Map23_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map23_Data_Floor,Tileset,8,8);
					break;	
				case '24':
					CurrentMap_Walls.loadMap(new Map24_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map24_Data_Floor,Tileset,8,8);
					break;	
				case '25':
					CurrentMap_Walls.loadMap(new Map25_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map25_Data_Floor,Tileset,8,8);
					break;	
				case '32':
					CurrentMap_Walls.loadMap(new Map32_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map32_Data_Floor,Tileset,8,8);
					break;	
				case '33':
					CurrentMap_Walls.loadMap(new Map33_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map33_Data_Floor,Tileset,8,8);
					break;	
				case '35':
					CurrentMap_Walls.loadMap(new Map35_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map35_Data_Floor,Tileset,8,8);
					break;	
				case '41':
					CurrentMap_Walls.loadMap(new Map41_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map41_Data_Floor,Tileset,8,8);
					break;	
				case '42':
					CurrentMap_Walls.loadMap(new Map42_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map42_Data_Floor,Tileset,8,8);
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










