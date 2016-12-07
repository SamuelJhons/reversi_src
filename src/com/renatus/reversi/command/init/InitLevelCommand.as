package com.renatus.reversi.command.init 
{
	import com.renatus.reversi.command.ui.LevelItemSelectCommand;
	import com.renatus.reversi.command.ui.LevelPauseCommand;
	import com.renatus.reversi.event.InterfaceEvent;
	import com.renatus.reversi.event.LevelEvent;
	import com.renatus.reversi.model.GameProxy;
	import com.renatus.reversi.model.LevelData;
	import com.renatus.reversi.model.ProxyName;
	import com.renatus.reversi.model.UiConfig;
	import com.renatus.reversi.view.InterfaceMediator;
	import com.renatus.reversi.view.LevelMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 
	 */
	internal class InitLevelCommand extends SimpleCommand {
		
		override public function execute(notification:INotification):void {
			facade.registerProxy(new GameProxy(ProxyName.LEVEL, new LevelData()));
			
			facade.registerMediator(new LevelMediator(uiCfg.root, uiCfg.assets));
			sendNotification(LevelEvent.UPDATE_CFG, {cfg: uiCfg.cfg, locale:uiCfg.locale});
			facade.registerCommand(LevelEvent.UI_ITEM_SELECT, LevelItemSelectCommand);
			
			facade.registerMediator(new InterfaceMediator(uiCfg.root, uiCfg.assets));
			sendNotification(InterfaceEvent.UPDATE_CFG, {cfg: uiCfg.cfg, locale:uiCfg.locale});
			sendNotification(InterfaceEvent.INIT_PARTICLES, uiCfg.assets.getXml("particle"));
			facade.registerCommand(InterfaceEvent.UI_LEVEL_PAUSE, LevelPauseCommand);
			
			sendNotification(InitCommand.NEXT);
		}
		
		private function get uiCfg():UiConfig {
			return facade.retrieveProxy(ProxyName.UI_CFG).getData() as UiConfig;
		}
	}
}