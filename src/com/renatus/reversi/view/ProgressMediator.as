package com.renatus.reversi.view {
	
	import com.renatus.reversi.event.ProgressEvent;
	import org.puremvc.as3.interfaces.INotification;
	import starling.display.Sprite;
	import starling.utils.AssetManager;
	
	/**
	 * 
	 */
	public class ProgressMediator extends AMediator {
		
		public function ProgressMediator(cont:Sprite) {
			super(ContList.PROGRESS, new ProgressView(), cont);
		}
		
		override public function listNotificationInterests () : Array {
			return [
				ProgressEvent.UPDATE_CFG,
				ProgressEvent.UPDATE_PROGRESS,
				ProgressEvent.CLEAR
			];
		}
		
		override public function handleNotification (notification:INotification) : void {
			var name:String = notification.getName();
			var body:Object = notification.getBody();
			switch(name) {
				case ProgressEvent.UPDATE_CFG:
					(_view as ProgressView).updateGfxCfg(body.cfg, body.locale);
					break;
				case ProgressEvent.UPDATE_PROGRESS:
					(_view as ProgressView).updateProgress(Number(body));
					break;
				case ProgressEvent.CLEAR:
					(_view as ProgressView).clear();
					break;
			}
		}
	}
}