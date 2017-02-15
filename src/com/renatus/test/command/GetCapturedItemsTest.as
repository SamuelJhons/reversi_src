package com.renatus.test.command {
	import asunit.framework.TestCase;
	import com.demonsters.debugger.MonsterDebugger;
	import com.renatus.reversi.command.level.utils.gird.GetCapturedItems;
	import com.renatus.reversi.model.LevelData;
	
	/**
	 * 
	 */
	public class GetCapturedItemsTest extends TestCase {
		
		public function GetCapturedItemsTest(testMethod:String=null) {
			super(testMethod);
			
		}
		
		public function getList():void {
			var captured:GetCapturedItems = new GetCapturedItems();
			var grid:Vector.<int> = new Vector.<int>(64);
			grid[28] = LevelData.ITEM_1;
			grid[29] = LevelData.ITEM_2;
			grid[36] = LevelData.ITEM_2;
			grid[37] = LevelData.ITEM_1;
			var testArr1:Array = [29];// 21
			var testArr2:Array = [36];// 44
			assertEqualsArrays(testArr1, captured.getList(21, grid, LevelData.ITEM_1, LevelData.ITEM_2, LevelData.ITEM_CLEAR));
			assertEqualsArrays(testArr2, captured.getList(44, grid, LevelData.ITEM_1, LevelData.ITEM_2, LevelData.ITEM_CLEAR));
		}
	}
}