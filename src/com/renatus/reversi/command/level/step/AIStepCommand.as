package com.renatus.reversi.command.level.step {
	
	import com.demonsters.debugger.MonsterDebugger;
	import com.renatus.reversi.command.level.ALevelCommand;
	import com.renatus.reversi.command.level.LevelList;
	import com.renatus.reversi.command.level.utils.ai.AI;
	import com.renatus.reversi.model.LevelData;
	import flash.geom.Point;
	import org.puremvc.as3.interfaces.INotification;
	
	/**
	 * 
	 */
	public class AIStepCommand extends ALevelCommand {
		
		override public function execute(notification:INotification):void {
			var ai:AI = new AI();
			var step:Point = ai.getStep(data.grid, data.curID, data.secID, LevelData.ITEM_CLEAR, data.aiDifficult);
			sendNotification(LevelList.PLAYER_CHOICE, { i:step.y, j:step.x } );
		}
	}
}