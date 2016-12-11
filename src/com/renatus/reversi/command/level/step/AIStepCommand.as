package com.renatus.reversi.command.level.step {
	
	import com.renatus.reversi.Config;
	import com.renatus.reversi.command.level.ALevelCommand;
	import com.renatus.reversi.command.level.LevelList;
	import com.renatus.reversi.command.level.utils.ai.AI;
	import com.renatus.reversi.model.LevelData;
	import org.puremvc.as3.interfaces.INotification;
	
	/**
	 * 
	 */
	public class AIStepCommand extends ALevelCommand {
		
		override public function execute(notification:INotification):void {
			var ai:AI = new AI();
			var itemPos:int = ai.getStep(data.grid, data.curID, data.secID, LevelData.ITEM_CLEAR, data.aiDifficult);
			var jPos:int = itemPos % Config.WIDTH;
			var iPos:int = (itemPos - jPos) / Config.WIDTH;
			sendNotification(LevelList.PLAYER_CHOICE, { i:iPos, j:jPos } );
		}
	}
}