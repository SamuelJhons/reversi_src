package com.renatus.reversi.command.sound {
	import org.puremvc.as3.interfaces.INotification;
	/**
	 * 
	 */
	public class PlayMusicCommand extends ASoundCommand {
		
		override public function execute(notification:INotification):void {
			sfx.musicChanel.stop();
			sfx.musicChanel = uiCfg.assets.getSound("back").play(0, int.MAX_VALUE, sfx.musicTransform);
			
		}	
	}
}