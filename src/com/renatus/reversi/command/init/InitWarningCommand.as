package com.renatus.reversi.command.init {
	
	import com.renatus.reversi.command.ui.WarningAcceptCommand;
	import com.renatus.reversi.command.ui.WarningCancelCommand;
	import com.renatus.reversi.event.WarningEvent;
	import com.renatus.reversi.model.ProxyName;
	import com.renatus.reversi.model.UiConfig;
	import com.renatus.reversi.view.WarningMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	/**
	 * 
	 */
	internal class InitWarningCommand extends SimpleCommand {
		
		override public function execute(notification:INotification):void {
			facade.registerMediator(new WarningMediator(uiCfg.root, uiCfg.assets));
			sendNotification(WarningEvent.UPDATE_CFG, {cfg: uiCfg.cfg, locale:uiCfg.locale});
			facade.registerCommand(WarningEvent.UI_WARNING_ACCEPT, WarningAcceptCommand);
			facade.registerCommand(WarningEvent.UI_WARNING_CANCEL, WarningCancelCommand);
			
			sendNotification(InitCommand.NEXT);
		}
		
		private function get uiCfg():UiConfig {
			return facade.retrieveProxy(ProxyName.UI_CFG).getData() as UiConfig;
		}
		
	}

}