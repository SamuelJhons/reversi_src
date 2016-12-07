package com.renatus.reversi.event {
	/**
	 * 
	 */
	public class LevelEvent {
		
		private static const NAME:String				=	"LevelEvent";
		
		public static const UPDATE_CFG:String			=	NAME + "UpdateCfg";
		
		public static const CLEAR:String				=	NAME + "Clear";
		
		public static const SHOW:String					=	NAME + "Show";
		
		public static const HIDE:String					=	NAME + "Hide";
		
		public static const ADD_ITEM:String				=	NAME + "AddItem";
		
		public static const SWITCH_ITEM:String			=	NAME + "SwitchItem";
		
		public static const DISABLE_ITEMS:String		=	NAME + "DisableItems";
		
		public static const ENABLE_ITEM:String			=	NAME + "EnableItem";
		
		public static const ENABLE_LEVEL:String			=	NAME + "EnableLevel";
		
		public static const DISABLE_LEVEL:String		=	NAME + "DisableLevel"
		
		
		public static const UI_ITEM_SELECT:String		=	NAME + "UiItemSelect";
		
	}

}