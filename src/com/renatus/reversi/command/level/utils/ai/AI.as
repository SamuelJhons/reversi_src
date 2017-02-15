package com.renatus.reversi.command.level.utils.ai {
	
	import com.renatus.reversi.Config;
	import com.renatus.reversi.command.level.utils.gird.GetAvailable;
	import com.renatus.reversi.command.level.utils.gird.NextStep;
	/**
	 * Алгоритм, выполняющий поиск наилучшего хода по правилу минимакса 4
	 * с приминением альфа-бета отсечения
	 */
	public class AI {
		/**
		 * ID фишки на доске, которая принадлежит текущему игроку
		 */
		private var _id1:int;
		/**
		 * ID фишки на доске, которая принадлежит противнику
		 */
		private var _id2:int;
		/**
		 * ID пустого поля
		 */
		private var _clear:int;
		/**
		 * Глубина расчета шагов
		 */
		private var _depth:int;
		/**
		 * Объект, которому делегируется поиск ячеек, в которые возможно выподнить ход
		 */
		private var _available:GetAvailable;
		/**
		 * Объект, который генерирует новую сетку на основе выбранного хода
		 */
		private var _nextStep:NextStep;
		
		public function AI() {
			_available = new GetAvailable();
			_nextStep = new NextStep();
		}
		
		/**
		 * Определяет позицию наилучшего хода
		 * @param	grid - сетка игрового поля
		 * @param	id1 - ID фишки на доске, которая принадлежит текущему игроку
		 * @param	id2 - ID фишки на доске, которая принадлежит противнику
		 * @param	clear - ID пустого поля
		 * @param	depth - глубина расчета шагов
		 * @return позиция наилучшего хода
		 */
		public function getStep(grid:Vector.<int>, id1:int, id2:int , clear:int, depth:int):int {
			_id1 = id1;
			_id2 = id2;
			_clear = clear;
			_depth = depth;
			var availList:Array = _available.check(grid, id1, id2, clear);
			var bestStep:BestStepInfo = getForMax(grid, availList, 1, int.MAX_VALUE, int.MIN_VALUE);
			return bestStep.index;
		}
		
		/**
		 * Определяет наилучший вариант хода для текущего игрока
		 * @param	grid - сетка игрового поля
		 * @param	availList - спсиок возможных ходов
		 * @param	step - текущий ход
		 * @param	min - известное минимальное значение
		 * @param	max - известное максимальное значение
		 * @return позиция наилучшего хода
		 */
		private function getForMax(grid:Vector.<int>, availList:Array, step:int, min:int , max:int ):BestStepInfo {
			var bestStep:BestStepInfo = new BestStepInfo(int.MIN_VALUE);
			var curStep:BestStepInfo = new BestStepInfo(int.MIN_VALUE);
			var nextAvail:Array;
			var nextGrid:Vector.<int>;
			for (var i:int = 0, l:int = availList.length; i < l; i++) {
				nextGrid = _nextStep.getNewGrid(availList[i], grid, _id1, _id2, _clear);
				if (step == _depth) {
					curStep.eval = calc(nextGrid, _id1, _id2, CostList.COST);
				} else {
					nextAvail = _available.check(nextGrid, _id2, _id1, _clear);
					if (nextAvail.length == 0 ) {
						curStep.eval = calc(nextGrid, _id1, _id2, CostList.COST);
					} else {
						curStep = getForMin(nextGrid, nextAvail, step + 1, min, max);
					}
				}		
				if (bestStep.eval <= curStep.eval) {
					bestStep.eval = curStep.eval;
					bestStep.index = availList[i];
					if (bestStep.eval > max) {
						max = bestStep.eval;
					}
					if (min < bestStep.eval) {
						return bestStep;
					}
				}			
			}
			return bestStep;
		}
		
		/**
		 * Определяет наилучший вариант хода для противника
		 * @param	grid - сетка игрового поля
		 * @param	availList - спсиок возможных ходов
		 * @param	step - текущий ход
		 * @param	min - известное минимальное значение
		 * @param	max - известное максимальное значение
		 * @return позиция наилучшего хода
		 */
		private function getForMin(grid:Vector.<int>, availList:Array, step:int, min:int , max:int ):BestStepInfo {
			var bestStep:BestStepInfo = new BestStepInfo(int.MAX_VALUE);
			var curStep:BestStepInfo = new BestStepInfo(int.MAX_VALUE);
			var nextAvail:Array;
			var nextGrid:Vector.<int>;
			for (var i:int = 0, l:int = availList.length; i < l; i++) {
				nextGrid = _nextStep.getNewGrid(availList[i], grid, _id2, _id1, _clear);
				if (step == _depth) {
					curStep.eval = calc(nextGrid, _id1, _id2, CostList.COST);
				} else {
					nextAvail = _available.check(nextGrid, _id1, _id2, _clear);
					if (nextAvail.length == 0) {
						curStep.eval = calc(nextGrid, _id1, _id2, CostList.COST);
					} else {
						curStep = getForMax(nextGrid, nextAvail, step + 1, min, max);
					}
				}
				if (bestStep.eval >= curStep.eval) {
					bestStep.eval = curStep.eval;
					bestStep.index = availList[i];
					if (bestStep.eval < min) {
						min = bestStep.eval;
					}
					if (max > bestStep.eval) {
						return bestStep;
					}	
				}			
			}
			return bestStep;
		}
		
		/**
		 * Определяет вес хода
		 * @param	grid - сетка игрового поля
		 * @param	id1 - ID фишки на доске, которая принадлежит текущему игроку
		 * @param	id2 - ID фишки на доске, которая принадлежит противнику
		 * @param	cost - список веса каждой ячейки
		 * @return вес хода
		 */
		private function calc(grid:Vector.<int>, id1:int, id2:int, cost:Vector.<int>):int {
			var eval:int = 0;
			for (var i:int = 0, l:int = grid.length; i < l; i++) {		
				switch(grid[i]) {
					case id1:
						eval += cost[i];
						break;
					case id2:
						eval -= cost[i];
						break;
				}
			}
			return eval;
		}
	}
}