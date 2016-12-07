package com.renatus.reversi.command.level.preplevel {
	
	import com.renatus.reversi.command.level.ALevelCommand;
	import com.renatus.reversi.command.level.LevelList;
	import flash.utils.setTimeout;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 
	 */
	internal class PrepLevelCommand extends ALevelCommand {
		
		public static const START_DELAY:int		=	1000;
		
		override public function execute(notification:INotification):void {
			sendNotification(PrepLevelList.PREP_MODEL, notification.getBody());
			sendNotification(PrepLevelList.PREP_UI);
			setTimeout(next, START_DELAY);
		}
		
		private function next():void {
			sendNotification(LevelList.PREP_STEP);
		}
	}
}