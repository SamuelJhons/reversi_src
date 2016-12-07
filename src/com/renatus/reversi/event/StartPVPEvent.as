package com.renatus.reversi.event {
	/**
	 * 
	 */
	public class StartPVPEvent {
		
		private static const NAME:String				=	"StartPVPEvent";
		
		public static const UPDATE_CFG:String			=	NAME + "UpdateCfg";
		
		public static const SHOW:String					=	NAME + "Show";
		
		public static const HIDE:String					=	NAME + "Hide";
		
		public static const UI_CHANGE_DIFF:String		=	NAME + "UiChangeDifficult";
		
		public static const UI_CHANGE_COLOR:String		=	NAME + "UiChangeColor";
		
		public static const UI_BACK:String				=	NAME + "UiBack";
		
		public static const UI_START:String				=	NAME + "UiStart"
	}
}