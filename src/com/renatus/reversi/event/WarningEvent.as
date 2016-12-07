package com.renatus.reversi.event {
	/**
	 *  
	 */
	public class WarningEvent {
		
		private static const NAME:String				=	"WarningEvent";
		
		public static const UPDATE_CFG:String			=	NAME + "UpdateCfg";
		
		public static const SHOW:String					=	NAME + "Show";
		
		public static const HIDE:String					=	NAME + "Hide";
		
		public static const UI_WARNING_CANCEL:String	=	NAME + "UiWarningCancel";
		
		public static const UI_WARNING_ACCEPT:String	=	NAME + "UiWarningAccept";
		
	}

}