package com.renatus.reversi.command.sound {
	import org.puremvc.as3.interfaces.INotification;
	/**
	 * 
	 */
	public class StopMusicCommand extends ASoundCommand {
		
		override public function execute(notification:INotification):void {
			sfx.musicChanel.stop();
		}	
	}
}