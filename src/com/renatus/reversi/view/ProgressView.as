package com.renatus.reversi.view {
	
	import com.demonsters.debugger.MonsterDebugger;
	import starling.core.Starling;
	import starling.display.Image;
	/**
	 * 
	 */
	internal class ProgressView extends AView implements IGameView {
		
		public static const GFX_PROGRESS_BACK:String		=	"progress_back";
		public static const GFX_PROGRESS_BAR:String			=	"progress_bar";
		
		private var _progressBar:Image;
		private var _progressBack:Image;
		
		public function ProgressView() {
			
		}
		
		public function prepare():void {
			_progressBack = new Image(_uiFactory.getTexture(GFX_PROGRESS_BACK));
			_progressBack.name = GFX_PROGRESS_BACK;
			_cont.addChild(_progressBack);
			
			_progressBar = new Image(_uiFactory.getTexture(GFX_PROGRESS_BAR));
			_progressBar.name = GFX_PROGRESS_BAR;
			_progressBar.scaleX = 0;
			_cont.addChild(_progressBar);
			_cont.visible = true;
		}
		
		public function updateProgress(value:Number):void {
			Starling.juggler.removeTweens(_progressBar);
			Starling.juggler.tween(_progressBar, 0.3, { scaleX:value } );
		}
		
		public function clear():void {
			_cont.removeChild(_progressBack);
			_cont.removeChild(_progressBar);
			_progressBack.dispose();
			_progressBar.dispose();
			_progressBar = null;
			_progressBack = null;
		}
	}
}