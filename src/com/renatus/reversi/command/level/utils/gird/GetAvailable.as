package com.renatus.reversi.command.level.utils.gird {
	import com.demonsters.debugger.MonsterDebugger;
	import com.renatus.reversi.command.level.utils.Direction;
	import com.renatus.reversi.command.level.utils.gird.ACheck;
	import flash.geom.Point;
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
			for (var i:int = 0, l:int = _height; i < l; i++) {
				for (var j:int = 0, l2:int = _width; j < l2; j++) {
					if (grid[i + j * _width] == clear) {
						checkAllDirections(i, j, grid, list);
					}
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
		private function checkAllDirections(i:int, j:int, grid:Vector.<int>, list:Array ):void {
			for (var k:int = 0, l:int = Direction.ALL.length; k < l; k++) {
				if (checkDirection(i, j, grid, Direction.ALL[k]) != 0) {
					list[list.length] = new Point(j, i);
				}
			}
		}
	}
}