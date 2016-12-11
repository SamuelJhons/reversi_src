package com.renatus.reversi.command.level.utils.ai {
	import com.demonsters.debugger.MonsterDebugger;
	import com.renatus.reversi.Config;
	import com.renatus.reversi.command.level.utils.gird.GetAvailable;
	import com.renatus.reversi.view.MainStarling;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.setTimeout;
	import starling.core.Starling;
	import starling.events.Event;
	
	public class TestAI extends Sprite {
		
		public function TestAI() {
			super();
			
			
			MonsterDebugger.initialize(this);
			setTimeout(test, 100);
		}
		
		private function test(event:Event = null):void {
			var ai:AI = new AI()
			var arr:Vector.<int> = new Vector.<int>(64);
			for (var i:int = 0; i < 64; i++) {
				arr[i] = 0;
			}
			arr[3 + 4 * 8] = 1;
			arr[4 + 3 * 8] = 1;
			arr[3 + 5 * 8] = 1;
			arr[4 + 4 * 8] = 2;
			arr[3 + 3 * 8] = 2;
			arr[4 + 5 * 8] = 2;
			/*
			var date:Date = new Date();
			var eval:int;
			for (var t:int = 0; t < 10000000; t++) {
				for (var i:int = 0, l:int = arr.length; i < l; i++) {
					if (arr[i] == 1) {
						eval += arr[0];
					} else if(arr[i] == 2){
						eval -= arr[0];
					}
				}
			}
			MonsterDebugger.trace(this, new Date().time - date.time);
			return;
			*/
			var pos:int = ai.getStep(arr, 1, 2, 0, 7);
			pos = ai.getStep(arr, 1, 2, 0, 7);
			pos = ai.getStep(arr, 1, 2, 0, 7);	
			
		}
	}
}