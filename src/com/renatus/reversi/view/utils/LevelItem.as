package com.renatus.reversi.view.utils {
	
	import com.demonsters.debugger.MonsterDebugger;
	import starling.animation.Transitions;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	
	/**
	 *
	 */
	public class LevelItem extends Sprite {
		
		private var _uiFactory:IUIFactory;
		private var _icon:Image;
		
		public function LevelItem(uiFactory:IUIFactory) {
			_uiFactory = uiFactory;
			visible = false;
		}
		
		public function setID(id:int):void {
			var texture:Texture = _uiFactory.getTexture("item" + id);
			if (_icon == null) {
				_icon = new Image(texture);
				_icon.pivotX = _icon.width / 2;
				_icon.pivotY = _icon.height / 2;
				addChild(_icon);
			} else {
				_icon.texture = texture;
				_icon.readjustSize();
			}
		}
		
		public function addAnim():void {
			Starling.juggler.removeTweens(this);
			this.scaleX = this.scaleY = 0.01;
			Starling.juggler.tween(this, 0.5, { scaleX:1, scaleY:1, transition:Transitions.EASE_OUT_BOUNCE } );
		}
		
		public function hideAnim():void {
			if (_icon != null) {
				Starling.juggler.removeTweens(this);
				this.scaleX = this.scaleY = 1;
				Starling.juggler.tween(this, 0.5, { scaleX:0.01, scaleY:0.01, transition:Transitions.EASE_OUT_BOUNCE } );
			}
		}
		
		public function switchAnim(id:int):void {
			Starling.juggler.removeTweens(this);
			Starling.juggler.tween(this, 0.15, { scaleX:1.2, scaleY:1.2, alpha:0.5,
												transition:Transitions.EASE_OUT_BACK, 
												onComplete:switchID, onCompleteArgs:[id] } );
		}
		
		private function switchID(id:int):void {
			setID(id);
			Starling.juggler.tween(this, 0.15, { scaleX:1, scaleY:1, alpha:1, transition:Transitions.EASE_OUT_BACK} );
		}
	}
}