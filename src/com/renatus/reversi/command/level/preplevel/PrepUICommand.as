package com.renatus.reversi.command.level.preplevel {
	
	import com.renatus.reversi.Config;
	import com.renatus.reversi.command.level.ALevelCommand;
	import com.renatus.reversi.event.InterfaceEvent;
	import com.renatus.reversi.event.LevelEvent;
	import com.renatus.reversi.model.LevelData;
	import com.renatus.reversi.view.utils.ItemData;
	import flash.utils.setTimeout;
	import org.puremvc.as3.interfaces.INotification;
	
	/**
	 * 
	 */
	internal class PrepUICommand extends ALevelCommand {
		
		override public function execute(notification:INotification):void {
			sendNotification(LevelEvent.DISABLE_ITEMS);
			sendNotification(LevelEvent.DISABLE_LEVEL);
			sendNotification(LevelEvent.SHOW);
			sendNotification(InterfaceEvent.SET_FIRST_COUNT, data.count[LevelData.ITEM_1]);
			sendNotification(InterfaceEvent.SET_SECOND_COUNT, data.count[LevelData.ITEM_2]);
			sendNotification(InterfaceEvent.SHOW);
			setTimeout(next, 500);
		}
		
		private function next():void {
			var itemData:ItemData = new ItemData();
			for (var i:int = 0, l:int = Config.HEIGHT; i < l; i++) {
				for (var j:int = 0, l2:int = Config.WIDTH; j < l2; j++) {
					if (data.grid[i + j * l2] != LevelData.ITEM_CLEAR) {
						itemData.i = i;
						itemData.j = j;
						itemData.id = data.grid[i + j * l2];
						sendNotification(LevelEvent.ADD_ITEM, itemData );
					}
				}
			}
		}
	}
}