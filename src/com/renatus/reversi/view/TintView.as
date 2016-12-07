package com.renatus.reversi.view {
	import com.demonsters.debugger.MonsterDebugger;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.textures.TextureSmoothing;
	/**
	 * 
	 */
	public class TintView extends AView implements IGameView {
		
		public function prepare():void {
			var back:Image = new Image(_uiFactory.getTexture("tint"));
			back.width = _cont.stage.stageWidth;
			back.height = _cont.stage.stageHeight;
			back.textureSmoothing = TextureSmoothing.NONE;
			_cont.addChild(back);
		}
		
		override public function show():void {
			_cont.visible = true;
			_cont.alpha = 0;
			Starling.juggler.removeTweens(_cont);
			Starling.juggler.tween(_cont, 0.2, { alpha:1 } );
		}
		
		override public function hide():void {
			Starling.juggler.removeTweens(_cont);
			Starling.juggler.tween(_cont, 0.2, { alpha:0, onComplete:onHide } );
		}
		
		private function onHide():void {
			_cont.visible = false;
		}
	}
}