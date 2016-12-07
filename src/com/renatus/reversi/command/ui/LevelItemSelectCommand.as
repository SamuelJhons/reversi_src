package com.renatus.reversi.command.ui {
	
	import com.renatus.reversi.command.level.LevelList;
	import com.renatus.reversi.event.GameOverEvent;
	import com.renatus.reversi.event.InterfaceEvent;
	import com.renatus.reversi.event.LevelEvent;
	import com.renatus.reversi.event.TintEvent;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 
	 */
	public class LevelItemSelectCommand extends SimpleCommand {
		
		override public function execute(notification:INotification):void {
			var id:String = notification.getBody() as String;
			sendNotification(LevelList.PLAYER_CHOICE, { i:id.split("_")[1], j:id.split("_")[2]} );
		}
	}
}