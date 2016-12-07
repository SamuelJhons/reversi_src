package com.renatus.reversi.command.level.utils.ai {
	/**
	 * 
	 */
	public class BestStepInfo {
		
		public var i:int;
		public var j:int;
		public var eval:int;
		
		public function BestStepInfo(value:int) {
			eval = value;
		}
		
	}

}