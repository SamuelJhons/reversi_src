package com.renatus.reversi {
	
	import com.renatus.reversi.command.StartupCommand;
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;
	
	/**
	*
	*/
	public class GameFacade extends Facade implements IFacade {
		
		public static const NAME:String                         = "GameFacade";
        public static const STARTUP:String                      = NAME + "StartUp";
		
        public static function getInstance():GameFacade {
            return (instance ? instance : new GameFacade()) as GameFacade;
        }
		
        override protected function initializeController():void {
            super.initializeController();			
            registerCommand( STARTUP, StartupCommand );
        }
		
        public function startup(mainSprite:Object):void {
			sendNotification( STARTUP,  mainSprite );
        }
	}
}