package com.renatus.test 
{
	import asunit.framework.TestSuite;
	import com.renatus.test.command.GetAvailableTest;
	import com.renatus.test.command.GetCapturedItemsTest;
	import com.renatus.test.command.NextStepTest;
	
	/**
	 * 
	 */
	public class AllTests extends TestSuite {
		
		public function AllTests() {
			super();
			addTest(new GetAvailableTest("check"));
			addTest(new GetCapturedItemsTest("getList"));
			addTest(new NextStepTest("getNewGrid"));
		}
		
	}

}