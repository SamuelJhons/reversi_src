package com.renatus.reversi.command.level.utils.gird {
	import com.demonsters.debugger.MonsterDebugger;
	import com.renatus.reversi.Config;
	import com.renatus.reversi.command.level.utils.gird.ACheck;
	/**
	 * 
	 */
	public class GetAvailable extends ACheck {		
		
		/**
		 * Проверка массива на наличие возможных ходов
		 * @param	grid	-	масcив ячеек
		 * @param	id1	-	ID текущего игрока
		 * @param	id2 -	ID противника
		 * @param	clear	-	ID пустой ячейки
		 * @return
		 */
		public function check(grid:Vector.<int>, id1:int, id2:int, clear:int) : Array {
			init(id1, id2, clear);
			var list:Array = [];
			for (var i:int = 0; i < _size; i++) {
				if (grid[i] == clear) {
					checkAllDirections(i, grid, list);
				}
			}
			return list;
		}
		
		/**
		 * Запускает проверку всех направлений на наличие возможных ходов
		 * @param	i	-	I положение ячейки
		 * @param	j	-	J положение ячейки
		 * @param	grid	-	масив ячеек
		 * @param	list	-	список ячеек, для добавления возможных ходов
		 */
		private function checkAllDirections(index:int, grid:Vector.<int>, list:Array ):void {
			for (var k:int = 0, l:int = _dir.length; k < l; k++) {
				if (checkDirection(index, grid, _dir[k]) != 0) {
					list[list.length] = index;
				}
			}
		}
	}
}