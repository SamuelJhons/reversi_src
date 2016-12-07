package com.renatus.reversi.event {
	/**
	 * 
	 */
	public class GameOverEvent {
		
		private static const NAME:String				=	"GameOverEvent";
		
		public static const UPDATE_CFG:String			=	NAME + "UpdateCfg";
		
		public static const SHOW:String					=	NAME + "Show";
		
		public static const HIDE:String					=	NAME + "Hide";
		
		public static const SET_WIN_TEXT:String			=	NAME + "WinFirst";		
		
		public static const UI_MENU_CLICK:String		=	NAME + "UiMenuClick";
		
		public static const UI_REPLAY_CLICK:String		=	NAME + "UiReplayClick";
	}
}