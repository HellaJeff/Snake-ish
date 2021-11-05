package {
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	public class TailSegment extends Entity {
		
		public function TailSegment() {
			
			this.graphic = new Image(TailSegment.TAIL_SPRITE);
			
			this.setHitbox(StaticDefines.TILE_WIDTH, StaticDefines.TILE_WIDTH);
			this.type = "tail";
			
		}
		
		//[Embed(source = "assets/testSprites/tailSegmentBig.png")] public static const TAIL_SEGMENT_SPRITE:Class;
		//[Embed(source = "assets/testSprites/tailEndBig.png")] public static const TAIL_END_SPRITE:Class;
		
		[Embed(source = "assets/testSprites/tailSimpleBig.png")] public static const TAIL_SPRITE:Class;
		
		public var lastX:Number;
		public var lastY:Number;
		
	}

}