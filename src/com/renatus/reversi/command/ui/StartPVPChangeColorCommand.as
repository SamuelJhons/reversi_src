package com.renatus.reversi.command.ui {
	
	import com.renatus.reversi.model.LevelData;
	import com.renatus.reversi.model.ProxyName;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 
	 */
	public class StartPVPChangeColorCommand extends SimpleCommand {
		
		override public function execute(notification:INotification):void {
			data.aiID = data.aiID == LevelData.ITEM_1 ? LevelData.ITEM_2 : LevelData.ITEM_1;
		}	
		
		protected function get data():LevelData {
			return facade.retrieveProxy(ProxyName.LEVEL).getData() as LevelData;
		}
	}
}