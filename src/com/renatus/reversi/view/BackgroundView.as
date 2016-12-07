package com.renatus.reversi.view {
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.utils.AssetManager;
	/**
	 * 
	 */
	internal class BackgroundView extends AView implements IGameView {
		
		public function prepare():void {
			_cont.addChild(new Image(_uiFactory.getTexture("background")));
			_cont.visible = true;
		}
	}
}