package com.renatus.reversi.command.level.prepstep {
	
	import com.demonsters.debugger.MonsterDebugger;
	import com.renatus.reversi.command.level.ALevelCommand;
	import com.renatus.reversi.event.LevelEvent;
	import org.puremvc.as3.interfaces.INotification;
	
	/**
	 * 
	 */
	internal class ShowAvailableCommand extends ALevelCommand {
		
		override public function execute(notification:INotification):void {
			var list:Array = notification.getBody() as Array;
			for (var i:int = 0, l:int = list.length; i < l; i++) {
				sendNotification(LevelEvent.ENABLE_ITEM, { i:list[i].y, j:list[i].x } );
			}
		}
	}
}