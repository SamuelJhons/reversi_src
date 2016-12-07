package com.renatus.reversi.command.level.condition {
	
	import com.renatus.reversi.command.level.ALevelCommand;
	import com.renatus.reversi.command.level.LevelList;
	import com.renatus.reversi.command.level.utils.gird.GetFreeCells;
	import com.renatus.reversi.command.sound.SoundCommand;
	import com.renatus.reversi.event.GameOverEvent;
	import com.renatus.reversi.event.InterfaceEvent;
	import com.renatus.reversi.event.LevelEvent;
	import com.renatus.reversi.event.TintEvent;
	import com.renatus.reversi.model.LevelData;
	import com.renatus.reversi.model.ProxyName;
	import com.renatus.reversi.model.UiConfig;
	import flash.utils.setTimeout;
	import org.puremvc.as3.interfaces.INotification;
	
	/**
	 * 
	 */
	internal class ConditionCommand extends ALevelCommand {
		
		override public function execute(notification:INotification):void {
			var isFree:Boolean = new GetFreeCells().getFreeCells(data.grid, data.curID, data.secID, LevelData.ITEM_CLEAR);
			if (isFree) {
				if (data.switchCount > 1) {
					setWiner();
				} else {
					sendNotification(ConditionList.SWITCH);
					setTimeout(function():void { sendNotification(LevelList.PREP_STEP) }, 500);
				}
			} else {
				setWiner();
			}
		}	
		
		private function setWiner():void {
			if (data.count[LevelData.ITEM_1] > data.count[LevelData.ITEM_2]) {
				sendNotification(GameOverEvent.SET_WIN_TEXT, {locale:ui.locale, id:"txt_win_first" });
			} else if (data.count[LevelData.ITEM_1] < data.count[LevelData.ITEM_2]) {
				sendNotification(GameOverEvent.SET_WIN_TEXT, {locale:ui.locale, id:"txt_win_second" });
			} else {
				sendNotification(GameOverEvent.SET_WIN_TEXT, {locale:ui.locale, id:"txt_draw" });
			}
			sendNotification(LevelEvent.HIDE);
			sendNotification(InterfaceEvent.HIDE);
			sendNotification(TintEvent.HIDE);
			sendNotification(SoundCommand.COMPLETE);
			sendNotification(SoundCommand.STOP_BACK);
			sendNotification(GameOverEvent.SHOW);
		}
		
		protected function get ui():UiConfig {
			return facade.retrieveProxy(ProxyName.UI_CFG).getData() as UiConfig;
		}
	}
}