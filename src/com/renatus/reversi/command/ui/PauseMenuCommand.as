package com.renatus.reversi.command.ui 
{
	import com.renatus.reversi.event.InterfaceEvent;
	import com.renatus.reversi.event.LevelEvent;
	import com.renatus.reversi.event.PauseEvent;
	import com.renatus.reversi.event.StartMenuEvent;
	import com.renatus.reversi.event.WarningEvent;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * ...
	 * @author 
	 */
	public class PauseMenuCommand extends SimpleCommand {
		
		override public function execute(notification:INotification):void {
			sendNotification(PauseEvent.HIDE);
			sendNotification(WarningEvent.SHOW);
		}
	}
}