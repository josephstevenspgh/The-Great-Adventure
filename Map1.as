package{
	import org.flixel.*;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
 
	public class Map1 extends AdventureMap{
		//load media
		
		//map tilesets		
		[Embed(source="Maps/Adventure_EasyMapTiles.png")] protected var Tileset:Class;
		
		//map data files
		[Embed(source="Maps/EasyMap_05.txm",		mimeType="application/octet-stream")] protected var Map05_Data2:Class;
		[Embed(source="Maps/EasyMap_05Walls.txm",	mimeType="application/octet-stream")] protected var Map05_Data1:Class;
		[Embed(source="Maps/EasyMap_10.txm",		mimeType="application/octet-stream")] protected var Map10_Data2:Class;
		[Embed(source="Maps/EasyMap_10Walls.txm",	mimeType="application/octet-stream")] protected var Map10_Data1:Class;
		[Embed(source="Maps/EasyMap_11.txm",		mimeType="application/octet-stream")] protected var Map11_Data2:Class;
		[Embed(source="Maps/EasyMap_11Walls.txm",	mimeType="application/octet-stream")] protected var Map11_Data1:Class;
		[Embed(source="Maps/EasyMap_12.txm",		mimeType="application/octet-stream")] protected var Map12_Data2:Class;
		[Embed(source="Maps/EasyMap_12Walls.txm",	mimeType="application/octet-stream")] protected var Map12_Data1:Class;
		[Embed(source="Maps/EasyMap_13.txm",		mimeType="application/octet-stream")] protected var Map13_Data2:Class;
		[Embed(source="Maps/EasyMap_13Walls.txm",	mimeType="application/octet-stream")] protected var Map13_Data1:Class;
		[Embed(source="Maps/EasyMap_14.txm",		mimeType="application/octet-stream")] protected var Map14_Data2:Class;
		[Embed(source="Maps/EasyMap_14Walls.txm",	mimeType="application/octet-stream")] protected var Map14_Data1:Class;
		[Embed(source="Maps/EasyMap_15.txm",		mimeType="application/octet-stream")] protected var Map15_Data2:Class;
		[Embed(source="Maps/EasyMap_15Walls.txm",	mimeType="application/octet-stream")] protected var Map15_Data1:Class;
		[Embed(source="Maps/EasyMap_24.txm",		mimeType="application/octet-stream")] protected var Map24_Data2:Class;
		[Embed(source="Maps/EasyMap_24Walls.txm",	mimeType="application/octet-stream")] protected var Map24_Data1:Class;
		[Embed(source="Maps/EasyMap_25.txm",		mimeType="application/octet-stream")] protected var Map25_Data2:Class;
		[Embed(source="Maps/EasyMap_25Walls.txm",	mimeType="application/octet-stream")] protected var Map25_Data1:Class;
		[Embed(source="Maps/EasyMap_33.txm",		mimeType="application/octet-stream")] protected var Map33_Data2:Class;
		[Embed(source="Maps/EasyMap_33Walls.txm",	mimeType="application/octet-stream")] protected var Map33_Data1:Class;
		[Embed(source="Maps/EasyMap_34.txm",		mimeType="application/octet-stream")] protected var Map34_Data2:Class;
		[Embed(source="Maps/EasyMap_34Walls.txm",	mimeType="application/octet-stream")] protected var Map34_Data1:Class;
		[Embed(source="Maps/EasyMap_35.txm",		mimeType="application/octet-stream")] protected var Map35_Data2:Class;
		[Embed(source="Maps/EasyMap_35Walls.txm",	mimeType="application/octet-stream")] protected var Map35_Data1:Class;
		[Embed(source="Maps/EasyMap_45.txm",		mimeType="application/octet-stream")] protected var Map45_Data2:Class;
		[Embed(source="Maps/EasyMap_45Walls.txm",	mimeType="application/octet-stream")] protected var Map45_Data1:Class;
		[Embed(source="Maps/EasyMap_46.txm",		mimeType="application/octet-stream")] protected var Map46_Data2:Class;
		[Embed(source="Maps/EasyMap_46Walls.txm",	mimeType="application/octet-stream")] protected var Map46_Data1:Class;
		
		//tutorial related variables
		private var TutorialGroup:FlxGroup;
		private var FadeText:Boolean	= false;

		//this handles initializing everything
		override public function create():void{
			//tutorial init
			TutorialGroup = new FlxGroup();
			TutorialGroup.add(new FlxText(320, 240, 320, "This game was brought to you by Splixel :)"));
			
			GameNumber = 1;
			GoalMapX = 3;
			GoalMapY = 3;
			InitializeMap(3, 4);

			//set up item positions
			gkey.trueX		= 50;
			gkey.trueY 		= 120;
			bkey.trueX		= 80;
			bkey.trueY		= 180;
			sword.trueX		= (FlxG.width/2);
			sword.trueY		= (FlxG.height/2);
			grail.trueX		= (FlxG.width/2);
			grail.trueY 	= (FlxG.height/2);
			bridge.trueX	= 70;
			bridge.trueY	= 150;
			magnet.trueX	= 100;
			magnet.trueY	= 100;
			
			//object room IDs
			gkey.roomIDX	= 3;
			gkey.roomIDY	= 4;
			sword.roomIDX	= 3;
			sword.roomIDY	= 3;
			bkey.roomIDX	= 4;
			bkey.roomIDY	= 6;
			bridge.roomIDX	= 1;
			bridge.roomIDY	= 3;
			magnet.roomIDX	= 1;
			magnet.roomIDY	= 1;
			grail.roomIDX	= 1;
			grail.roomIDY	= 0;
			ggate.roomIDX	= 3;
			ggate.roomIDY	= 4;
			bgate.roomIDX	= 1;
			bgate.roomIDY	= 2;
			GDragon.roomIDX	= 4;
			GDragon.roomIDY	= 6;
			YDragon.roomIDX	= 2;
			YDragon.roomIDY	= 5;
			RDragon.Target = new Dot(1000, 1000);

			//Load Maps
			LoadMap();

			//Flash the screen
			FlxG.flash.start(0xFFFFFF00);
			add(TutorialGroup);
		}	

		
		//this function handles moving one screen up		
		override public function MoveUp():void{
			var NewMapX:uint = CurrentMapX;
			var NewMapY:uint = CurrentMapY;
			//Water Maze
			if(NewMapX == 2 && NewMapY == 4){
				NewMapX	= 0;
				NewMapY	= 5;
			}else{
				NewMapY -= 1;
			}
			
			if(MapExists(NewMapX, NewMapY)){
				//water maze
				if(CurrentMapX == 2 && CurrentMapY == 4){
					CurrentMapX = 0;
					CurrentMapY = 5;
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
			}else{
				Player.y = 0;
			}
		}

		//this function handles moving one screen down		
		override public function MoveDown():void{
			var NewMapX:uint = CurrentMapX;
			var NewMapY:uint = CurrentMapY;
			//Water Maze
			if(NewMapX == 0 && NewMapY == 5){
				NewMapX	= 2;
				NewMapY	= 4;
			}else{
				NewMapY += 1;
			}
			
			if(MapExists(NewMapX, NewMapY)){
				//water maze
				if(CurrentMapX == 0 && CurrentMapY == 5){
					CurrentMapX = 2;
					CurrentMapY = 4;
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
				if (CurrentMapX == 3 && CurrentMapY == 4){
					Player.y = FlxG.height-50;
				}else if (CurrentMapX == 1 && CurrentMapY == 2){
					Player.y = FlxG.height-50;
				}else{
					Player.y = 0;
				}
				LoadMap();
			}else{
				Player.y = FlxG.height - 8;
			}
		}

		//this function handles moving one screen to the left		
		override public function MoveLeft():void{
			var NewMapX:uint = CurrentMapX;
			var NewMapY:uint = CurrentMapY;
			//Water Maze
			if(NewMapX == 0 && NewMapY == 0){
				NewMapX	= 1;
				NewMapY	= 3;
			}else if(NewMapX == 1 && NewMapY == 3){
				NewMapX	= 1;
				NewMapY = 5;
			}else if(NewMapX == 1 && NewMapY == 4){
				NewMapX	= 2;
				NewMapY = 4;
			}else{
				NewMapX -= 1;
			}
			
			if(MapExists(NewMapX, NewMapY)){
				//water maze
				if(CurrentMapX == 0 && CurrentMapY == 5){
					CurrentMapX = 1;
					CurrentMapY = 3;
				}else if(CurrentMapX == 1 && CurrentMapY == 3){
					CurrentMapX = 1;
					CurrentMapY = 5;
				}else if(CurrentMapX == 1 && CurrentMapY == 4){
					CurrentMapX = 2;
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
			}else{
				Player.x = 0;
			}
		}
		
		//this function handles moving one screen to the right
		override public function MoveRight():void{
			var NewMapX:uint = CurrentMapX;
			var NewMapY:uint = CurrentMapY;
			//Water Maze
			if(NewMapX == 1 && NewMapY == 3){
				NewMapX	= 0;
				NewMapY	= 5;
			}else if(NewMapX == 1 && NewMapY == 5){
				NewMapX	= 1;
				NewMapY = 3;
			}else if(NewMapX == 2 && NewMapY == 4){
				NewMapX	= 1;
				NewMapY = 4;
			}else{
				NewMapX += 1;
			}
			
			if(MapExists(NewMapX, NewMapY)){
				//water maze
				if(CurrentMapX == 1 && CurrentMapY == 3){
					CurrentMapX = 0;
					CurrentMapY = 5;
				}else if(CurrentMapX == 1 && CurrentMapY == 5){
					CurrentMapX = 1;
					CurrentMapY = 3;
				}else if(CurrentMapX == 2 && CurrentMapY == 4){
					CurrentMapX = 1;
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
			}else{
				Player.y = FlxG.width - 8;
			}
		}
		
		override public function DoTut():void{
			if(!GrailFound){
				if(FadeText){
					TutorialGroup.members[0].alpha -= (FlxG.elapsed/2.5);
					if(TutorialGroup.members[0].alpha < 0){
						TutorialGroup.members[0].alpha = 0;
						FadeText = false;
					}
				}
			}else{
				TutorialGroup.members[0].alpha = 0;
			}
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
				case '24':
					return true;
					break;	
				case '25':
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
				case '45':
					return true;
					break;				
				case '46':
					return true;
					break;
			}
		}
		
		//this function handles loading the correct map and displaying the correct everything
		override public function LoadMap():void{			
			//Tutorial Texts
			if(CurrentMapX == 3 && CurrentMapY == 4){
				TutorialGroup.members[0] = new FlxText(10, 50, 300, "Keys open matching colored doors");
				TutorialGroup.members[0].setFormat(null, 16, 0xFFFFFF, "center");
				FadeText=true;
			}else if(CurrentMapX == 3 && CurrentMapY == 3){
				TutorialGroup.members[0] = new FlxText(10, 50, 300, "It's dangerous to go alone! Take this!");
				TutorialGroup.members[0].setFormat(null, 16, 0xFFFFFF, "center");
				FadeText=true;
			}else if(CurrentMapX == 3 && CurrentMapY == 5){
				TutorialGroup.members[0] = new FlxText(10, 50, 300, "Find the Holy Grail.");
				TutorialGroup.members[0].setFormat(null, 16, 0xFFFFFF, "center");
				FadeText=true;
			}else if(CurrentMapX == 4 && CurrentMapY == 6){
				TutorialGroup.members[0] = new FlxText(10, 50, 300, "You can only carry one item at a time.");
				TutorialGroup.members[0].setFormat(null, 16, 0xFFFFFF, "center");
				FadeText=true;
			}else if(CurrentMapX == 2 && CurrentMapY == 5){
				TutorialGroup.members[0] = new FlxText(10, 50, 300, "Don't get eaten!");
				TutorialGroup.members[0].setFormat(null, 16, 0xFFFFFF, "center");
				FadeText=true;
			}else if(CurrentMapX == 1 && CurrentMapY == 3){
				TutorialGroup.members[0] = new FlxText(10, 50, 300, "Bridges can cross many things, and can be moved!");
				TutorialGroup.members[0].setFormat(null, 16, 0xFFFFFF, "center");
				FadeText=true;
			}else if(CurrentMapX == 1 && CurrentMapY == 0){
				TutorialGroup.members[0] = new FlxText(10, 50, 300, "Now, return the grail to your Golden Castle!");
				TutorialGroup.members[0].setFormat(null, 16, 0xFFFFFF, "center");
				FadeText=true;
			}
			
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
					CurrentMap_Walls.loadMap(new Map05_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map05_Data2,Tileset,8,8);
					break;	
				case '10':
					CurrentMap_Walls.loadMap(new Map10_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map10_Data2,Tileset,8,8);
					break;	
				case '11':
					CurrentMap_Walls.loadMap(new Map11_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map11_Data2,Tileset,8,8);
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
				case '24':
					CurrentMap_Walls.loadMap(new Map24_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map24_Data2,Tileset,8,8);
					break;	
				case '25':
					CurrentMap_Walls.loadMap(new Map25_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map25_Data2,Tileset,8,8);
					break;	
				case '33':
					CurrentMap_Walls.loadMap(new Map33_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map33_Data2,Tileset,8,8);
					break;	
				case '34':
					CurrentMap_Walls.loadMap(new Map34_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map34_Data2,Tileset,8,8);
					break;	
				case '35':
					CurrentMap_Walls.loadMap(new Map35_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map35_Data2,Tileset,8,8);
					break;	
				case '45':
					CurrentMap_Walls.loadMap(new Map45_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map45_Data2,Tileset,8,8);
					break;				
				case '46':
					CurrentMap_Walls.loadMap(new Map46_Data1,Tileset,8,8);
					CurrentMap_Floor.loadMap(new Map46_Data2,Tileset,8,8);
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










