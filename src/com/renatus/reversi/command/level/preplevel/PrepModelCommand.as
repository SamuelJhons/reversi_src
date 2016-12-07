package com.renatus.reversi.command.level.preplevel {
	
	import com.demonsters.debugger.MonsterDebugger;
	import com.renatus.reversi.Config;
	import com.renatus.reversi.command.level.ALevelCommand;
	import com.renatus.reversi.command.level.ModeID;
	import com.renatus.reversi.model.LevelData;
	import org.puremvc.as3.interfaces.INotification;
	
	/**
	 * 
	 */
	internal class PrepModelCommand extends ALevelCommand {
		
		override public function execute(notification:INotification):void {
			var mode:int = notification.getBody() as int;
			// выставляет ID текущего игрока
			data.curID = LevelData.ITEM_1;	
			// выставляет ID противника
			data.secID = LevelData.ITEM_2;	
			data.playerMode[data.curID] = LevelData.HUMAN;	
			data.playerMode[data.secID] = LevelData.HUMAN;	
			if (mode == ModeID.PVP) { // для повтора уровня mode не передается
				data.playerMode[data.aiID] = LevelData.PC;
			}
			// выставляет кол-во фишек ITEM_1
			data.count[LevelData.ITEM_1] = 2;
			// выставляет кол-во фишек ITEM_2
			data.count[LevelData.ITEM_2] = 2;
			// обнуляет кол-во смен хода, без постановки фишки
			data.switchCount = 0;
			// создает сетку, если она еще не создана
			if (data.grid == null) {
				data.grid = new Vector.<int>(Config.HEIGHT * Config.WIDTH);
			}
			// выставляет все ячейки в начальное положение
			fillGrid();
		}
		
		private function fillGrid():void {
			for (var i:int = 0, l:int = Config.WIDTH * Config.HEIGHT; i < l ; i++) {
				data.grid[i] = LevelData.ITEM_CLEAR;
			}
			data.grid[3 + 3 * Config.WIDTH] = LevelData.ITEM_2;
			data.grid[4 + 4 * Config.WIDTH] = LevelData.ITEM_2;
			data.grid[4 + 3 * Config.WIDTH] = LevelData.ITEM_1;
			data.grid[3 + 4 * Config.WIDTH] = LevelData.ITEM_1;
		}
	}
}