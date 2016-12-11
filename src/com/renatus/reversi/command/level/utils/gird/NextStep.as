package com.renatus.reversi.command.level.utils.gird {
	/**
	 *
	 */
	public class NextStep extends ACheck {
		
		public function getNewGrid(index:int, grid:Vector.<int>, id1:int, id2:int, clear:int ):Vector.<int> {
			init(id1, id2, clear);
			var newGrid:Vector.<int> = grid.concat()
			var count:int;
			newGrid[index] = id1;
			for (var k:int = 0, l:int = _dir.length; k < l; k++) {
				count = checkDirection(index, newGrid, _dir[k]);
				fillCaptured(index, newGrid, _dir[k], count);
			}
			return newGrid;
		}
		
		private function fillCaptured(index:int, grid:Vector.<int>, dir:int, count:int ):void {
			while (count != 0) {
				index += dir;
				grid[index] = _id1;
				count--
			}
		}
	}
}