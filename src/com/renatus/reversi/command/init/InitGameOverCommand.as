package com.renatus.reversi.command.init {
	
	import com.renatus.reversi.command.ui.GameOverMenuCommand;
	import com.renatus.reversi.command.ui.GameOverReplayCommand;
	import com.renatus.reversi.event.GameOverEvent;
	import com.renatus.reversi.model.ProxyName;
	import com.renatus.reversi.model.UiConfig;
	import com.renatus.reversi.view.GameOverMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 
	 */
	internal class InitGameOverCommand extends SimpleCommand {
		
		override public function execute(notification:INotification):void {
			facade.registerMediator(new GameOverMediator(uiCfg.root));
			sendNotification(GameOverEvent.UPDATE_CFG, {cfg: uiCfg.cfg, locale:uiCfg.locale});
			facade.registerCommand(GameOverEvent.UI_MENU_CLICK, GameOverMenuCommand);
			facade.registerCommand(GameOverEvent.UI_REPLAY_CLICK, GameOverReplayCommand);
			
			sendNotification(InitCommand.NEXT);
		}
		
		private function get uiCfg():UiConfig {
			return facade.retrieveProxy(ProxyName.UI_CFG).getData() as UiConfig;
		}
		
	}

}