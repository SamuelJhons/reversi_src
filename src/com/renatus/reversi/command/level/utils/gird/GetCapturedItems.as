package com.renatus.reversi.command.level.utils.gird {
	import com.demonsters.debugger.MonsterDebugger;
	import com.renatus.reversi.command.level.utils.gird.ACheck;
	import flash.geom.Point;
	/**
	 * Возвращает список захваченных ячеек
	 */
	public class GetCapturedItems extends ACheck {
		
		public function getList(index:int, grid:Vector.<int>, id1:int, id2:int, clear:int ):Array {
			init(id1, id2, clear);
			var list:Array = [];
			for (var k:int = 0, l:int = _dir.length; k < l; k++) {
				if (checkDirection(index, grid, _dir[k]) != 0) {
					fillCaptured(index, grid, _dir[k], list);
				}
			}
			return list;
		}
		
		private function fillCaptured(index:int, grid:Vector.<int>, dir:int, list:Array):void {
			index += dir;
			if (grid[index] == _id2) {
				list[list.length] = index;
				fillCaptured(index, grid, dir, list)
			}
		}
	}
}