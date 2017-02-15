package com.renatus.reversi.command.level.utils.ai {
	import com.demonsters.debugger.MonsterDebugger;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class TestAI extends Sprite {
		
		public function TestAI() {
			super();
			
			
			MonsterDebugger.initialize(this);
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
			
			var point:Point = ai.getStep(arr, 1, 2, 0, 7);
			point = ai.getStep(arr, 1, 2, 0, 7);
			point = ai.getStep(arr, 1, 2, 0, 7);
			point = ai.getStep(arr, 1, 2, 0, 7);
			
			
/*			var arr:Array = [];
			var vect:Vector.<int> = new Vector.<int>(64);
			for (var i:int = 0; i < 64; i++) {
				arr[i] = 0;
				vect[i] = 0;
			}
			
			var date:Date = new Date();
			var q = 0;
			while (q < 1000000) {
				arr.concat();
				for (var i:int = 0, l:int = arr.length; i < l; i++ ) {
					//arr[i]++;
				}
				q++;
			}
			MonsterDebugger.trace(this, new Date().time - date.time);
			
			var date:Date = new Date();
			var q = 0;
			while (q < 1000000) {
				vect.concat();
				for (var i:int = 0, l:int = vect.length; i < l; i++ ) {
					//vect[i]++;
				}
				q++;
			}
			MonsterDebugger.trace(this, new Date().time - date.time);
*/		}
	}
}