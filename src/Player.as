package {
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.Sfx;
	import flash.system.System;
	import net.flashpunk.FP;
	
	public class Player extends Entity {
		
		public function Player() {
			
			this.graphic = new Image(this.PLAYER_SPRITE);
			this.crash = new Sfx(this.PLAYER_CRASH_SOUND);
			
			Input.define("Right", Key.D, Key.RIGHT);
			Input.define("Left", Key.A, Key.LEFT);
			Input.define("Up", Key.W, Key.UP);
			Input.define("Down", Key.S, Key.DOWN);
			
			this.dx = 0;
			this.dy = 0;
			
			this.x = ((StaticDefines.WINDOW_WIDTH >> 1) - 1) * StaticDefines.TILE_WIDTH;
			this.y = ((StaticDefines.WINDOW_HEIGHT >> 1) - 1) * StaticDefines.TILE_WIDTH;
			
			this.setHitbox(StaticDefines.TILE_WIDTH, StaticDefines.TILE_WIDTH);
			
			this.grewLast = false;
			
			this.tail = new Tail();
			
		}
		
		[Embed(source = "assets/testSprites/markerBig.png")] private const PLAYER_SPRITE:Class;
		
		//https://freesound.org/people/JapanYoshiTheGamer/sounds/361262/
		[Embed(source = "assets/testSounds/crash.mp3")] private const PLAYER_CRASH_SOUND:Class;
		
		private var crash:Sfx;
		
		private var tail:Tail;
		
		private var grewLast:Boolean;
		
		private var dx:Number;
		private var dy:Number;
		
		private var lastX:Number;
		private var lastY:Number;
		
		override public function update():void {
			
			this.handleInput();
			this.handleMovement();
			this.handleCollision();
			
		}
		
		private function handleInput():void {
			
			if (Input.pressed("Right") && this.dx >= 0) {
				this.dx = StaticDefines.TILE_WIDTH;
				this.dy = 0;
			}
			else if (Input.pressed("Left") && this.dx <= 0) {
				this.dx = -StaticDefines.TILE_WIDTH;
				this.dy = 0;
			}
			else if (Input.pressed("Up") && this.dy <= 0) {
				this.dx = 0;
				this.dy = -StaticDefines.TILE_WIDTH;
			}
			else if (Input.pressed("Down") && this.dy >= 0) {
				this.dx = 0;
				this.dy = StaticDefines.TILE_WIDTH;
			}
			
		}
		
		private function handleMovement():void {
			
			this.lastX = this.x;
			this.lastY = this.y;
			
			this.x += this.dx;
			this.y += this.dy;
			
			if (this.x > (StaticDefines.WINDOW_WIDTH - 1) * StaticDefines.TILE_WIDTH) {
				this.x = 0;
			}
			else if (this.x < 0) {
				this.x = (StaticDefines.WINDOW_WIDTH - 1) * StaticDefines.TILE_WIDTH;
			}
			
			if (this.y > (StaticDefines.WINDOW_HEIGHT - 1) * StaticDefines.TILE_WIDTH) {
				this.y = 0;
			}
			if (this.y < 0) {
				this.y = (StaticDefines.WINDOW_HEIGHT - 1) * StaticDefines.TILE_WIDTH;
			}
			
		}
		
		private function handleCollision():void {
			
			var p:Pellet = this.collide("pellet", this.x, this.y) as Pellet;
			var t:TailSegment = this.collide("tail", this.x, this.y) as TailSegment;
			
			if (this.tail.size() > 0 && !this.grewLast) {
				this.tail.shift(this.lastX, this.lastY);
			}
			
			if (p) {
				p.destroy();
				this.tail.grow(this.x, this.y);
				this.grewLast = true;
			}
			else if (t) {
				trace("Game over!\nScore: " + this.tail.size());
				this.crash.play();
				FP.world.removeAll();
			}
			else if (this.grewLast) {
				this.grewLast = false;
			}
			
			
			
		}
		
	}

}