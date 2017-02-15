package com.renatus.reversi.view {
	
	import com.renatus.reversi.command.sound.SoundCommand;
	import com.renatus.reversi.event.WarningEvent;
	import org.puremvc.as3.interfaces.INotification;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.AssetManager;
	
	/**
	 * 
	 */
	public class WarningMediator extends AMediator {
		
		public function WarningMediator(cont:Sprite) {
			super(ContList.WARNING, new WarningView(), cont);
			(_view as WarningView).addEventListener(WarningView.ACCEPT_CLICK, onAcceptEventListener);
			(_view as WarningView).addEventListener(WarningView.CANCEL_CLICK, onCancelEventListener);
		}
		
		private function onCancelEventListener(event:Event):void {
			sendNotification(SoundCommand.CLICK);
			sendNotification(WarningEvent.UI_WARNING_CANCEL);
		}
		
		private function onAcceptEventListener(event:Event):void {
			sendNotification(SoundCommand.CLICK);
			sendNotification(WarningEvent.UI_WARNING_ACCEPT);
		}
		
		override public function listNotificationInterests () : Array {
			return [
				WarningEvent.UPDATE_CFG,
				WarningEvent.SHOW,
				WarningEvent.HIDE
			];
		}
		
		override public function handleNotification (notification:INotification) : void {
			var name:String = notification.getName();
			var body:Object = notification.getBody();
			switch(name) {
				case WarningEvent.SHOW:
					sendNotification(SoundCommand.MENU);
					(_view as WarningView).show();
					break;
				case WarningEvent.HIDE:
					(_view as WarningView).hide();
					break;
				case WarningEvent.UPDATE_CFG:
					(_view as WarningView).updateGfxCfg(body.cfg,body.locale);
					break;
			}	
		}
	}
}