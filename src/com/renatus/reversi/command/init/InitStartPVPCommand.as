package com.renatus.reversi.command.init {
	
	import com.renatus.reversi.command.ui.StartPVPBackcommand;
	import com.renatus.reversi.command.ui.StartPVPChangeColorCommand;
	import com.renatus.reversi.command.ui.StartPVPChangeDiffCommand;
	import com.renatus.reversi.command.ui.StartPVPPlayCommand;
	import com.renatus.reversi.event.StartPVPEvent;
	import com.renatus.reversi.model.ProxyName;
	import com.renatus.reversi.model.UiConfig;
	import com.renatus.reversi.view.StartPVPMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 
	 */
	public class InitStartPVPCommand extends SimpleCommand {
		
		override public function execute(notification:INotification):void {
			facade.registerMediator(new StartPVPMediator(uiCfg.root));
			sendNotification(StartPVPEvent.UPDATE_CFG, {cfg: uiCfg.cfg, locale:uiCfg.locale});
			
			facade.registerCommand(StartPVPEvent.UI_BACK, StartPVPBackcommand);
			facade.registerCommand(StartPVPEvent.UI_CHANGE_COLOR, StartPVPChangeColorCommand);
			facade.registerCommand(StartPVPEvent.UI_CHANGE_DIFF, StartPVPChangeDiffCommand);
			facade.registerCommand(StartPVPEvent.UI_START, StartPVPPlayCommand);
			
			sendNotification(InitCommand.NEXT);
		}
		
		private function get uiCfg():UiConfig {
			return facade.retrieveProxy(ProxyName.UI_CFG).getData() as UiConfig;
		}
		
	}

}