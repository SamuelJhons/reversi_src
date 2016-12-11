package com.renatus.reversi.command.level.utils.gird {
	import com.demonsters.debugger.MonsterDebugger;
	import com.renatus.reversi.Config;
	import com.renatus.reversi.command.level.utils.Direction;
	import flash.geom.Point;
	/**
	 * 
	 */
	
	public class ACheck {
		
		
		protected var _dir:Vector.<int>;		
		protected var _id1:int;
		protected var _id2:int;
		protected var _clear:int;
		protected var _width:int;
		protected var _height:int;
		protected var _size:int;
		
		public function ACheck():void {
			_height = Config.HEIGHT;
			_width = Config.WIDTH;
			_size = _height * _width;
			_dir = new Vector.<int>(_width);
			for (var i:int = 0; i < _width; i++) {
				_dir[i] = Direction.ALL[i].y * _width + Direction.ALL[i].x;
			}
		}
		
		protected function init(id1:int, id2:int, clear:int):void {
			_id1 = id1;
			_id2 = id2;
			_clear = clear;
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
		protected function checkDirection(index:int, grid:Vector.<int>, dir:int, count:int = 0):int {
			index += dir;
			if ( 0 <= index && index < _size) {
				switch(grid[index]) {
					case _id1:
						return count;
						break;
					case _id2:
						if ((index + 1) % _width == 0 || index % _width == 0) {
							if (dir == 8 || dir == -8) {
								return checkDirection(index, grid, dir, ++count);
							} else {
								return 0;
							}
						} else {
							return checkDirection(index, grid, dir, ++count);
						}
						break;
					default:
						return 0;
						break;
				}
			} else {
				return 0;
			}
		}
	}
}