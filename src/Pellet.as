package {
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Sfx;
	
	public class Pellet extends Entity {
		
		public function Pellet() {
			
			this.graphic = new Image(Pellet.PELLET_SPRITE);
			this.collect = new Sfx(Pellet.PELLET_COLLECT_SOUND);
			
			this.setHitbox(StaticDefines.TILE_WIDTH, StaticDefines.TILE_WIDTH);
			this.type = "pellet";
			
			this.x = Math.floor(Math.random() * StaticDefines.WINDOW_WIDTH) * StaticDefines.TILE_WIDTH;
			this.y = Math.floor(Math.random() * StaticDefines.WINDOW_HEIGHT) * StaticDefines.TILE_WIDTH;
			
		}
		
		[Embed(source = "assets/testSprites/pelletBig.png")] private static const PELLET_SPRITE:Class;
		
		//https://freesound.org/people/ProjectsU012/sounds/341695/
		[Embed(source = "assets/testSounds/collect.mp3")] private static const PELLET_COLLECT_SOUND:Class;
		
		private var collect:Sfx;
		
		public function destroy():void {
			
			this.collect.play();
			
			FP.world.add(new Pellet());
			
			FP.world.remove(this);
			
		}
		
		override public function added():void {
			super.added();
			
			while (this.collide("tail", this.x, this.y)) {
				this.x = Math.floor(Math.random() * StaticDefines.WINDOW_WIDTH) * StaticDefines.TILE_WIDTH;
				this.y = Math.floor(Math.random() * StaticDefines.WINDOW_HEIGHT) * StaticDefines.TILE_WIDTH;
			}
			
		}
		
	}

}