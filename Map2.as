package{
	import org.flixel.*;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import AdventureLibrary;
 
	public class Map2 extends AdventureMap{
		//load media		
		//map tilesets		
		[Embed(source="Maps/Adventure_NormalMapTiles.png")] protected var Tileset:Class;
		
		//map data files
		[Embed(source="Maps/NormalMap_00.txm",		mimeType="application/octet-stream")] protected var Map00_Data2:Class;
		[Embed(source="Maps/NormalMap_00Walls.txm",	mimeType="application/octet-stream")] protected var Map00_Data1:Class;
		[Embed(source="Maps/NormalMap_01.txm",		mimeType="application/octet-stream")] protected var Map01_Data2:Class;
		[Embed(source="Maps/NormalMap_01Walls.txm",	mimeType="application/octet-stream")] protected var Map01_Data1:Class;
		[Embed(source="Maps/NormalMap_06.txm",		mimeType="application/octet-stream")] protected var Map06_Data2:Class;
		[Embed(source="Maps/NormalMap_06Walls.txm",	mimeType="application/octet-stream")] protected var Map06_Data1:Class;
		[Embed(source="Maps/NormalMap_10.txm",		mimeType="application/octet-stream")] protected var Map10_Data2:Class;
		[Embed(source="Maps/NormalMap_10Walls.txm",	mimeType="application/octet-stream")] protected var Map10_Data1:Class;
		[Embed(source="Maps/NormalMap_11.txm",		mimeType="application/octet-stream")] protected var Map11_Data2:Class;
		[Embed(source="Maps/NormalMap_11Walls.txm",	mimeType="application/octet-stream")] protected var Map11_Data1:Class;
		[Embed(source="Maps/NormalMap_12.txm",		mimeType="application/octet-stream")] protected var Map12_Data2:Class;
		[Embed(source="Maps/NormalMap_12Walls.txm",	mimeType="application/octet-stream")] protected var Map12_Data1:Class;
		[Embed(source="Maps/NormalMap_13.txm",		mimeType="application/octet-stream")] protected var Map13_Data2:Class;
		[Embed(source="Maps/NormalMap_13Walls.txm",	mimeType="application/octet-stream")] protected var Map13_Data1:Class;
		[Embed(source="Maps/NormalMap_14.txm",		mimeType="application/octet-stream")] protected var Map14_Data2:Class;
		[Embed(source="Maps/NormalMap_14Walls.txm",	mimeType="application/octet-stream")] protected var Map14_Data1:Class;
		[Embed(source="Maps/NormalMap_15.txm",		mimeType="application/octet-stream")] protected var Map15_Data2:Class;
		[Embed(source="Maps/NormalMap_15Walls.txm",	mimeType="application/octet-stream")] protected var Map15_Data1:Class;
		[Embed(source="Maps/NormalMap_16.txm",		mimeType="application/octet-stream")] protected var Map16_Data2:Class;
		[Embed(source="Maps/NormalMap_16Walls.txm",	mimeType="application/octet-stream")] protected var Map16_Data1:Class;
		[Embed(source="Maps/NormalMap_25.txm",		mimeType="application/octet-stream")] protected var Map25_Data2:Class;
		[Embed(source="Maps/NormalMap_25Walls.txm",	mimeType="application/octet-stream")] protected var Map25_Data1:Class;
		[Embed(source="Maps/NormalMap_26.txm",		mimeType="application/octet-stream")] protected var Map26_Data2:Class;
		[Embed(source="Maps/NormalMap_26Walls.txm",	mimeType="application/octet-stream")] protected var Map26_Data1:Class;
		[Embed(source="Maps/NormalMap_27.txm",		mimeType="application/octet-stream")] protected var Map27_Data2:Class;
		[Embed(source="Maps/NormalMap_27Walls.txm",	mimeType="application/octet-stream")] protected var Map27_Data1:Class;
		[Embed(source="Maps/NormalMap_28.txm",		mimeType="application/octet-stream")] protected var Map28_Data2:Class;
		[Embed(source="Maps/NormalMap_28Walls.txm",	mimeType="application/octet-stream")] protected var Map28_Data1:Class;
		[Embed(source="Maps/NormalMap_34.txm",		mimeType="application/octet-stream")] protected var Map34_Data2:Class;
		[Embed(source="Maps/NormalMap_34Walls.txm",	mimeType="application/octet-stream")] protected var Map34_Data1:Class;
		[Embed(source="Maps/NormalMap_35.txm",		mimeType="application/octet-stream")] protected var Map35_Data2:Class;
		[Embed(source="Maps/NormalMap_35Walls.txm",	mimeType="application/octet-stream")] protected var Map35_Data1:Class;
		[Embed(source="Maps/NormalMap_36.txm",		mimeType="application/octet-stream")] protected var Map36_Data2:Class;
		[Embed(source="Maps/NormalMap_36Walls.txm",	mimeType="application/octet-stream")] protected var Map36_Data1:Class;
		[Embed(source="Maps/NormalMap_37.txm",		mimeType="application/octet-stream")] protected var Map37_Data2:Class;
		[Embed(source="Maps/NormalMap_37Walls.txm",	mimeType="application/octet-stream")] protected var Map37_Data1:Class;
		[Embed(source="Maps/NormalMap_38.txm",		mimeType="application/octet-stream")] protected var Map38_Data2:Class;
		[Embed(source="Maps/NormalMap_38Walls.txm",	mimeType="application/octet-stream")] protected var Map38_Data1:Class;
		[Embed(source="Maps/NormalMap_39.txm",		mimeType="application/octet-stream")] protected var Map39_Data2:Class;
		[Embed(source="Maps/NormalMap_39Walls.txm",	mimeType="application/octet-stream")] protected var Map39_Data1:Class;
		[Embed(source="Maps/NormalMap_3A.txm",		mimeType="application/octet-stream")] protected var Map3A_Data2:Class;
		[Embed(source="Maps/NormalMap_3AWalls.txm",	mimeType="application/octet-stream")] protected var Map3A_Data1:Class;
		[Embed(source="Maps/NormalMap_3B.txm",		mimeType="application/octet-stream")] protected var Map3B_Data2:Class;
		[Embed(source="Maps/NormalMap_3BWalls.txm",	mimeType="application/octet-stream")] protected var Map3B_Data1:Class;
		[Embed(source="Maps/NormalMap_46.txm",		mimeType="application/octet-stream")] protected var Map46_Data2:Class;
		[Embed(source="Maps/NormalMap_46Walls.txm",	mimeType="application/octet-stream")] protected var Map46_Data1:Class;
		[Embed(source="Maps/NormalMap_47.txm",		mimeType="application/octet-stream")] protected var Map47_Data2:Class;
		[Embed(source="Maps/NormalMap_47Walls.txm",	mimeType="application/octet-stream")] protected var Map47_Data1:Class;
		[Embed(source="Maps/NormalMap_48.txm",		mimeType="application/octet-stream")] protected var Map48_Data2:Class;
		[Embed(source="Maps/NormalMap_48Walls.txm",	mimeType="application/octet-stream")] protected var Map48_Data1:Class;
		[Embed(source="Maps/NormalMap_49.txm",		mimeType="application/octet-stream")] protected var Map49_Data2:Class;
		[Embed(source="Maps/NormalMap_49Walls.txm",	mimeType="application/octet-stream")] protected var Map49_Data1:Class;
		[Embed(source="Maps/NormalMap_4A.txm",		mimeType="application/octet-stream")] protected var Map4A_Data2:Class;
		[Embed(source="Maps/NormalMap_4AWalls.txm",	mimeType="application/octet-stream")] protected var Map4A_Data1:Class;
		[Embed(source="Maps/NormalMap_59.txm",		mimeType="application/octet-stream")] protected var Map59_Data2:Class;
		[Embed(source="Maps/NormalMap_59Walls.txm",	mimeType="application/octet-stream")] protected var Map59_Data1:Class;
		[Embed(source="Maps/NormalMap_5A.txm",		mimeType="application/octet-stream")] protected var Map5A_Data2:Class;
		[Embed(source="Maps/NormalMap_5AWalls.txm",	mimeType="application/octet-stream")] protected var Map5A_Data1:Class;
		[Embed(source="Maps/NormalMap_5B.txm",		mimeType="application/octet-stream")] protected var Map5B_Data2:Class;
		[Embed(source="Maps/NormalMap_5BWalls.txm",	mimeType="application/octet-stream")] protected var Map5B_Data1:Class;

		//this handles initializing everything
		override public function create():void{
			GameNumber = 2;
			GoalMapX = 3;
			GoalMapY = 4;
			InitializeMap(3, 5);

			//set up item positions
			gkey.trueX		= 50;
			gkey.trueY 		= 120;
			bkey.trueX		= 64;
			bkey.trueY		= 150;
			wkey.trueX		= 85;
			wkey.trueY		= 110;
			sword.trueX		= 50;
			sword.trueY		= 180;
			grail.trueX		= 170;
			grail.trueY 	= 110;
			bridge.trueX	= ((FlxG.width/2)-(32));
			bridge.trueY	= (FlxG.height/2);
			magnet.trueX	= (FlxG.width/2);
			magnet.trueY	= (FlxG.height/2);
			
			//object room IDs
			gkey.roomIDX	= 4;
			gkey.roomIDY	= 9;
			sword.roomIDX	= 3;
			sword.roomIDY	= 5;
			bkey.roomIDX	= 2;
			bkey.roomIDY	= 8;
			wkey.roomIDX	= 1;
			wkey.roomIDY	= 6;
			bridge.roomIDX	= 4;
			bridge.roomIDY	= 10;
			magnet.roomIDX	= 3;
			magnet.roomIDY	= 11;
			grail.roomIDX	= 1;
			grail.roomIDY	= 0;
			ggate.roomIDX	= 3;
			ggate.roomIDY	= 5;
			bgate.roomIDX	= 1;
			bgate.roomIDY	= 3;
			wgate.roomIDX	= 3;
			wgate.roomIDY	= 9;
			GDragon.roomIDX	= 3;
			GDragon.roomIDY	= 10;
			YDragon.roomIDX	= 2;
			YDragon.roomIDY	= 6;
			RDragon.roomIDX	= 1;
			RDragon.roomIDY	= 0;
			
			//Load Maps
			LoadMap();
						
			//Flash the screen
			FlxG.flash.start(0xFFFFFF00);
		}	
		
		//this function handles moving one screen up		
		override public function MoveUp():void{
			var NewMapX:uint = CurrentMapX;
			var NewMapY:uint = CurrentMapY;
			//Water Maze
			if(NewMapX == 2 && NewMapY == 5){
				NewMapX	= 0;
				NewMapY	= 6;
			}else if(NewMapX == 0 && NewMapY == 0){
				NewMapX = 0;
				NewMapY = 1;
			}else{
				NewMapY -= 1;
			}
			
			if(MapExists(NewMapX, NewMapY)){
				//water maze
				if(CurrentMapX == 2 && CurrentMapY == 5){
					CurrentMapX = 0;
					CurrentMapY = 6;
				}else if
				//Black Castle Maze
				(CurrentMapX == 0 && CurrentMapY == 0){
					CurrentMapX = 0;
					CurrentMapY = 1;
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
				//Load Map
				LoadMap();
			}else{
				Player.y	= 0;
			}	
		}

		//this function handles moving one screen down		
		override public function MoveDown():void{
			var NewMapX:uint = CurrentMapX;
			var NewMapY:uint = CurrentMapY;
			//Water Maze
			if(NewMapX == 0 && NewMapY == 6){
				NewMapX	= 2;
				NewMapY	= 5;
			}else if(NewMapX == 0 && NewMapY == 1){
				NewMapX = 0;
				NewMapY = 0;
			}else{
				NewMapY += 1;
			}
			
			if(MapExists(NewMapX, NewMapY)){
				//water maze
				if(CurrentMapX == 0 && CurrentMapY == 6){
					CurrentMapX = 2;
					CurrentMapY = 5;
				}else if
				//Black Castle Maze
				(CurrentMapX == 0 && CurrentMapY == 1){
					CurrentMapX = 0;
					CurrentMapY = 0;
				}else{
					//normal movement
					CurrentMapY += 1;
				}
			
				//move player's item
				if(Player.HasItem){
					Player.CurrentItem.roomIDX = CurrentMapX;
					Player.CurrentItem.roomIDY = CurrentMapY;
				}
						
				Player.LastDirection = Player.DOWN;

				//special behavior for screens with gates
				if (CurrentMapX == 3 && CurrentMapY == 5){
					Player.y = FlxG.height-50;
				}else if (CurrentMapX == 1 && CurrentMapY == 3){
					Player.y = FlxG.height-50;
				}else if (CurrentMapX == 3 && CurrentMapY == 9){
					Player.y = FlxG.height-50;
				}else{
					Player.y = 0;
				}
			
				//Load Map
				LoadMap();
			}else{
				Player.y	= FlxG.height - 8;
			}
		}

		//this function handles moving one screen to the left		
		override public function MoveLeft():void{
			//water maze
			if(CurrentMapX == 0 && CurrentMapY == 6){
				CurrentMapX = 1;
				CurrentMapY = 4;
			}else if(CurrentMapX == 1 && CurrentMapY == 4){
				CurrentMapX = 1;
				CurrentMapY = 6;
			}else if(CurrentMapX == 1 && CurrentMapY == 5){
				CurrentMapX = 2;
				CurrentMapY = 5;
			}else if
			//Black Castle Maze	
			(CurrentMapX == 0 && CurrentMapY == 0){
				CurrentMapX = 1;
				CurrentMapY = 1;
			}else if(CurrentMapX == 0 && CurrentMapY == 1){
				CurrentMapX = 1;
				CurrentMapY = 0;
			}else if
			//Dark Cave Maze
			(CurrentMapX == 4 && CurrentMapY == 8){
				CurrentMapX = 4;
				CurrentMapY = 9;
			}else if(CurrentMapX == 4 && CurrentMapY == 9){
				CurrentMapX = 4;
				CurrentMapY = 8;
			}else if
			//White Castle Maze
			(CurrentMapX == 2 && CurrentMapY == 7){
				CurrentMapX = 3;
				CurrentMapY = 7;
			}else if(CurrentMapX == 2 && CurrentMapY == 8){
				CurrentMapX = 3;
				CurrentMapY = 8;
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
			//Load Map
			LoadMap();			
		}
		
		//this function handles moving one screen to the right
		override public function MoveRight():void{
			//water maze
			if(CurrentMapX == 1 && CurrentMapY == 4){
				CurrentMapX = 0;
				CurrentMapY = 6;
			}else if(CurrentMapX == 1 && CurrentMapY == 6){
				CurrentMapX = 1;
				CurrentMapY = 4;
			}else if(CurrentMapX == 2 && CurrentMapY == 5){
				CurrentMapX = 1;
				CurrentMapY = 5;
			}else if
			//Black Castle Maze
			(CurrentMapX == 1 && CurrentMapY == 0){
				CurrentMapX = 0;
				CurrentMapY = 1;
			}else if(CurrentMapX == 1 && CurrentMapY == 1){
				CurrentMapX = 0;
				CurrentMapY = 0;
			}else if
			//Dark Cave Maze
			(CurrentMapX == 4 && CurrentMapY == 8){
				CurrentMapX = 4;
				CurrentMapY = 9;
			}else if(CurrentMapX == 4 && CurrentMapY == 9){
				CurrentMapX = 4;
				CurrentMapY = 8;
			}else if
			//White Castle Maze
			(CurrentMapX == 3 && CurrentMapY == 7){
				CurrentMapX = 2;
				CurrentMapY = 7;
			}else if(CurrentMapX == 3 && CurrentMapY == 8){
				CurrentMapX = 2;
				CurrentMapY = 8;
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
			//Load Map
			LoadMap();			
		}
		
		override public function MapExists(NewMapX:uint, NewMapY:uint):Boolean{
			var NMY:String = new String();
			switch(NewMapY){
				default:
					NMY = String(NewMapY);
					break;
				case 10:
					NMY = "A";
					break;
				case 11:
					NMY = "B";
					break;
				case 12:
					NMY = "C";
					break;
				case 13:
					NMY = "D";
					break;
				case 14:
					NMY = "E";
					break;
				case 15:
					NMY = "F";
					break;
			}
			var CurrentMap:String = String(NewMapX) + NMY;
			
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
				case '06':
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
				case '16':
					return true;
					break;	
				case '25':
					return true;
					break;	
				case '26':
					return true;
					break;	
				case '27':
					return true;
					break;				
				case '28':
					return true;
					break;		
				case '34':
					return true;
					break;		
				case '35':
					return true;
					break;		
				case '36':
					return true;
					break;		
				case '37':
					return true;
					break;		
				case '38':
					return true;
					break;		
				case '39':
					return true;
					break;		
				case '3A':
					return true;
					break;		
				case '3B':
					return true;
					break;		
				case '46':
					return true;
					break;		
				case '47':
					return true;
					break;		
				case '48':
					return true;
					break;		
				case '49':
					return true;
					break;		
				case '4A':
					return true;
					break;		
				case '59':
					return true;
					break;		
				case '5A':
					return true;
					break;		
				case '5B':
					return true;
					break;		
			}
		}		
		
		//this function handles loading the correct map and displaying the correct everything
		override public function LoadMap():void{
		
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
			
			//set weather effects to default to off
			InCave = false;
			StopSnow();
			StopBlizzard();
			
			//load data
			switch(AdventureLibrary.HexCondense(CurrentMapX, CurrentMapY)){
				case '00':
					CurrentMap_Walls.loadMap(new Map00_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map00_Data2,Tileset,8,8);
					InCave = true;
					break;
				case '01':
					CurrentMap_Walls.loadMap(new Map01_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map01_Data2,Tileset,8,8);
					InCave = true;
					break;
				case '06':
					CurrentMap_Walls.loadMap(new Map06_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map06_Data2,Tileset,8,8);
					break;
				case '10':
					CurrentMap_Walls.loadMap(new Map10_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map10_Data2,Tileset,8,8);
					InCave = true;
					break;
				case '11':
					CurrentMap_Walls.loadMap(new Map11_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map11_Data2,Tileset,8,8);
					InCave = true;
					break;
				case '12':
					CurrentMap_Walls.loadMap(new Map12_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map12_Data2,Tileset,8,8);
					break;
				case '13':
					CurrentMap_Walls.loadMap(new Map13_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map13_Data2,Tileset,8,8);
					break;
				case '14':
					CurrentMap_Walls.loadMap(new Map14_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map14_Data2,Tileset,8,8);
					break;
				case '15':
					CurrentMap_Walls.loadMap(new Map15_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map15_Data2,Tileset,8,8);
					break;
				case '16':
					CurrentMap_Walls.loadMap(new Map16_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map16_Data2,Tileset,8,8);
					break;
				case '25':
					CurrentMap_Walls.loadMap(new Map25_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map25_Data2,Tileset,8,8);
					break;
				case '26':
					CurrentMap_Walls.loadMap(new Map26_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map26_Data2,Tileset,8,8);
					break;
				case '27':
					CurrentMap_Walls.loadMap(new Map27_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map27_Data2,Tileset,8,8);
					StartBlizzard();
					break;
				case '28':
					CurrentMap_Walls.loadMap(new Map28_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map28_Data2,Tileset,8,8);
					StartBlizzard();
					break;
				case '34':
					CurrentMap_Walls.loadMap(new Map34_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map34_Data2,Tileset,8,8);
					break;
				case '35':
					CurrentMap_Walls.loadMap(new Map35_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map35_Data2,Tileset,8,8);
					break;
				case '36':
					CurrentMap_Walls.loadMap(new Map36_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map36_Data2,Tileset,8,8);
					break;
				case '37':
					CurrentMap_Walls.loadMap(new Map37_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map37_Data2,Tileset,8,8);
					StartBlizzard();
					break;
				case '38':
					CurrentMap_Walls.loadMap(new Map38_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map38_Data2,Tileset,8,8);
					StartBlizzard();
					break;
				case '39':
					CurrentMap_Walls.loadMap(new Map39_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map39_Data2,Tileset,8,8);
					StartSnowing();
					break;
				case '3A':
					CurrentMap_Walls.loadMap(new Map3A_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map3A_Data2,Tileset,8,8);
					StartSnowing();
					break;
				case '3B':
					CurrentMap_Walls.loadMap(new Map3B_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map3B_Data2,Tileset,8,8);
					StartSnowing();
					break;
				case '46':
					CurrentMap_Walls.loadMap(new Map46_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map46_Data2,Tileset,8,8);
					break;
				case '47':
					CurrentMap_Walls.loadMap(new Map47_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map47_Data2,Tileset,8,8);
					break;
				case '48':
					CurrentMap_Walls.loadMap(new Map48_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map48_Data2,Tileset,8,8);
					InCave = true;
					break;
				case '49':
					CurrentMap_Walls.loadMap(new Map49_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map49_Data2,Tileset,8,8);
					InCave = true;
					break;
				case '4A':
					CurrentMap_Walls.loadMap(new Map4A_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map4A_Data2,Tileset,8,8);
					InCave = true;
					break;
				case '59':
					CurrentMap_Walls.loadMap(new Map59_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map59_Data2,Tileset,8,8);
					break;
				case '5A':
					CurrentMap_Walls.loadMap(new Map5A_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map5A_Data2,Tileset,8,8);
					break;
				case '5B':
					CurrentMap_Walls.loadMap(new Map5B_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map5B_Data2,Tileset,8,8);
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










