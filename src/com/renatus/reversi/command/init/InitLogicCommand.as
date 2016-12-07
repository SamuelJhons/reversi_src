package com.renatus.reversi.command.init {
	
	import com.renatus.reversi.command.level.condition.ConditionInitCommand;
	import com.renatus.reversi.command.level.preplevel.PrepLevelInitCommand;
	import com.renatus.reversi.command.level.prepstep.PrepStepInitCommand;
	import com.renatus.reversi.command.level.step.StepInitCommand;
	import com.renatus.reversi.command.level.choice.ChoiceInitCommand;
	import org.puremvc.as3.patterns.command.MacroCommand;
	
	/**
	 *
	 */
	public class InitLogicCommand extends MacroCommand {
		
		override protected function initializeMacroCommand () : void {
			addSubCommand(PrepLevelInitCommand);
			addSubCommand(PrepStepInitCommand);
			addSubCommand(StepInitCommand);
			addSubCommand(ChoiceInitCommand);
			addSubCommand(ConditionInitCommand);
			addSubCommand(InitNextCommand);
		}
	}
}