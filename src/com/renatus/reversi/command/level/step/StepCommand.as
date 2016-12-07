package com.renatus.reversi.command.level.step {
	
	import com.demonsters.debugger.MonsterDebugger;
	import com.renatus.reversi.command.level.ALevelCommand;
	import com.renatus.reversi.command.level.LevelList;
	import com.renatus.reversi.event.LevelEvent;
	import com.renatus.reversi.model.LevelData;
	import org.puremvc.as3.interfaces.INotification;
	
	/**
	 * 
	 */
	internal class StepCommand extends ALevelCommand {
		
		override public function execute(notification:INotification):void {
			if (data.playerMode[data.curID] == LevelData.HUMAN) {
				sendNotification(LevelEvent.ENABLE_LEVEL);
			} else {
				sendNotification(StepList.AI_STEP);
			}
		}	
	}
}