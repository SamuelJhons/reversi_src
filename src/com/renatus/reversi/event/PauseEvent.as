package com.renatus.reversi.event 
{
	/**
	 * 
	 */
	public class PauseEvent {
		
		private static const NAME:String				=	"PauseEvent";
		
		public static const UPDATE_CFG:String			=	NAME + "UpdateCfg";
		
		public static const SHOW:String					=	NAME + "Show";
		
		public static const HIDE:String					=	NAME + "Hide";
		
		public static const UI_MENU:String				=	NAME + "Menu";
		
		public static const UI_PLAY:String				=	NAME + "Play";
		
		public static const UI_REPLAY:String			=	NAME + "Replay";
		
	}

}