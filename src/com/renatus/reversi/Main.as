package com.renatus.reversi {
	
	import com.demonsters.debugger.MonsterDebugger;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * 
	 */
	public class Main extends Sprite {
		
		public function Main() {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			MonsterDebugger.initialize(this);
			GameFacade.getInstance().startup(this);
		}	
	}
	
}