package com.renatus.reversi.command.level.utils.ai {
	/**
	 * Описывает вес ячеек
	 */
	public class CostList {
		
		public static const COST:Vector.<int> = new <int>[
											25,-5, 5, 5, 5, 5,-5,25,
											-5,-5, 3, 3, 3, 3,-5,-5,
											 5, 3, 1, 1, 1, 1, 3, 5,
											 5, 3, 1, 1, 1, 1, 3, 5,
											 5, 3, 1, 1, 1, 1, 3, 5,
											 5, 3, 1, 1, 1, 1, 3, 5,
											-5,-5, 3, 3, 3, 3,-5,-5,
											25,-5, 5, 5, 5, 5,-5,25
										]
		
	}
}