package com.renatus.reversi.command.level.utils.gird {
	/**
	 *
	 */
	public class NextStep extends ACheck {
		
		/**
		 * Врзвращает новую сетку, с учетом хода в позицию 'index'
		 * @param	index - позиция,в которую выполняется ход
		 * @param	grid - сетка игрового поля
		 * @param	id1 - ID фишки на доске, которая принадлежит текущему игроку
		 * @param	id2 - ID фишки на доске, которая принадлежит противнику
		 * @param	clear - ID пустого поля
		 * @return
		 */
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
		
		/**
		 * Заменяет ID захваченых ячеек на ID текущео игрока
		 * @param	index - начальное положение хода
		 * @param	grid - сетка игрового поля
		 * @param	dir - направление захвата
		 * @param	count - количество захваченых ячеек
		 */
		private function fillCaptured(index:int, grid:Vector.<int>, dir:int, count:int ):void {
			while (count != 0) {
				index += dir;
				grid[index] = _id1;
				count--
			}
		}
	}
}