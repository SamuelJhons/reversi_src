package com.renatus.reversi.command.level.utils.gird {
	import com.renatus.reversi.command.level.utils.Direction;
	import com.renatus.reversi.command.level.utils.gird.ACheck;
	import flash.geom.Point;
	/**
	 * Возвращает список захваченных ячеек
	 */
	public class GetCapturedItems extends ACheck {
		
		public function getList(i:int, j:int, grid:Vector.<int>, id1:int, id2:int, clear:int ):Array {
			init(id1, id2, clear);
			var list:Array = [];
			for (var k:int = 0, l:int = Direction.ALL.length; k < l; k++) {
				if (checkDirection(i, j, grid, Direction.ALL[k]) != 0) {
					fillCaptured(i, j, grid, Direction.ALL[k], list);
				}
			}
			return list;
		}
		
		private function fillCaptured(i:int, j:int, grid:Vector.<int>, dir:Point, list:Array):void {
			if (isExist(i + dir.y, j + dir.x)) {
				if (grid[i + dir.y + (j + dir.x) * _width] == _id2) {
					list[list.length] = new Point(j + dir.x, i + dir.y);
					fillCaptured(i + dir.y, j + dir.x, grid, dir, list)
				}
			}
		}
	}
}