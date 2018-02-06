package{
	import org.flixel.*;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
 
	public class Map8 extends AdventureMap{
		//load media
		
		//map tilesets		
		[Embed(source="Maps/Adventure_ExtendedMap5Tiles.png")] protected var Tileset:Class;
		
		//map data files
		[Embed(source="Maps/ExtendedMap_5_00.txm",		mimeType="application/octet-stream")] protected var Map00_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_5_00Walls.txm",	mimeType="application/octet-stream")] protected var Map00_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_5_03.txm",		mimeType="application/octet-stream")] protected var Map03_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_5_03Walls.txm",	mimeType="application/octet-stream")] protected var Map03_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_5_04.txm",		mimeType="application/octet-stream")] protected var Map04_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_5_04Walls.txm",	mimeType="application/octet-stream")] protected var Map04_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_5_10.txm",		mimeType="application/octet-stream")] protected var Map10_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_5_10Walls.txm",	mimeType="application/octet-stream")] protected var Map10_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_5_14.txm",		mimeType="application/octet-stream")] protected var Map14_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_5_14Walls.txm",	mimeType="application/octet-stream")] protected var Map14_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_5_20.txm",		mimeType="application/octet-stream")] protected var Map20_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_5_20Walls.txm",	mimeType="application/octet-stream")] protected var Map20_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_5_21.txm",		mimeType="application/octet-stream")] protected var Map21_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_5_21Walls.txm",	mimeType="application/octet-stream")] protected var Map21_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_5_22.txm",		mimeType="application/octet-stream")] protected var Map22_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_5_22Walls.txm",	mimeType="application/octet-stream")] protected var Map22_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_5_23.txm",		mimeType="application/octet-stream")] protected var Map23_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_5_23Walls.txm",	mimeType="application/octet-stream")] protected var Map23_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_5_24.txm",		mimeType="application/octet-stream")] protected var Map24_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_5_24Walls.txm",	mimeType="application/octet-stream")] protected var Map24_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_5_32.txm",		mimeType="application/octet-stream")] protected var Map32_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_5_32Walls.txm",	mimeType="application/octet-stream")] protected var Map32_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_5_41.txm",		mimeType="application/octet-stream")] protected var Map41_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_5_41Walls.txm",	mimeType="application/octet-stream")] protected var Map41_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_5_42.txm",		mimeType="application/octet-stream")] protected var Map42_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_5_42Walls.txm",	mimeType="application/octet-stream")] protected var Map42_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_5_43.txm",		mimeType="application/octet-stream")] protected var Map43_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_5_43Walls.txm",	mimeType="application/octet-stream")] protected var Map43_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_5_52.txm",		mimeType="application/octet-stream")] protected var Map52_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_5_52Walls.txm",	mimeType="application/octet-stream")] protected var Map52_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_5_60.txm",		mimeType="application/octet-stream")] protected var Map60_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_5_60Walls.txm",	mimeType="application/octet-stream")] protected var Map60_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_5_61.txm",		mimeType="application/octet-stream")] protected var Map61_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_5_61Walls.txm",	mimeType="application/octet-stream")] protected var Map61_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_5_62.txm",		mimeType="application/octet-stream")] protected var Map62_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_5_62Walls.txm",	mimeType="application/octet-stream")] protected var Map62_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_5_63.txm",		mimeType="application/octet-stream")] protected var Map63_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_5_63Walls.txm",	mimeType="application/octet-stream")] protected var Map63_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_5_64.txm",		mimeType="application/octet-stream")] protected var Map64_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_5_64Walls.txm",	mimeType="application/octet-stream")] protected var Map64_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_5_72.txm",		mimeType="application/octet-stream")] protected var Map72_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_5_72Walls.txm",	mimeType="application/octet-stream")] protected var Map72_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_5_81.txm",		mimeType="application/octet-stream")] protected var Map81_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_5_81Walls.txm",	mimeType="application/octet-stream")] protected var Map81_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_5_82.txm",		mimeType="application/octet-stream")] protected var Map82_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_5_82Walls.txm",	mimeType="application/octet-stream")] protected var Map82_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_5_83.txm",		mimeType="application/octet-stream")] protected var Map83_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_5_83Walls.txm",	mimeType="application/octet-stream")] protected var Map83_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_5_90.txm",		mimeType="application/octet-stream")] protected var Map90_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_5_90Walls.txm",	mimeType="application/octet-stream")] protected var Map90_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_5_91.txm",		mimeType="application/octet-stream")] protected var Map91_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_5_91Walls.txm",	mimeType="application/octet-stream")] protected var Map91_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_5_93.txm",		mimeType="application/octet-stream")] protected var Map93_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_5_93Walls.txm",	mimeType="application/octet-stream")] protected var Map93_Data_Walls:Class;
		[Embed(source="Maps/ExtendedMap_5_94.txm",		mimeType="application/octet-stream")] protected var Map94_Data_Floor:Class;
		[Embed(source="Maps/ExtendedMap_5_94Walls.txm",	mimeType="application/octet-stream")] protected var Map94_Data_Walls:Class;

		//this handles initializing everything
		override public function create():void{
			GameNumber = 8;
			GoalMapX = 4;
			GoalMapY = 1;
			InitializeMap(4, 2);

			//set up item positions
			gkey.trueX		= 200;
			gkey.trueY 		= 112;
			bkey.trueX		= 60;
			bkey.trueY		= 60;
			wkey.trueX		= 174;
			wkey.trueY		= 148;
			sword.trueX		= 157;
			sword.trueY		= 129;
			grail.trueX		= FlxG.width/2;
			grail.trueY 	= FlxG.height/2;
			bridge.trueX	= 144;
			bridge.trueY	= 104;
			magnet.trueX	= FlxG.width/2;
			magnet.trueY	= FlxG.width/2;
			
			//object room IDs
			gkey.roomIDX	= 1;
			gkey.roomIDY	= 0;
			bkey.roomIDX	= 1;
			bkey.roomIDY	= 0;
			wkey.roomIDX	= 9;
			wkey.roomIDY	= 1;
			sword.roomIDX	= 4;
			sword.roomIDY	= 3;
			bridge.roomIDX	= 0;
			bridge.roomIDY	= 0;
			magnet.roomIDX	= 6;
			magnet.roomIDY	= 4;
			grail.roomIDX	= 6;
			grail.roomIDY	= 0;
			ggate.roomIDX	= 4;
			ggate.roomIDY	= 2;
			bgate.roomIDX	= 0;
			bgate.roomIDY	= 1;
			wgate.roomIDX	= 6;
			wgate.roomIDY	= 2;
			GDragon.roomIDX	= 7;
			GDragon.roomIDY	= 2;
			YDragon.roomIDX	= 1;
			YDragon.roomIDY	= 0;
			RDragon.roomIDX	= 6;
			RDragon.roomIDY	= 1;
			
			//move around the dragons
			GDragon.trueX	= FlxG.width/2;
			YDragon.trueX	= FlxG.width/2;
			
			//move player
			//Player.y		= FlxG.height/2;

			//Load Maps
			LoadMap();

			//Flash the screen
			FlxG.flash.start(0xFFFFFF00);
		}	

		
		//this function handles moving one screen up		
		override public function MoveUp():void{
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
		}

		//this function handles moving one screen down		
		override public function MoveDown():void{
			//no mazes on this map
				//normal movement
				CurrentMapY += 1;
			if(Player.HasItem){
				Player.CurrentItem.roomIDX = CurrentMapX;
				Player.CurrentItem.roomIDY = CurrentMapY;
			}
			Player.LastDirection = Player.DOWN;
			//special behavior for screens with gates
			if (CurrentMapX == 4 && CurrentMapY == 2){
				Player.y = FlxG.height-50;
			}else if (CurrentMapX == 6 && CurrentMapY == 2){
				Player.y = FlxG.height-50;
			}else if (CurrentMapX == 0 && CurrentMapY == 1){
				Player.y = FlxG.height-50;
			}else{
				Player.y = 0;
			}
			LoadMap();
		}

		//this function handles moving one screen to the left		
		override public function MoveLeft():void{
			//simple maze on this map
			if(CurrentMapX == 0 && CurrentMapY == 0){
				CurrentMapX = 9;
				CurrentMapY = 0;
			}else if(CurrentMapX == 0 && CurrentMapY == 3){
				CurrentMapX = 9;
				CurrentMapY = 3;
			}else if(CurrentMapX == 0 && CurrentMapY == 4){
				CurrentMapX = 9;
				CurrentMapY = 4;
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
			if(CurrentMapX == 9 && CurrentMapY == 0){
				CurrentMapX = 0;
				CurrentMapY = 0;
			}else if(CurrentMapX == 9 && CurrentMapY == 3){
				CurrentMapX = 0;
				CurrentMapY = 3;
			}else if(CurrentMapX == 9 && CurrentMapY == 4){
				CurrentMapX = 0;
				CurrentMapY = 4;
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
				case '00':
					CurrentMap_Walls.loadMap(new Map00_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map00_Data_Floor,Tileset,8,8);
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
				case '14':
					CurrentMap_Walls.loadMap(new Map14_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map14_Data_Floor,Tileset,8,8);
					break;	
				case '20':
					CurrentMap_Walls.loadMap(new Map20_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map20_Data_Floor,Tileset,8,8);
					break;	
				case '21':
					CurrentMap_Walls.loadMap(new Map21_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map21_Data_Floor,Tileset,8,8);
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
				case '32':
					CurrentMap_Walls.loadMap(new Map32_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map32_Data_Floor,Tileset,8,8);
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
				case '52':
					CurrentMap_Walls.loadMap(new Map52_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map52_Data_Floor,Tileset,8,8);
					break;	
				case '60':
					CurrentMap_Walls.loadMap(new Map60_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map60_Data_Floor,Tileset,8,8);
					break;	
				case '61':
					CurrentMap_Walls.loadMap(new Map61_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map61_Data_Floor,Tileset,8,8);
					break;	
				case '62':
					CurrentMap_Walls.loadMap(new Map62_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map62_Data_Floor,Tileset,8,8);
					break;	
				case '63':
					CurrentMap_Walls.loadMap(new Map63_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map63_Data_Floor,Tileset,8,8);
					break;	
				case '64':
					CurrentMap_Walls.loadMap(new Map64_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map64_Data_Floor,Tileset,8,8);
					break;	
				case '72':
					CurrentMap_Walls.loadMap(new Map72_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map72_Data_Floor,Tileset,8,8);
					break;	
				case '81':
					CurrentMap_Walls.loadMap(new Map81_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map81_Data_Floor,Tileset,8,8);
					break;	
				case '82':
					CurrentMap_Walls.loadMap(new Map82_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map82_Data_Floor,Tileset,8,8);
					InCave = true;
					break;	
				case '83':
					CurrentMap_Walls.loadMap(new Map83_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map83_Data_Floor,Tileset,8,8);
					InCave = true;
					break;	
				case '90':
					CurrentMap_Walls.loadMap(new Map90_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map90_Data_Floor,Tileset,8,8);
					break;	
				case '91':
					CurrentMap_Walls.loadMap(new Map91_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map91_Data_Floor,Tileset,8,8);
					break;	
				case '93':
					CurrentMap_Walls.loadMap(new Map93_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map93_Data_Floor,Tileset,8,8);
					break;	
				case '94':
					CurrentMap_Walls.loadMap(new Map94_Data_Walls,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map94_Data_Floor,Tileset,8,8);
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
