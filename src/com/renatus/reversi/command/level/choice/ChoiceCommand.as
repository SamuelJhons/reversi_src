package com.renatus.reversi.command.level.choice 
{
	import com.demonsters.debugger.MonsterDebugger;
	import com.renatus.reversi.Config;
	import com.renatus.reversi.command.level.ALevelCommand;
	import com.renatus.reversi.command.level.LevelList;
	import com.renatus.reversi.command.level.utils.gird.GetCapturedItems;
	import com.renatus.reversi.command.sound.SoundCommand;
	import com.renatus.reversi.event.InterfaceEvent;
	import com.renatus.reversi.event.LevelEvent;
	import com.renatus.reversi.model.LevelData;
	import com.renatus.reversi.view.utils.ItemData;
	import flash.geom.Point;
	import flash.utils.clearInterval;
	import flash.utils.setInterval;
	import flash.utils.setTimeout;
	import org.puremvc.as3.interfaces.INotification;
	
	/**
	 * 
	 */
	internal class ChoiceCommand extends ALevelCommand {
		
		private var _interval:int;
		
		override public function execute(notification:INotification):void {
			sendNotification(LevelEvent.DISABLE_ITEMS);
			sendNotification(LevelEvent.DISABLE_LEVEL);
			data.switchCount = 0;
			var pos:Object = notification.getBody();
			data.grid[int(pos.i)* Config.WIDTH + int(pos.j)] = data.curID;
			sendNotification(LevelEvent.ADD_ITEM, new ItemData(pos.i, pos.j, data.curID));
			sendNotification(SoundCommand.MOVE);
			data.count[data.curID]++;
			if (data.curID == LevelData.ITEM_1) {
				sendNotification(InterfaceEvent.SET_FIRST_COUNT, data.count[data.curID]);
			} else {
				sendNotification(InterfaceEvent.SET_SECOND_COUNT, data.count[data.curID]);
			}
			setTimeout(onAddItem, 300, pos);
		}	
		
		private function onAddItem(pos:Object):void {
			var list:Array = new GetCapturedItems().getList(int(pos.i) * Config.WIDTH + int(pos.j), data.grid, data.curID, data.secID, LevelData.ITEM_CLEAR);
			_interval = setInterval(anim, 100, list);
		}
		
		private function anim(list:Array):void {
			if (list.length != 0) {
				var itemPos:int = list.shift();
				data.grid[itemPos] = data.curID;
				var jPos:int = itemPos % Config.WIDTH;
				var iPos:int = (itemPos - jPos) / Config.WIDTH;
				sendNotification(LevelEvent.SWITCH_ITEM, new ItemData(iPos, jPos, data.curID));
				sendNotification(SoundCommand.MOVE);
				data.count[data.curID]++;
				data.count[data.secID]--;
				sendNotification(InterfaceEvent.SET_FIRST_COUNT, data.count[LevelData.ITEM_1]);
				sendNotification(InterfaceEvent.SET_SECOND_COUNT, data.count[LevelData.ITEM_2]);
			} else {
				clearInterval(_interval);
				setTimeout(checkConditions, 100);
			}
		}
		
		private function checkConditions():void {
			var str:String = "";
			for (var i:int = 0; i < 64; i++) {
				str += data.grid[i];
			}
			MonsterDebugger.trace(this, str);
			sendNotification(LevelList.CONDITION);
		}
	}
}