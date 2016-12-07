package com.renatus.reversi.view {
	
	import com.renatus.reversi.command.sound.SoundCommand;
	import com.renatus.reversi.event.GameOverEvent;
	import org.puremvc.as3.interfaces.INotification;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.AssetManager;
	
	/**
	 * 
	 */
	public class GameOverMediator extends AMediator {
		
		public function GameOverMediator(cont:Sprite, assets:AssetManager ) {
			super(ContList.GAME_OVER, new GameOverView(), cont, assets);
			(_view as GameOverView).addEventListener(GameOverView.MENU_CLICK, onMenuEventListener);
			(_view as GameOverView).addEventListener(GameOverView.REPLAY_CLICK, onReplayEventListener);
		}
		
		private function onReplayEventListener(event:Event):void {
			sendNotification(SoundCommand.CLICK);
			sendNotification(GameOverEvent.UI_REPLAY_CLICK);
		}
		
		private function onMenuEventListener(event:Event):void {
			sendNotification(SoundCommand.CLICK);
			sendNotification(GameOverEvent.UI_MENU_CLICK);
		}
		
		override public function listNotificationInterests () : Array {
			return [
				GameOverEvent.UPDATE_CFG,
				GameOverEvent.SHOW,
				GameOverEvent.HIDE,
				GameOverEvent.SET_WIN_TEXT
			];
		}
		
		override public function handleNotification (notification:INotification) : void {
			var name:String = notification.getName();
			var body:Object = notification.getBody();
			switch(name) {
				case GameOverEvent.SHOW:
					sendNotification(SoundCommand.MENU);
					(_view as GameOverView).show();
					break;
				case GameOverEvent.HIDE:
					(_view as GameOverView).hide();
					break;
				case GameOverEvent.UPDATE_CFG:
					(_view as GameOverView).updateGfxCfg(body.cfg,body.locale);
					break;
				case GameOverEvent.SET_WIN_TEXT:
					(_view as GameOverView).setWinText(body.locale, body.id);
					break;
			}	
		}
		
	}

}