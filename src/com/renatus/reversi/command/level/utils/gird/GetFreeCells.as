package com.renatus.reversi.command.level.utils.gird {
	import com.renatus.reversi.Config;
	import com.renatus.reversi.command.level.utils.gird.ACheck;
	/**
	 * 
	 */
	public class GetFreeCells extends ACheck {
		
		public function getFreeCells(grid:Vector.<int>, id1:int, id2:int, clear:int) : Boolean {
			init(id1, id2, clear);
			for (var i:int = 0, l:int = grid.length; i < l; i++) {
				if (grid[i] == clear) {
					return true;
				}
			}
			return false;
		}
	}
}