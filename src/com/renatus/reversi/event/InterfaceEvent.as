package com.renatus.reversi.event 
{
	/**
	 * 
	 */
	public class InterfaceEvent {
		
		private static const NAME:String				=	"InterfaceEvent";
		/**
		 * Обновление конфигурации UI
		 */
		public static const UPDATE_CFG:String			=	NAME + "UpdateCfg";
		/**
		 * Отобразить интерфейс
		 */
		public static const SHOW:String					=	NAME + "Show";
		/**
		 * Убрать интерфейс
		 */
		public static const HIDE:String					=	NAME + "Hide";
		/**
		 * Инициализация частиц
		 */
		public static const INIT_PARTICLES:String		=	NAME + "InitParticles";
		/**
		 * Выставляет кол-во фишек первого игрока
		 */
		public static const SET_FIRST_COUNT:String		=	NAME + "SetFirstCount";
		/**
		 * Выставляет кол-во фишек второго игрока
		 */
		public static const SET_SECOND_COUNT:String		=	NAME + "SetSecondCount";
		
		/**
		 * Обработка нажатия кнопки PAUSE
		 */
		public static const UI_LEVEL_PAUSE:String		=	NAME + "UiLevelPause";
		
	}

}