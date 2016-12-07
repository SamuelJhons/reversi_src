package com.renatus.reversi.view.utils {
	
	import com.renatus.reversi.Config;
	import flash.geom.Point;
	import starling.animation.Transitions;
	import starling.core.Starling;
	import starling.display.DisplayObject;
	/**
	 * ...
	 */
	public class LevelAnimation {
		
		public function showGrid(grid:Array):void {
			var time:Number = 0.4;
			var delay:Number = 0.1;
			var shiftDelay:Number = 0.1;
			var target:DisplayObject;
			var targetY:int;
			for (var i:int = 0, l:int = Config.WIDTH; i < l; i++) {
				for (var j:int = 0, l2:int = Config.HEIGHT; j < l2; j++) {
					target = grid[j][i];
					target.visible = true;
					targetY = target.y;
					target.y -= target.stage.stageHeight + target.height * j;
					Starling.juggler.removeTweens(target);
					Starling.juggler.tween( target, time, { y:targetY, delay:delay + j / 100 , transition:Transitions.EASE_OUT_BACK} );
				}
				delay += shiftDelay;
			}
		}
	}
}