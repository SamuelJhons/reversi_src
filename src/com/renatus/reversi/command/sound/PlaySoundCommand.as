package com.renatus.reversi.command.sound {
	import org.puremvc.as3.interfaces.INotification;
	/**
	 * 
	 */
	public class PlaySoundCommand extends ASoundCommand {
		
		override public function execute(notification:INotification):void {
			switch(notification.getName()) {
				case SoundCommand.CLICK:
					uiCfg.assets.getSound("click").play(0, 0, sfx.soundTransform);
					break;
				case SoundCommand.MENU:
					uiCfg.assets.getSound("menu").play(0, 0, sfx.soundTransform);
					break;
				case SoundCommand.NOTIFY:
					uiCfg.assets.getSound("notify").play(0, 0, sfx.soundTransform);
					break;
				case SoundCommand.MOVE:
					uiCfg.assets.getSound("move").play(0, 0, sfx.soundTransform);
					break;
				case SoundCommand.COMPLETE:
					uiCfg.assets.getSound("complete").play(0, 0, sfx.soundTransform);
					break;
			}
		}	
	}
}