package com.renatus.reversi.command.level.choice {
	
	import com.renatus.reversi.command.level.LevelList;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 
	 */
	public class ChoiceInitCommand extends SimpleCommand {
		
		override public function execute(notification:INotification):void {
			facade.registerCommand(LevelList.PLAYER_CHOICE, ChoiceCommand);
		}
	}
}