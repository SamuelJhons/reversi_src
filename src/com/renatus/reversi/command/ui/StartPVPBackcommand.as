package com.renatus.reversi.command.ui {
	import com.renatus.reversi.event.StartMenuEvent;
	import com.renatus.reversi.event.StartPVPEvent;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 
	 */
	public class StartPVPBackcommand extends SimpleCommand {
		
		override public function execute(notification:INotification):void {
			sendNotification(StartPVPEvent.HIDE);
			sendNotification(StartMenuEvent.SHOW);
		}	
	}
}