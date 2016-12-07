package com.renatus.reversi.view {
	import org.puremvc.as3.patterns.mediator.Mediator;
	import starling.display.Sprite;
	import starling.utils.AssetManager;
	
	/**
	 * 
	 */
	public class AMediator extends Mediator {
		
		protected var _view:IGameView;
		
		public function AMediator(name:String, view:IGameView, cont:Sprite, assets:AssetManager) {
			super(name);
			_view = view;
			_view.init(cont.getChildByName(name) as Sprite, assets);
			_view.prepare();
		}
	}
}