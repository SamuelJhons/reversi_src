package com.renatus.reversi.command.level.utils.gird {
	import com.renatus.reversi.Config;
	import flash.geom.Point;
	/**
	 * 
	 */
	
	public class ACheck {
		
		protected var _id1:int;
		protected var _id2:int;
		protected var _clear:int;
		protected var _width:int;
		protected var _height:int;
		
		protected function init(id1:int, id2:int, clear:int):void {
			_id1 = id1;
			_id2 = id2;
			_clear = clear;
			_height = Config.HEIGHT;
			_width = Config.WIDTH;
		}
		/**
		 * Проверка конкретного направления на наличие возможного хода
		 * @param	i	-	I положение ячейки
		 * @param	j	-	J положение ячейки
		 * @param	grid	-	масив ячеек
		 * @param	dir	-	направление проверки
		 * @param	count	-	кол-во переворачиваемых элементов
		 * @return
		 */
		protected function checkDirection(i:int, j:int, grid:Vector.<int>, dir:Point, count:int = 0):int {
			if (isExist(i + dir.y, j + dir.x)) {
				switch(grid[(i + dir.y) + (j + dir.x) * _width]) {
					case _id1:
						return count;
						break;
					case _id2:
						return checkDirection(i + dir.y, j + dir.x, grid, dir, ++count);
						break;
					default:
						return 0;
						break;
				}
			} else {
				return 0;
			}
		}
		/**
		 * Проверка нарушения размеров массива
		 * @param	i	-	I положение ячейки
		 * @param	j	-	J положение ячейки
		 * @return
		 */
		protected function isExist(i:int, j:int):Boolean {
			if (i >= 0 && i < _height && j >= 0 && j < _width) {
				return true;
			} else {
				return false;
			}
		}
	}
}