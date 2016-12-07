package com.renatus.reversi.command {
	
	import com.renatus.reversi.command.init.InitCommand;
	import com.renatus.reversi.command.init.InitQueueCommand;
	import com.renatus.reversi.view.MainStarling;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.geom.Rectangle;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import starling.core.Starling;
	import starling.events.Event;
	
	/**
	 * 
	 */
	public class StartupCommand extends SimpleCommand {
		
		private var _starling:Starling;
		
		override public function execute(notification:INotification):void {
			var stage:Stage = Sprite(notification.getBody()).stage;
			_starling = new Starling(MainStarling, stage, new Rectangle(0, 0, stage.stageWidth, stage.stageHeight), 
									 null, "auto", "baseline");
			_starling.stage.color = 0x000000;
			_starling.addEventListener(Event.ROOT_CREATED, onRootCreated);
			_starling.start();
		}
		
		private function onRootCreated(event:Event):void {
			_starling.removeEventListener(Event.ROOT_CREATED, onRootCreated);
			facade.registerCommand(InitCommand.QUEUE, InitQueueCommand);
			sendNotification(InitCommand.QUEUE, event.data.root);
		}
	}
}