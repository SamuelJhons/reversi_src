package com.renatus.reversi.command.init {
	
	import com.renatus.reversi.event.ProgressEvent;
	import com.renatus.reversi.model.ProxyName;
	import com.renatus.reversi.model.UiConfig;
	import com.renatus.reversi.view.BackgroundMediator;
	import com.renatus.reversi.view.ProgressMediator;
	import com.renatus.reversi.view.TintMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 
	 */
	internal class InitStartScreenCommand extends SimpleCommand {
		
		override public function execute(notification:INotification):void {
			facade.registerMediator(new BackgroundMediator(uiCfg.root, uiCfg.assets));
			facade.registerMediator(new ProgressMediator(uiCfg.root, uiCfg.assets));
			facade.registerMediator(new TintMediator(uiCfg.root, uiCfg.assets));
			sendNotification(ProgressEvent.UPDATE_CFG, {cfg: uiCfg.cfg, locale:uiCfg.locale});
			
			sendNotification(InitCommand.NEXT);
		}
		
		private function get uiCfg():UiConfig {
			return facade.retrieveProxy(ProxyName.UI_CFG).getData() as UiConfig;
		}
	}
}