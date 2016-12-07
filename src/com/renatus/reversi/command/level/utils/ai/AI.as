package com.renatus.reversi.command.level.utils.ai {
	
	import com.demonsters.debugger.MonsterDebugger;
	import com.renatus.reversi.Config;
	import com.renatus.reversi.command.level.utils.gird.GetAvailable;
	import com.renatus.reversi.command.level.utils.gird.NextStep;
	import flash.geom.Point;
	/**
	 * 
	 */
	public class AI {
		
		private var _id1:int;
		private var _id2:int;
		private var _clear:int;
		private var _depth:int;
		private var _available:GetAvailable;
		private var _nextStep:NextStep;
		private var _evalCalc:EvalCalc;
		private var _totalSteps:int;
		
		public function AI() {
			_available = new GetAvailable();
			_nextStep = new NextStep();
			_evalCalc = new EvalCalc(Config.WIDTH, Config.HEIGHT, CostList.COST);
		}
		
		public function getStep(grid:Vector.<int>, id1:int, id2:int , clear:int, depth:int):Point {
			_totalSteps = 0;
			_id1 = id1;
			_id2 = id2;
			_clear = clear;
			_depth = depth;
			var date:Date = new Date();
			var availList:Array = _available.check(grid, id1, id2, clear);
			var bestStep:BestStepInfo = getForMax(grid, availList, 1, int.MAX_VALUE, int.MIN_VALUE);
			MonsterDebugger.trace(this, new Date().time - date.time+" " + _totalSteps + "  " + int( _totalSteps / (new Date().time - date.time) * 1000 ) / 1000);
			return new Point(bestStep.j, bestStep.i);
		}
		
		private function getForMax(grid:Vector.<int>, availList:Array, step:int, min:int , max:int ):BestStepInfo {
			_totalSteps++;
			var bestStep:BestStepInfo = new BestStepInfo(int.MIN_VALUE);
			var curStep:BestStepInfo = new BestStepInfo(int.MIN_VALUE);
			var newEvenl:int;
			var nextAvail:Array;
			var nextGrid:Vector.<int>;
			for (var i:int = 0, l:int = availList.length; i < l; i++) {
				nextGrid = _nextStep.getNewGrid(availList[i].y, availList[i].x, grid, _id1, _id2, _clear);
				if (step == _depth) {
					curStep.eval = _evalCalc.calc(nextGrid, _id1, _id2);
					_totalSteps++;
				} else {
					nextAvail = _available.check(nextGrid, _id2, _id1, _clear);
					if (nextAvail.length == 0 ) {
						curStep.eval = _evalCalc.calc(nextGrid, _id1, _id2);
						_totalSteps++;
					} else {
						curStep = getForMin(nextGrid, nextAvail, step + 1, min, max);
					}
				}		
				if (bestStep.eval <= curStep.eval) {
					bestStep.eval = curStep.eval;
					bestStep.i = availList[i].y;
					bestStep.j = availList[i].x;
				}
				if (bestStep.eval > max) {
					max = bestStep.eval;
				}
				if (min < bestStep.eval) {
					return bestStep;
				}
			}
			return bestStep;
		}
			
		private function getForMin(grid:Vector.<int>, availList:Array, step:int, min:int , max:int ):BestStepInfo {
			_totalSteps++;
			var bestStep:BestStepInfo = new BestStepInfo(int.MAX_VALUE);
			var curStep:BestStepInfo = new BestStepInfo(int.MAX_VALUE);
			var newEvenl:int;
			var nextAvail:Array;
			var nextGrid:Vector.<int>;
			for (var i:int = 0, l:int = availList.length; i < l; i++) {
				nextGrid = _nextStep.getNewGrid(availList[i].y, availList[i].x, grid, _id2, _id1, _clear);
				if (step == _depth) {
					curStep.eval = _evalCalc.calc(nextGrid, _id1, _id2);
					_totalSteps++;
				} else {
					nextAvail = _available.check(nextGrid, _id1, _id2, _clear);
					if (nextAvail.length == 0 || step == _depth) {
						curStep.eval = _evalCalc.calc(nextGrid, _id1, _id2);
						_totalSteps++;
					} else {
						curStep = getForMax(nextGrid, nextAvail, step + 1, min, max);
					}
				}
				if (bestStep.eval >= curStep.eval) {
					bestStep.eval = curStep.eval;
					bestStep.i = availList[i].y;
					bestStep.j = availList[i].x;
				}
				if (bestStep.eval < min) {
					min = bestStep.eval;
				}
				if (max > bestStep.eval) {
					return bestStep;
				}				
			}
			return bestStep;
		}
	}
}