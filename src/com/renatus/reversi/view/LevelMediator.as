package com.renatus.reversi.view 
{
	import com.demonsters.debugger.MonsterDebugger;
	import com.renatus.reversi.event.LevelEvent;
	import com.renatus.reversi.view.utils.ItemData;
	import org.puremvc.as3.interfaces.INotification;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.AssetManager;
	
	/**
	 * 
	 */
	public class LevelMediator extends AMediator {
		
		public function LevelMediator(cont:Sprite) {
			super(ContList.LEVEL, new LevelView(), cont);
			(_view as LevelView).addEventListener(LevelView.ITEM_SELECT, onItemSelectEventListener);
		}
		
		private function onItemSelectEventListener(event:Event):void {
			sendNotification(LevelEvent.UI_ITEM_SELECT, event.data);
		}
		
		override public function listNotificationInterests () : Array {
			return [
				LevelEvent.UPDATE_CFG,
				LevelEvent.CLEAR,
				LevelEvent.ADD_ITEM,
				LevelEvent.SWITCH_ITEM,
				LevelEvent.DISABLE_ITEMS,
				LevelEvent.ENABLE_ITEM,
				LevelEvent.ENABLE_LEVEL,
				LevelEvent.DISABLE_LEVEL,
				LevelEvent.SHOW,
				LevelEvent.HIDE
			];
		}
		
		override public function handleNotification (notification:INotification) : void {
			var name:String = notification.getName();
			var body:Object = notification.getBody();
			switch(name) {
				case LevelEvent.SHOW:
					(_view as LevelView).show();
					break;
				case LevelEvent.HIDE:
					(_view as LevelView).hide();
					break;
				case LevelEvent.UPDATE_CFG:
					(_view as LevelView).updateGfxCfg(body.cfg,body.locale);
					break;
				case LevelEvent.ADD_ITEM:
					(_view as LevelView).addItem(body as ItemData);
					break;
				case LevelEvent.SWITCH_ITEM:
					(_view as LevelView).switchItem(body as ItemData);
					break;
				case LevelEvent.DISABLE_ITEMS:
					(_view as LevelView).disableAll();
					break;
				case LevelEvent.ENABLE_ITEM:
					(_view as LevelView).enableItem(body.i, body.j);
					break;
				case LevelEvent.ENABLE_LEVEL:
					(_view as LevelView).enableLevel();
					break;
				case LevelEvent.DISABLE_LEVEL:
					(_view as LevelView).disableLevel();
					break;
			}	
		}
		
	}

}