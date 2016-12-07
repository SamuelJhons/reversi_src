package com.renatus.reversi.command.level.utils.ai {
	/**
	 *
	 */
	public class CostList {
		
		public static const COST:Vector.<int> = new <int>[
											10,-5, 5, 5, 5, 5,-5,10,
											-5,-5, 3, 3, 3, 3,-5,-5,
											 5, 3, 1, 1, 1, 1, 3, 5,
											 5, 3, 1, 1, 1, 1, 3, 5,
											 5, 3, 1, 1, 1, 1, 3, 5,
											 5, 3, 1, 1, 1, 1, 3, 5,
											-5,-5, 3, 3, 3, 3,-5,-5,
											10,-5, 5, 5, 5, 5,-5,10
										]
		
	}
}