package com.renatus.reversi.command.ui 
{
	import com.renatus.reversi.event.PauseEvent;
	import com.renatus.reversi.event.WarningEvent;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 
	 */
	public class WarningCancelCommand extends SimpleCommand {
		
		override public function execute(notification:INotification):void {
			sendNotification(WarningEvent.HIDE);
			sendNotification(PauseEvent.SHOW);
		}
		
	}

}