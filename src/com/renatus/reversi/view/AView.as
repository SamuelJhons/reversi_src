package com.renatus.reversi.view {
	
	import com.renatus.reversi.view.utils.IUIFactory;
	import com.renatus.reversi.view.utils.Localization;
	import com.renatus.reversi.view.utils.PlaceMaker;
	import com.renatus.reversi.view.utils.ShowHideAnimation;
	import com.renatus.reversi.view.utils.UIFactory;
	import starling.display.Sprite;
	import starling.events.EventDispatcher;
	import starling.utils.AssetManager;
	
	/**
	 * 
	 */
	internal class AView extends EventDispatcher {
		
		private var _showHideAnim:ShowHideAnimation;
		
		protected var _cont:Sprite;
		protected var _uiFactory:IUIFactory;
		
		public final function init(cont:Sprite, assets:AssetManager):void {
			_cont = cont;
			_cont.visible = false;
			_uiFactory = new UIFactory(assets);
			_showHideAnim = new ShowHideAnimation();
		}
		
		public function show():void {
			_showHideAnim.show();
			_cont.visible = true;
		}
		
		public function hide():void {
			_showHideAnim.hide();
		}
		
		public function updateGfxCfg(cfg:XML, locale:XML):void {
			var placeMaker:PlaceMaker = new PlaceMaker();
			placeMaker.update(_cont, _cont.name, cfg);
			_showHideAnim.update(_cont, _cont.name, cfg);
			new Localization().parse(cfg, locale, _cont);
		}
	}
}