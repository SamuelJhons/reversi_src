package com.renatus.reversi.command.level.prepstep 
{
	import com.renatus.reversi.command.level.LevelList;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 
	 */
	public class PrepStepInitCommand extends SimpleCommand {
		
		override public function execute(notification:INotification):void {
			facade.registerCommand(LevelList.PREP_STEP, PrepStepCommand);
			facade.registerCommand(PrepStepList.SHOW_AVAILABLE, ShowAvailableCommand);
		}
		
	}
}