package com.renatus.reversi.command.level.condition {
	
	import com.renatus.reversi.command.level.ALevelCommand;
	import org.puremvc.as3.interfaces.INotification;
	
	/**
	 * 
	 */
	internal class SwitchCommand extends ALevelCommand {
		
		override public function execute(notification:INotification):void {
			var temp:int = data.secID;
			data.secID = data.curID;
			data.curID = temp;
		}
	}
}