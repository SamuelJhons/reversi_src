package com.renatus.reversi.command.ui 
{
	import com.renatus.reversi.command.level.LevelList;
	import com.renatus.reversi.command.level.ModeID;
	import com.renatus.reversi.event.StartPVPEvent;
	import com.renatus.reversi.event.TintEvent;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 
	 */
	public class StartPVPPlayCommand extends SimpleCommand {
		
		override public function execute(notification:INotification):void {
			sendNotification(StartPVPEvent.HIDE);
			sendNotification(LevelList.PREP_LEVEL, ModeID.PVP);
		}
	}
}