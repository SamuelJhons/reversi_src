package com.renatus.reversi.command.ui 
{
	import com.renatus.reversi.event.PauseEvent;
	import com.renatus.reversi.event.TintEvent;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 
	 */
	public class PausePlayCommand extends SimpleCommand {
		
		override public function execute(notification:INotification):void {
			sendNotification(TintEvent.HIDE);
			sendNotification(PauseEvent.HIDE);
		}
		
	}

}