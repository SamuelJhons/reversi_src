package com.renatus.reversi.view 
{
	import org.puremvc.as3.patterns.mediator.Mediator;
	import starling.display.Sprite;
	import starling.utils.AssetManager;
	
	/**
	 * 
	 */
	public class BackgroundMediator extends AMediator {
		
		public function BackgroundMediator(cont:Sprite ) {
			super(ContList.BACK, new BackgroundView(), cont);
		}
	}
}