package{
	import org.flixel.*;
	import flash.ui.Keyboard;
	import flash.events.Event;
	import flash.events.KeyboardEvent;

 
	public class GreenMap extends FlxState{
		//Variables and Etc
		private var Player:QTPi;
		
		//Graphics
		[Embed(source="Data/GreenMaptiles.png")] 		protected var RedMap_Tiles:Class;
		[Embed(source="Visual/Red_Grid_BG.png")] 		protected var ImgRedBG:Class;
		
		//Music
		[Embed(source="Audio/Creepy Intro Stage.wav.mp3")]	protected var IntroMusic:Class;
		
		//Maps
		[Embed(source="Data/GreenMapmap001.txm",		mimeType="application/octet-stream")] protected var RedMap_Data:Class;
		private var RedTileMap:FlxTilemap;
		
		//Groups
		private var BackgroundGroup:FlxGroup;
		private var TileGroup:FlxGroup;
		private var PlayerGroup:FlxGroup;
		private var EnemyGroup:FlxGroup;
		private var ItemGroup:FlxGroup;
		private var ObjectGroup:FlxGroup;
		
		//this handles initializing everything
		override public function create():void{			
			//make mouse visible
			FlxG.mouse.hide();
			
			//Initialize THINGS
			initGame();
			
			super.update();
		}
		
		protected function initGame():void{
			//Musics
			FlxG.playMusic(IntroMusic);
		
			//Group Initialization
			BackgroundGroup	= new FlxGroup();
			TileGroup 		= new FlxGroup();
			PlayerGroup 	= new FlxGroup();
			EnemyGroup		= new FlxGroup();
			ItemGroup		= new FlxGroup();
			ObjectGroup		= new FlxGroup();
			
			//Load Map
			RedTileMap	= new FlxTilemap();
			RedTileMap.loadMap(new RedMap_Data, RedMap_Tiles, 16, 16, 0, 0, 1, 3);
			
			FlxG.worldBounds = RedTileMap.getBounds();
			
			//Create Player
			Player = new QTPi(24, 24);
			Player.Unlock();
			
			//create background
			for(var i:uint = 0; i < (RedTileMap.width/16); i++){
				for (var j:uint = 0; j < (RedTileMap.height/16); j++){
					var ax:uint	= i*16;
					var ay:uint	= j*16;
					var a:FlxSprite = new FlxSprite(ax, ay);
					a.loadGraphic(ImgRedBG, true, true, 16, 16);
					a.addAnimation("Loopme", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], 10, true);
					a.play("Loopme");
					BackgroundGroup.add(a);
				}
			}
			for(i = 0; i < (RedTileMap.width/16); i++){
				for (j = 0; j < (RedTileMap.height/16); j++){
					var bx:uint	= i*16;
					var by:uint	= j*16;
					var b:FlxSprite = new FlxSprite(bx, by);
					b.loadGraphic(ImgRedBG, true, true, 16, 16);
					b.addAnimation("Loopme2", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], 5, true);
					b.play("Loopme2");
					BackgroundGroup.add(b);
				}
			}
			
			//Add Groups
			TileGroup.add(RedTileMap);
			PlayerGroup.add(Player);
			ItemGroup.add(new OrbOfGoal(672, 72));
			ItemGroup.add(new DoubleJump(288, 552));
			/*
			EnemyGroup.add(new Frog(100, 64));
			EnemyGroup.add(new Frog(200, 64));
			EnemyGroup.add(new Frog(300, 64));
			EnemyGroup.add(new Frog(100, 300));
			EnemyGroup.add(new Frog(200, 128));
			EnemyGroup.add(new Frog(300, 235));*/
			//EnemyGroup.add(new RedRobot(88, 72));
			EnemyGroup.add(new RedRobot(56, 328));
			EnemyGroup.add(new RedRobot(96, 552));
			EnemyGroup.add(new RedRobot(528, 728));
			EnemyGroup.add(new RedRobot(560, 536));
			EnemyGroup.add(new RedRobot(352, 312));
			EnemyGroup.add(new RedRobot(600, 120));
			EnemyGroup.add(new RedRobot(736, 344));
			EnemyGroup.add(new RedRobot(256, 504));
			
			//Object Group - all objects need to be on this
			ObjectGroup.add(EnemyGroup);
			ObjectGroup.add(PlayerGroup);
			
			add(BackgroundGroup);
			add(TileGroup);
			add(ItemGroup);
			add(EnemyGroup);
			add(PlayerGroup);
			
			//Camera
//			FlxG.camera = new FlxCamera(0, 0, 640, 480);
			FlxG.camera.follow(Player, FlxCamera.STYLE_PLATFORMER);
			FlxG.camera.bounds = RedTileMap.getBounds();
		}
		
		//this is the update() function
		override public function update():void{
			//restart button
			if(FlxG.keys.R){
				FlxG.switchState(new HubMap());
			}
		
			for(var i:uint = 0; i < EnemyGroup.members.length; i ++){
				if(EnemyGroup.members[i] != null){
					var TileID:uint = RedTileMap.getTile(uint(EnemyGroup.members[i].x/16), uint(EnemyGroup.members[i].y/16));
					if(TileID == 1 || TileID == 2){
						EnemyGroup.members[i].KillMe();
					}
				}
			}
			
			//kill player in lava
			var PTileID:uint = RedTileMap.getTile(uint(Player.x/16), uint(Player.y/16));
			if(PTileID == 1 || PTileID == 2){
				Player.KillMe();
			}
			

			if(FlxG.overlap(PlayerGroup, EnemyGroup)){
				Player.GotKilled();
			}
			
			//this is the wingame one
			if(FlxG.overlap(PlayerGroup, ItemGroup.members[0])){
				FlxG.switchState(new HubMap());
			}
			
			//double jump ability
			if(FlxG.overlap(PlayerGroup, ItemGroup.members[1])){
				Player.UnlockDoubleJump();
				ItemGroup.members[1].x = -50;
			}
			
			
			super.update();			
			FlxG.collide(ObjectGroup, TileGroup);
		}
	}
}
