package {
	
	import net.flashpunk.World;
	import net.flashpunk.FP;
	
	public class GameWorld extends World {
		
		public function GameWorld() {
			this.add(new Player());
			this.add(new Pellet());
		}
		
	}

}