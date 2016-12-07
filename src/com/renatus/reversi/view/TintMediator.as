package com.renatus.reversi.view {
	
	import com.renatus.reversi.event.TintEvent;
	import org.puremvc.as3.interfaces.INotification;
	import starling.display.Sprite;
	import starling.utils.AssetManager;
	
	/**
	 * 
	 */
	public class TintMediator extends AMediator {
		
		public function TintMediator(cont:Sprite, assets:AssetManager ) {
			super(ContList.TINT, new TintView(), cont , assets);
		}
		
		override public function listNotificationInterests () : Array {
			return [
				TintEvent.SHOW,
				TintEvent.HIDE
			];
		}
		
		override public function handleNotification (notification:INotification) : void {
			var name:String = notification.getName();
			var body:Object = notification.getBody();
			switch(name) {
				case TintEvent.SHOW:
					(_view as TintView).show();
					break;
				case TintEvent.HIDE:
					(_view as TintView).hide();
					break;
			}	
		}
		
	}

}