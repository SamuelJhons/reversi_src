package com.renatus.reversi.view 
{
	import com.renatus.reversi.command.sound.SoundCommand;
	import com.renatus.reversi.event.StartMenuEvent;
	import org.puremvc.as3.interfaces.INotification;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.AssetManager;
	
	/**
	 *  
	 */
	public class StartMenuMediator extends AMediator {
		
		public function StartMenuMediator(cont:Sprite, assets:AssetManager ) {
			super(ContList.START_MENU, new StartMenuView(), cont, assets);
			(_view as StartMenuView).addEventListener(StartMenuView.PVE_CLICK, onPVEEventListener);
			(_view as StartMenuView).addEventListener(StartMenuView.PVP_CLICK, onPVPEventListener);
		}
		
		private function onPVPEventListener(event:Event):void {
			sendNotification(SoundCommand.CLICK);
			sendNotification(StartMenuEvent.UI_PVP_CLICK);
			(_view as StartMenuView).hide();
		}
		
		private function onPVEEventListener(event:Event):void {
			sendNotification(SoundCommand.CLICK);
			sendNotification(StartMenuEvent.UI_PVE_CLICK);
		}
		
		override public function listNotificationInterests () : Array {
			return [
				StartMenuEvent.UPDATE_CFG,
				StartMenuEvent.SHOW,
				StartMenuEvent.HIDE
			];
		}
		
		override public function handleNotification (notification:INotification) : void {
			var name:String = notification.getName();
			var body:Object = notification.getBody();
			switch(name) {
				case StartMenuEvent.SHOW:
					sendNotification(SoundCommand.MENU);
					(_view as StartMenuView).show();
					break;
				case StartMenuEvent.HIDE:
					(_view as StartMenuView).hide();
					break;
				case StartMenuEvent.UPDATE_CFG:
					(_view as StartMenuView).updateGfxCfg(body.cfg,body.locale);
					break;
			}	
		}
	}
}