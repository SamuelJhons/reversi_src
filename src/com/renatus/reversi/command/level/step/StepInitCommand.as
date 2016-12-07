package com.renatus.reversi.command.level.step {
	
	import com.renatus.reversi.command.level.LevelList;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 
	 */
	public class StepInitCommand extends SimpleCommand {
		
		override public function execute(notification:INotification):void {
			facade.registerCommand(LevelList.STEP, StepCommand);
			facade.registerCommand(StepList.AI_STEP, AIStepCommand);
		}
	}
}