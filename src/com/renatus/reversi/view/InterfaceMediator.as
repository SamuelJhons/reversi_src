package com.renatus.reversi.view 
{
	import com.renatus.reversi.command.sound.SoundCommand;
	import com.renatus.reversi.event.InterfaceEvent;
	import org.puremvc.as3.interfaces.INotification;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.AssetManager;
	
	/**
	 * 
	 */
	public class InterfaceMediator extends AMediator {
		
		public function InterfaceMediator(cont:Sprite) {
			super(ContList.INTERFACE, new InterfaceView(), cont);
			(_view as InterfaceView).addEventListener(InterfaceView.PAUSE_CLICK, onPauseEventListener);
		}
		
		private function onPauseEventListener(event:Event):void {
			sendNotification(SoundCommand.CLICK);
			sendNotification(InterfaceEvent.UI_LEVEL_PAUSE);
		}
		
		override public function listNotificationInterests () : Array {
			return [
				InterfaceEvent.UPDATE_CFG,
				InterfaceEvent.SET_FIRST_COUNT,
				InterfaceEvent.SET_SECOND_COUNT,
				InterfaceEvent.UPDATE_CFG,
				InterfaceEvent.INIT_PARTICLES,
				InterfaceEvent.SHOW,
				InterfaceEvent.HIDE
			];
		}
		
		override public function handleNotification (notification:INotification) : void {
			var name:String = notification.getName();
			var body:Object = notification.getBody();
			switch(name) {
				case InterfaceEvent.SHOW:
					(_view as InterfaceView).show();
					break;
				case InterfaceEvent.HIDE:
					(_view as InterfaceView).hide();
					break;
				case InterfaceEvent.UPDATE_CFG:
					(_view as InterfaceView).updateGfxCfg(body.cfg,body.locale);
					break;
				case InterfaceEvent.SET_FIRST_COUNT:
					(_view as InterfaceView).setFirstCount(body as int);
					break;
				case InterfaceEvent.SET_SECOND_COUNT:
					(_view as InterfaceView).setSecondCount(body as int);
					break;
				case InterfaceEvent.INIT_PARTICLES:
					(_view as InterfaceView).initParticles(body as XML);
					break;
			}	
		}
		
	}

}