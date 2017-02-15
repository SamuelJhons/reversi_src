package com.renatus.reversi.command.level.utils.ai {
	/**
	 *
	 */
	public class EvalCalc {
		
		private var _width:int;
		private var _height:int;
		private var _cost:Vector.<int>;
		
		public function EvalCalc(width:int , height:int, cost:Vector.<int>) {
			_width = width;
			_height = height;
			_cost = cost;
		}
		
		public function calc(grid:Vector.<int>, id1:int, id2:int):int {
			var index:int, eval:int = 0;
			for (var i:int = 0, l:int = _height; i < l; i++) {
				for (var j:int = 0, l2:int = _width; j < l2; j++) {
					index = i + j * _width;
					switch(grid[index]) {
						case id1:
							eval += _cost[index];
							break;
						case id2:
							eval -= _cost[index];
							break;
					}
				}
			}
			return eval;
		}
	}
}