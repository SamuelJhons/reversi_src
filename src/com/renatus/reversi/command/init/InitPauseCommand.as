package com.renatus.reversi.command.init {
	
	import com.renatus.reversi.command.ui.PauseMenuCommand;
	import com.renatus.reversi.command.ui.PausePlayCommand;
	import com.renatus.reversi.command.ui.PauseReplayCommand;
	import com.renatus.reversi.event.PauseEvent;
	import com.renatus.reversi.model.ProxyName;
	import com.renatus.reversi.model.UiConfig;
	import com.renatus.reversi.view.PauseMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 
	 */
	internal class InitPauseCommand extends SimpleCommand {
		
		override public function execute(notification:INotification):void {
			facade.registerMediator(new PauseMediator(uiCfg.root, uiCfg.assets));
			sendNotification(PauseEvent.UPDATE_CFG, {cfg: uiCfg.cfg, locale:uiCfg.locale});
			facade.registerCommand(PauseEvent.UI_MENU, PauseMenuCommand);
			facade.registerCommand(PauseEvent.UI_PLAY, PausePlayCommand);
			facade.registerCommand(PauseEvent.UI_REPLAY, PauseReplayCommand);
			
			sendNotification(InitCommand.NEXT);
		}
		
		private function get uiCfg():UiConfig {
			return facade.retrieveProxy(ProxyName.UI_CFG).getData() as UiConfig;
		}
	}
}