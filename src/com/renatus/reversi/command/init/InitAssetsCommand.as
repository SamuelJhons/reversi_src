package com.renatus.reversi.command.init {
	
	import com.renatus.reversi.model.GameProxy;
	import com.renatus.reversi.model.ProxyName;
	import com.renatus.reversi.model.UiConfig;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import starling.display.Sprite;
	import starling.utils.AssetManager;
	
	/**
	 * 
	 */
	internal class InitAssetsCommand extends SimpleCommand {
		
		public static const PATH:String		=	"source/";
		
		[Embed(source = "../../../../../../gfx/derby.ttf" , embedAsCFF="false", fontFamily="Derby")]
		private static const derby:Class;
		
		override public function execute(notification:INotification):void {
			facade.registerProxy(new GameProxy(ProxyName.UI_CFG, new UiConfig()));
			uiCfg.root = notification.getBody() as Sprite;
			loadAssets();
		}
		
		public function loadAssets():void {
			uiCfg.assets = new AssetManager();
			uiCfg.assets.enqueue(PATH + "ui_config.xml");
			uiCfg.assets.enqueue(PATH + "atlas.png");
			uiCfg.assets.enqueue(PATH + "atlas.xml");
			uiCfg.assets.enqueue(PATH + "locale.xml");
			uiCfg.assets.enqueue(PATH + "particle.pex");
			uiCfg.assets.enqueue(PATH + "sfx/click.mp3");
			uiCfg.assets.enqueue(PATH + "sfx/complete.mp3");
			uiCfg.assets.enqueue(PATH + "sfx/complete.mp3");
			uiCfg.assets.enqueue(PATH + "sfx/menu.mp3");
			uiCfg.assets.enqueue(PATH + "sfx/move.mp3");
			uiCfg.assets.enqueue(PATH + "sfx/notify.mp3");
			uiCfg.assets.enqueue(PATH + "sfx/back.mp3");
			uiCfg.assets.loadQueue(handlerLoadQueue);
		}
		
		private function handlerLoadQueue(ratio:Number):void {
			if (ratio == 1.0) {
				onInitAsets();
			}
		}
		
		private function onInitAsets():void {
			uiCfg.cfg = uiCfg.assets.getXml("ui_config");
			uiCfg.locale = uiCfg.assets.getXml("locale");
			sendNotification(InitCommand.NEXT);
		}
		
		private function get uiCfg():UiConfig {
			return facade.retrieveProxy(ProxyName.UI_CFG).getData() as UiConfig;
		}
	}
}