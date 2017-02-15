package com.renatus.reversi.view {
	
	import com.renatus.reversi.Config;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.utils.AssetManager;
	/**
	 * 
	 */
	internal class BackgroundView extends AView implements IGameView {
		
		public function prepare():void {
			_cont.addChild(new Image(_uiFactory.getTexture("background")));
			_cont.width = Config.screenWidth;
			_cont.height = Config.screenHeight;
			_cont.visible = true;
		}
	}
}