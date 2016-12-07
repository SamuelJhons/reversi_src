package com.renatus.reversi.command.level {
	/**
	 * 
	 */
	public class LevelList {
		
		private static const NAME:String			=	"LevelList";
		/**
		 * Подготовка уровня к началу игры
		 * - подготовка модели
		 * - подготовка отображения
		 * - переход к PREP_STEP
		 */
		public static const PREP_LEVEL:String		=	NAME + "PrepLevel";
		/**
		 * Подготовка уровня к выполнению текущего шага игрока || компьютера
		 * - проверка доступных ходов
		 * - подсветка доступных ходов
		 * - переход к STEP
		 */
		public static const PREP_STEP:String		=	NAME + "PrepStep";
		/**
		 * Предоставление возвожности сделать свой выбор игроку || компьютеру
		 * - ожидание выбора игрока
		 * - ожидание выбора компьютера
		 * - переход к PLAYER_CHOICE
		 */
		public static const STEP:String				=	NAME + "Step";
		/**
		 * Обработка выбора игрока
		 * - анимация выбраной ячейки
		 * - анимация захваченых ячеек
		 * - отображение кол-ва 
		 * - переход к PREP_STEP
		 */
		public static const PLAYER_CHOICE:String	=	NAME + "PlayerChoice";
		/**
		 * Проверка след. действия
		 * - проверка окончания игры
		 * - передача хода другому игроку
		 */
		public static const CONDITION:String		=	NAME + "Condition";
		
	}
}