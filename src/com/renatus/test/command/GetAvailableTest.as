package com.renatus.test.command {
	
	import asunit.framework.TestCase;
	import com.demonsters.debugger.MonsterDebugger;
	import com.renatus.reversi.command.level.utils.gird.GetAvailable;
	
	/**
	 * 
	 */
	public class GetAvailableTest extends TestCase {
		
		public function GetAvailableTest(testMethod:String=null) {
			super(testMethod);
			
		}
		
		public function check() : void {
			var available:GetAvailable = new GetAvailable();
			var grid:Vector.<int> = new Vector.<int>(64);
			var testArr:Array = [21, 30, 35, 44];
			grid[28] = 1;
			grid[29] = 2;
			grid[36] = 2;
			grid[37] = 1;
			assertEqualsArrays(testArr, available.check(grid, 1, 2, 0));
		}
	}
}