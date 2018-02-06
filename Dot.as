package{

	import org.flixel.*;
	import flash.ui.Keyboard;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	public class Dot extends FlxSprite{
	
		//media
		//graphics
		[Embed(source="Images/Dot.png")] protected var ImgDot:Class;

		//needed for dragon following		
		public var LastDirection:Number	= 0;
		public var LEFT:Number			= 0;
		public var RIGHT:Number			= 1;
		public var UP:Number			= 2;
		public var DOWN:Number			= 3;
		
		
		public var Alive:Boolean				= true;
		public var JawDir:Number				= 0;
		
		
		//item holding
		public var CurrentItem:AdventureItem;
		public var HasItem:Boolean 				= false;
		public var NoPickup:Boolean 			= false;
		public var Nothing:AdventureItem;
		public var InJaws:Boolean				= false;
		
		
		public var OnBridge:Boolean				= false;
		
		//used in walking animations
		public var Moving:Boolean				= false;
		
		private var GameNumber:Number;
		
		//constructor
		public function Dot(GNumber:Number, X:Number = 0, Y:Number = 0){
			GameNumber = GNumber;
			super(X,Y);
			loadGraphic(ImgDot,true,true,8);
			
			height 	= 8;
			width  	= 8;
			
			maxVelocity.x = 150;
			maxVelocity.y = 150;
			
			drag.x = 5000;
			drag.y = 5000;
			
			Nothing = new AdventureItem(0,0,0,0);
			
			//create animations
			addAnimation("Idle", 			[0], 			5, 	false);
			addAnimation("WalkNorth", 		[3,4,3,5],		10, true);
			addAnimation("WalkSouth", 		[0,1,0,2],		10, true);
			addAnimation("WalkEast", 		[10,9,11,9],	10, true);
			addAnimation("WalkWest", 		[7,6,8,6],		10, true);
			addAnimation("WalkNorthEast", 	[21,22,21,23], 	10, true);
			addAnimation("WalkNorthWest", 	[18,19,18,20], 	10, true);
			addAnimation("WalkSouthEast", 	[15,16,15,17], 	10, true);
			addAnimation("WalkSouthWest", 	[12,13,12,14],	10, true);
		}
		
		//OSHT, fucking dragon ate me!
		public function eaten():void{
			if(Alive){
				FlxG.play(AdventureLibrary.DragonDieSF);
				Alive = false;
				destroy();
				kill();
			}
		}
		
		//update
		public override function update():void{
			if(Alive){
				acceleration.x = 0;
				acceleration.y = 0;
				
				if(InJaws){	
					if((FlxG.keys.LEFT || FlxG.keys.A) && JawDir == RIGHT){
						InJaws = false;
						if((FlxG.keys.UP || FlxG.keys.W)){
								play("WalkNorthWest");
							}else if((FlxG.keys.DOWN || FlxG.keys.S)){
								play("WalkSouthWest");
							}else{
								play("WalkWest");
						}
						acceleration.x = -drag.y;
					}	
					if((FlxG.keys.RIGHT || FlxG.keys.D) && JawDir == LEFT){
						InJaws = false;
							if((FlxG.keys.UP || FlxG.keys.W)){
								play("WalkNorthEast");
							}else if((FlxG.keys.DOWN || FlxG.keys.S)){
								play("WalkSouthEast");
							}else{
								play("WalkEast");
							}
						acceleration.x = drag.y;
					}
				}else{
					//Movement	
					if((FlxG.keys.LEFT || FlxG.keys.A)){
							if((FlxG.keys.UP || FlxG.keys.W)){
								play("WalkNorthWest");
							}else if((FlxG.keys.DOWN || FlxG.keys.S)){
								play("WalkSouthWest");
							}else{
								play("WalkWest");
						}
						acceleration.x = -drag.y;
					}	
					if((FlxG.keys.UP || FlxG.keys.W)){
						if((FlxG.keys.LEFT || FlxG.keys.A)){
							play("WalkNorthWest");
						}else if((FlxG.keys.RIGHT || FlxG.keys.D)){
							play("WalkNorthEast");
						}else{
							play("WalkNorth");
						}
						acceleration.y = -drag.x;
					}	
					if((FlxG.keys.DOWN || FlxG.keys.S)){
							if((FlxG.keys.LEFT || FlxG.keys.A)){
								play("WalkSouthWest");
							}else if((FlxG.keys.RIGHT || FlxG.keys.D)){
								play("WalkSouthEast");
							}else{
								play("WalkSouth");
							}
						acceleration.y = drag.x;
					}
					if((FlxG.keys.RIGHT || FlxG.keys.D)){
							if((FlxG.keys.UP || FlxG.keys.W)){
								play("WalkNorthEast");
							}else if((FlxG.keys.DOWN || FlxG.keys.S)){
								play("WalkSouthEast");
							}else{
								play("WalkEast");
							}
						acceleration.x = drag.y;
					}
				}
				
				//stop animating
				if((FlxG.keys.justReleased("UP")) || (FlxG.keys.justReleased("LEFT")) || (FlxG.keys.justReleased("DOWN")) || (FlxG.keys.justReleased("RIGHT"))
				 || (FlxG.keys.justReleased("W")) || (FlxG.keys.justReleased("A")) || (FlxG.keys.justReleased("S")) || (FlxG.keys.justReleased("D"))){
					Moving = false;
					play("Idle");
				}
				
				
				//action button
				if(FlxG.keys.SPACE){
					//drop item
					if(HasItem){
						CurrentItem.Grabbed = false;
						HasItem 	= false;
						NoPickup 	= true;
						FlxG.play(AdventureLibrary.PlayerDropItemSF);
					}
				}
				
				//pick up item code
				if (NoPickup){
					if(!overlaps(CurrentItem)){
						NoPickup=false;
						CurrentItem = Nothing;
					}
				}
				
			}		
			super.update();
			//make items "stick" to you
			if(HasItem){
				CurrentItem.x = x+CurrentItem.xoffset;
				CurrentItem.y = y+CurrentItem.yoffset;
			}
		}
		
		public function GiveItem(NewItem:AdventureItem):void{
			if(!NoPickup){
				CurrentItem = NewItem;
				HasItem = true;
				CurrentItem.xoffset = ((CurrentItem.x)-(x));
				CurrentItem.yoffset = ((CurrentItem.y)-(y));
				CurrentItem.Grabbed = true;
				//play sound effect
				FlxG.play(AdventureLibrary.PlayerGetItemSF);
				super.update();
			}
		}
	}
}
