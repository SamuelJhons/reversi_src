package com.renatus.reversi.command.init {
	
	import com.renatus.reversi.event.ProgressEvent;
	import com.renatus.reversi.model.ProxyName;
	import com.renatus.reversi.model.QueueData;
	import flash.utils.setTimeout;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * ...
	 */
	internal class InitNextCommand extends SimpleCommand {
		
		public static const TIME_OUT:int = 100;
		
		override public function execute(notification:INotification):void {
			if (data.queue.length != 0) {
				setTimeout(send, TIME_OUT);
			} else {
				throw new Error("end of queue");
			}
		}
		
		private function send():void {
			sendNotification(ProgressEvent.UPDATE_PROGRESS, (data.total - data.queue.length + 1) / data.total);
			sendNotification(data.queue.shift());
		}
		
		private function get data():QueueData {
			return facade.retrieveProxy(ProxyName.QUEUE).getData() as QueueData;
		}
	}
}