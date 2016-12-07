package com.renatus.reversi.command.level.condition {
	
	import com.renatus.reversi.command.level.LevelList;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 
	 */
	public class ConditionInitCommand extends SimpleCommand {
		
		override public function execute(notification:INotification):void {
			facade.registerCommand(LevelList.CONDITION, ConditionCommand);
			facade.registerCommand(ConditionList.SWITCH, SwitchCommand);
		}	
	}
}