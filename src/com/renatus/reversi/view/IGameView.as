package com.renatus.reversi.view {
	import flash.events.IEventDispatcher;
	import starling.display.Sprite;
	import starling.events.EventDispatcher;
	import starling.utils.AssetManager;
	
	/**
	 * 
	 */
	internal interface IGameView {
		
		function init(cont:Sprite):void
		function prepare():void;
	}
	
}