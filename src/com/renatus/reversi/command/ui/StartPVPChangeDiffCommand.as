package com.renatus.reversi.command.ui {
	
	import com.demonsters.debugger.MonsterDebugger;
	import com.renatus.reversi.model.LevelData;
	import com.renatus.reversi.model.ProxyName;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 
	 */
	public class StartPVPChangeDiffCommand extends SimpleCommand {
		
		override public function execute(notification:INotification):void {
			data.aiDifficult = notification.getBody() as int;
		}	
		
		protected function get data():LevelData {
			return facade.retrieveProxy(ProxyName.LEVEL).getData() as LevelData;
		}
	}
}