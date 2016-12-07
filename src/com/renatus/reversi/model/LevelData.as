package com.renatus.reversi.model {
	import flash.utils.Dictionary;
	/**
	 * 
	 */
	public class LevelData {
		
		public static const HUMAN:String	=	"human";
		public static const PC:String		=	"pc";
		
		public static const ITEM_CLEAR:int	=	0;
		public static const ITEM_1:int		=	1;
		public static const ITEM_2:int		=	2;
		/**
		 * Сетка игры, заполняется эл-ми ITEM_1 || ITEM_2 || ITEM_CLEAR
		 */
		public var grid:Vector.<int>;
		/**
		 * ID текущего игрока, может быть ITEM_1 || ITEM_2
		 */
		public var curID:int;
		/**
		 * ID противника, может быть ITEM_1 || ITEM_2
		 */
		public var secID:int;
		/**
		 * Режим игроков ITEM_1 т ITEM_2, может быть HUMAN || PC
		 */
		public var playerMode:Dictionary;
		/**
		 * Количество фишек для ITEM_1 и ITEM_2
		 */
		public var count:Dictionary;
		/**
		 * Кол-во смен ходов, без постановки фики на поле, если switchCount > 1 - игра заканчивается
		 */
		public var switchCount:int;
		/**
		 * Глубина анализац для AI
		 */
		public var aiDifficult:int;
		/**
		 * ID, под которым будет играть PC
		 */
		public var aiID:int;
		
		public function LevelData() {
			playerMode = new Dictionary();
			count = new Dictionary();
			curID = 0;
			aiDifficult = 1;
			aiID = ITEM_2;
		}
	}
}