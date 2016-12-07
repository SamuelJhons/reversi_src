package com.renatus.reversi.command.level.preplevel {
	
	import com.renatus.reversi.command.level.LevelList;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 
	 */
	public class PrepLevelInitCommand extends SimpleCommand {
		
		override public function execute(notification:INotification):void {
			facade.registerCommand(LevelList.PREP_LEVEL, PrepLevelCommand);
			facade.registerCommand(PrepLevelList.PREP_MODEL, PrepModelCommand);
			facade.registerCommand(PrepLevelList.PREP_UI, PrepUICommand);
		}
	}
}