package com.renatus.reversi.command.init {
	
	import com.renatus.reversi.command.ui.PveClickCommand;
	import com.renatus.reversi.command.ui.PvpClickCommand;
	import com.renatus.reversi.event.StartMenuEvent;
	import com.renatus.reversi.model.ProxyName;
	import com.renatus.reversi.model.UiConfig;
	import com.renatus.reversi.view.StartMenuMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 
	 */
	internal class InitStartMenuCommand extends SimpleCommand {
		
		override public function execute(notification:INotification):void {
			facade.registerMediator(new StartMenuMediator(uiCfg.root, uiCfg.assets));
			sendNotification(StartMenuEvent.UPDATE_CFG, {cfg: uiCfg.cfg, locale:uiCfg.locale});
			
			facade.registerCommand(StartMenuEvent.UI_PVE_CLICK, PveClickCommand);
			facade.registerCommand(StartMenuEvent.UI_PVP_CLICK, PvpClickCommand);
			
			sendNotification(InitCommand.NEXT);
		}
		
		private function get uiCfg():UiConfig {
			return facade.retrieveProxy(ProxyName.UI_CFG).getData() as UiConfig;
		}
	}
}