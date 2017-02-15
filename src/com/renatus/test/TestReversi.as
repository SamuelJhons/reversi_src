package com.renatus.test {
	import asunit.textui.TestRunner;
	import com.demonsters.debugger.MonsterDebugger;
	import flash.display.Sprite;
	
	/**
	 * 
	 */
	public class TestReversi extends Sprite {
		
		public function TestReversi() {
			super();
			MonsterDebugger.initialize(this);
			var unittests:TestRunner = new TestRunner();
			stage.addChild(unittests);
			unittests.start(AllTests, null, TestRunner.SHOW_TRACE);
		}
	}
}