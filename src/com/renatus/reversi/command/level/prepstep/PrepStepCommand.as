package com.renatus.reversi.command.level.prepstep {
	
	import com.demonsters.debugger.MonsterDebugger;
	import com.renatus.reversi.command.level.ALevelCommand;
	import com.renatus.reversi.command.level.LevelList;
	import com.renatus.reversi.command.level.utils.gird.GetAvailable;
	import com.renatus.reversi.event.LevelEvent;
	import com.renatus.reversi.model.LevelData;
	import org.puremvc.as3.interfaces.INotification;
	
	/**
	 * 
	 */
	internal class PrepStepCommand extends ALevelCommand {
		
		override public function execute(notification:INotification):void {
			var list:Array = new GetAvailable().check(data.grid, data.curID, data.secID, LevelData.ITEM_CLEAR);
			if (list.length != 0) {
				sendNotification(PrepStepList.SHOW_AVAILABLE, list);
				sendNotification(LevelList.STEP);
			} else {
				data.switchCount++;
				sendNotification(LevelList.CONDITION);
			}
		}
	}
}