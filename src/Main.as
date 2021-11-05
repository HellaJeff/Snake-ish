package {
	
	import net.flashpunk.Engine;
	import net.flashpunk.FP;

	public class Main extends Engine {
		
		public function Main():void {
			super(StaticDefines.WINDOW_WIDTH * StaticDefines.TILE_WIDTH, StaticDefines.WINDOW_HEIGHT * StaticDefines.TILE_WIDTH, 5, false);
			FP.world = new GameWorld;
		}
		
	}
	
}