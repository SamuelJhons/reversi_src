package com.renatus.reversi.command.init 
{
  import com.renatus.reversi.command.sound.SoundCommand;
  import com.renatus.reversi.event.ProgressEvent;
  import com.renatus.reversi.event.StartMenuEvent;
  import com.renatus.reversi.model.ProxyName;
  import com.renatus.reversi.model.UiConfig;
  import flash.utils.setTimeout;
  import org.puremvc.as3.interfaces.INotification;
  import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 
	 */
	internal class InitCompletedCommand extends SimpleCommand {
		
		override public function execute(notification:INotification):void {
			setTimeout(next, 300);
		}
		
		private function next():void {
			sendNotification(ProgressEvent.CLEAR);
			sendNotification(SoundCommand.PLAY_BACK);
			sendNotification(StartMenuEvent.SHOW, uiCfg.cfg );
		}
		
		private function get uiCfg():UiConfig {
			return facade.retrieveProxy(ProxyName.UI_CFG).getData() as UiConfig;
		}
	}
}