package com.renatus.reversi.command.ui 
{
	import com.renatus.reversi.command.sound.SoundCommand;
	import com.renatus.reversi.event.GameOverEvent;
	import com.renatus.reversi.event.InterfaceEvent;
	import com.renatus.reversi.event.LevelEvent;
	import com.renatus.reversi.event.StartMenuEvent;
	import com.renatus.reversi.event.TintEvent;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 
	 */
	public class GameOverMenuCommand extends SimpleCommand {
		
		override public function execute(notification:INotification):void {
			sendNotification(GameOverEvent.HIDE);
			sendNotification(SoundCommand.PLAY_BACK);
			sendNotification(StartMenuEvent.SHOW);
		}
	}
}