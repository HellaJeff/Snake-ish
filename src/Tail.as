package {
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	public class Tail extends Entity {
		
		public function Tail() {
			
			this.tailSegments = new Vector.<TailSegment>();
			
		}
		
		private var tailSegments:Vector.<TailSegment>;
		
		public function grow(newX:Number, newY:Number):void {
				
			this.tailSegments.unshift(new TailSegment());
			
			this.tailSegments[0].x = newX;
			this.tailSegments[0].y = newY;
			
			this.tailSegments[0].lastX = newX;
			this.tailSegments[0].lastY = newY;
			
			for (var c:uint = this.tailSegments.length; c > 2; c--) {
				
				this.tailSegments[c - 2].lastX = this.tailSegments[c - 1].x;
				this.tailSegments[c - 2].lastY = this.tailSegments[c - 1].y;
				
			}
			
			FP.world.add(this.tailSegments[0]);
			
		}
		
		public function size():uint {
			return this.tailSegments.length;
		}
		
		public function shift(newX:Number, newY:Number):void {
			
			this.tailSegments[0].lastX = this.tailSegments[0].x;
			this.tailSegments[0].lastY = this.tailSegments[0].y;
			
			this.tailSegments[0].x = newX;
			this.tailSegments[0].y = newY;
			
			for (var c:uint = 1; c < this.tailSegments.length; c++) {
				
				this.tailSegments[c].lastX = this.tailSegments[c].x;
				this.tailSegments[c].lastY = this.tailSegments[c].y;
				
				this.tailSegments[c].x = this.tailSegments[c - 1].lastX;
				this.tailSegments[c].y = this.tailSegments[c - 1].lastY;
				
			}
			
		}
		
	}

}