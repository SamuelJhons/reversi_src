package com.renatus.reversi.view {
	
	import starling.display.Sprite;
	/**
	 * 
	 */
	public class MainStarling extends Sprite {
		
		public function MainStarling() {
			super();
			initCont();
		}	
		
		private function initCont():void {
			add(ContList.BACK);
			add(ContList.PROGRESS);
			add(ContList.LEVEL);
			add(ContList.INTERFACE);
			add(ContList.START_PVP);
			add(ContList.START_MENU);
			add(ContList.TINT);
			add(ContList.PAUSE);
			add(ContList.GAME_OVER);
			add(ContList.WARNING);
		}
		
		private function add(id:String):void {
			var cont:Sprite = new Sprite();
			cont.name = id;
			addChild(cont);
		}
	}
}