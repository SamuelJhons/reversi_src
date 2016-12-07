package com.renatus.reversi.command.ui 
{
	import com.renatus.reversi.command.level.LevelList;
	import com.renatus.reversi.event.InterfaceEvent;
	import com.renatus.reversi.event.LevelEvent;
	import com.renatus.reversi.event.PauseEvent;
	import com.renatus.reversi.event.TintEvent;
	import flash.utils.setTimeout;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 
	 */
	public class PauseReplayCommand extends SimpleCommand {
		
		override public function execute(notification:INotification):void {
			sendNotification(LevelEvent.DISABLE_LEVEL);
			sendNotification(LevelEvent.HIDE);
			sendNotification(InterfaceEvent.HIDE);
			sendNotification(TintEvent.HIDE);
			sendNotification(PauseEvent.HIDE);
			setTimeout(next, 1000);
		}
		
		private function next():void {
			sendNotification(LevelList.PREP_LEVEL);
		}
		
	}

}