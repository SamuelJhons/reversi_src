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
			var eval:int = 0;
			for (var i:int = 0, l:int = grid.length; i < l; i++) {		
				switch(grid[i]) {
					case id1:
						eval += _cost[i];
						break;
					case id2:
						eval -= _cost[i];
						break;
				}
			}
			return eval;
		}
	}
}