package com.renatus.reversi.view {
	
	import com.renatus.reversi.command.sound.SoundCommand;
	import com.renatus.reversi.event.StartPVPEvent;
	import org.puremvc.as3.interfaces.INotification;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.AssetManager;
	
	/**
	 * 
	 */
	public class StartPVPMediator extends AMediator {
		
		public function StartPVPMediator(cont:Sprite, assets:AssetManager ) {
			super(ContList.START_PVP, new StartPVPView(), cont, assets);
			(_view as StartPVPView).addEventListener(StartPVPView.ON_BACK, onBackEventListener);
			(_view as StartPVPView).addEventListener(StartPVPView.ON_PLAY, onPlayEventListener);
			(_view as StartPVPView).addEventListener(StartPVPView.ON_SLIDER_CHANGE, onSliderChangeEventListener);
			(_view as StartPVPView).addEventListener(StartPVPView.ON_CHANGE_RADIO, onRadioChangeEventListener);
		}
		
		private function onRadioChangeEventListener(event:Event):void {
			sendNotification(SoundCommand.CLICK);
			sendNotification(StartPVPEvent.UI_CHANGE_COLOR);
		}
		
		private function onSliderChangeEventListener(event:Event):void {
			sendNotification(SoundCommand.CLICK);
			sendNotification(StartPVPEvent.UI_CHANGE_DIFF, event.data);
		}
		
		private function onPlayEventListener(event:Event):void {
			sendNotification(SoundCommand.CLICK);
			sendNotification(StartPVPEvent.UI_START);
		}
		
		private function onBackEventListener(event:Event):void {
			sendNotification(SoundCommand.CLICK);
			sendNotification(StartPVPEvent.UI_BACK);
		}
		
		override public function listNotificationInterests () : Array {
			return [
				StartPVPEvent.UPDATE_CFG,
				StartPVPEvent.SHOW,
				StartPVPEvent.HIDE
			];
		}
		
		override public function handleNotification (notification:INotification) : void {
			var name:String = notification.getName();
			var body:Object = notification.getBody();
			switch(name) {
				case StartPVPEvent.SHOW:
					sendNotification(SoundCommand.MENU);
					(_view as StartPVPView).show();
					break;
				case StartPVPEvent.HIDE:
					(_view as StartPVPView).hide();
					break;
				case StartPVPEvent.UPDATE_CFG:
					(_view as StartPVPView).updateGfxCfg(body.cfg,body.locale);
					break;
			}	
		}
	}
}