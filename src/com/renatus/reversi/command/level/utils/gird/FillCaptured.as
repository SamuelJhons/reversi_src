package com.renatus.reversi.command.level.utils.gird 
{
	import com.renatus.reversi.command.level.utils.Direction;
	import flash.geom.Point;
	/**
	 * 
	 */
	public class FillCaptured extends ACheck {
		
		public function fill(i:int, j:int, grid:Vector.<int>, id1:int, id2:int, clear:int ):void {
			init(id1, id2, clear);
			for (var k:int = 0, l:int = Direction.ALL.length; k < l; k++) {
				if (checkDirection(i, j, grid, Direction.ALL[k]) != 0) {
					fillCaptured(i, j, grid, Direction.ALL[k]);
				}
			}
		}
		
		private function fillCaptured(i:int, j:int, grid:Vector.<int>, dir:Point):void {
			if (isExist(i + dir.y, j + dir.x)) {
				if (grid[i + dir.y + (j + dir.x) * _width] == _id2) {
					grid[i + dir.y + (j + dir.x) * _width] = _id1;
					fillCaptured(i + dir.y, j + dir.x, grid, dir);
				}
			}
		}
	}
}