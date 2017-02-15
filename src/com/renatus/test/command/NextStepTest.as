package com.renatus.test.command {
	
	import asunit.framework.TestCase;
	import com.demonsters.debugger.MonsterDebugger;
	import com.renatus.reversi.command.level.utils.gird.NextStep;
	import com.renatus.reversi.model.LevelData;
	
	/**
	 * 
	 */
	public class NextStepTest extends TestCase {
		
		private var _nextStep:NextStep;
		private var _grid:Vector.<int>;
		private var testGrid:Array;
		
		public function NextStepTest(testMethod:String=null) {
			super(testMethod);
			
		}
		
		override protected function setUp():void {
			super.setUp();
			_nextStep = new NextStep();
			
			_grid = new Vector.<int>(64);
			_grid[28] = LevelData.ITEM_1;
			_grid[29] = LevelData.ITEM_2;
			_grid[36] = LevelData.ITEM_2;
			_grid[37] = LevelData.ITEM_1;
			
			testGrid = []
			var index:int = 0;
			while (index < 64) {
				testGrid[index] = LevelData.ITEM_CLEAR;
				index++;
			}
			testGrid[28] = LevelData.ITEM_1;
			testGrid[21] = LevelData.ITEM_1;
			testGrid[29] = LevelData.ITEM_1;
			testGrid[36] = LevelData.ITEM_2;
			testGrid[37] = LevelData.ITEM_1;
		}
		
		public function getNewGrid():void {
			var newVectorGrid:Vector.<int> = _nextStep.getNewGrid(21, _grid, LevelData.ITEM_1, LevelData.ITEM_2, LevelData.ITEM_CLEAR);
			var newGrid:Array = [];
			var index:int = 0;
			while (index < 64) {
				newGrid[index] = newVectorGrid[index];
				index++;
			}
			
			assertEqualsArrays(testGrid, newGrid);
		}
	}
}