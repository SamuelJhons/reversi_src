package com.renatus.reversi.view {
	
	import com.renatus.reversi.command.sound.SoundCommand;
	import com.renatus.reversi.event.PauseEvent;
	import org.puremvc.as3.interfaces.INotification;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.AssetManager;
	/**
	 * 
	 */
	public class PauseMediator extends AMediator {
		
		public function PauseMediator(cont:Sprite, assets:AssetManager ) {
			super(ContList.PAUSE, new PauseView(), cont , assets);
			(_view as PauseView).addEventListener(PauseView.MENU_CLICK, onMenuEventListener);
			(_view as PauseView).addEventListener(PauseView.PLAY_CLICK, onPlayEventListener);
			(_view as PauseView).addEventListener(PauseView.REPLAY_CLICK, onReplayEventListener);
		}
		
		private function onReplayEventListener(event:Event):void {
			sendNotification(SoundCommand.CLICK);
			sendNotification(PauseEvent.UI_REPLAY);
		}
		
		private function onPlayEventListener(event:Event):void {
			sendNotification(SoundCommand.CLICK);
			sendNotification(PauseEvent.UI_PLAY);
		}
		
		private function onMenuEventListener(event:Event):void {
			sendNotification(SoundCommand.CLICK);
			sendNotification(PauseEvent.UI_MENU);
		}
		
		override public function listNotificationInterests () : Array {
			return [
				PauseEvent.UPDATE_CFG,
				PauseEvent.SHOW,
				PauseEvent.HIDE
			];
		}
		
		override public function handleNotification (notification:INotification) : void {
			var name:String = notification.getName();
			var body:Object = notification.getBody();
			switch(name) {
				case PauseEvent.SHOW:
					sendNotification(SoundCommand.MENU);
					(_view as PauseView).show();
					break;
				case PauseEvent.HIDE:
					(_view as PauseView).hide();
					break;
				case PauseEvent.UPDATE_CFG:
					(_view as PauseView).updateGfxCfg(body.cfg,body.locale);
					break;
			}	
		}
	}
}