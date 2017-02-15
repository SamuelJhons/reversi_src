package com.renatus.reversi.command.init {
	
	import com.renatus.reversi.model.ProxyName;
	import com.renatus.reversi.model.QueueData;
	import com.renatus.reversi.model.GameProxy;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 
	 */
	public class InitQueueCommand extends SimpleCommand {
		
		override public function execute (notification:INotification) : void {
			
			var data:QueueData = new QueueData();
			data.queue = [];
			facade.registerProxy(new GameProxy(ProxyName.QUEUE, data));
			
			addCommand(InitCommand.START_SCREEN, InitStartScreenCommand, data);
			addCommand(InitCommand.START_MENU, InitStartMenuCommand, data);
			addCommand(InitCommand.START_PVP, InitStartPVPCommand, data);
			addCommand(InitCommand.LEVEL_SCREEN, InitLevelCommand, data);
			addCommand(InitCommand.GAME_OVER, InitGameOverCommand, data);
			addCommand(InitCommand.PAUSE, InitPauseCommand, data);
			addCommand(InitCommand.WARNING, InitWarningCommand, data);
			addCommand(InitCommand.LOGIC, InitLogicCommand, data);
			addCommand(InitCommand.SOUND, InitSoundCommadn, data);
			CONFIG::ANDROID {
				addCommand(InitCommand.VK, InitVKCommand, data);
			}
			addCommand(InitCommand.COMPLETED, InitCompletedCommand, data);
			
			data.total = data.queue.length - 1;
			
			facade.registerCommand(InitCommand.NEXT, InitNextCommand);
			facade.registerCommand(InitCommand.ASSETS, InitAssetsCommand);
			sendNotification(InitCommand.ASSETS, notification.getBody());
			
		}
		
		private function addCommand(id:String, cmdClass:Class, data:QueueData):void {
			data.queue.push(id);
			facade.registerCommand(id, cmdClass);
		}
	}
}