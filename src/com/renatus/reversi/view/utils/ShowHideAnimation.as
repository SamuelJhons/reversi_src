package com.renatus.reversi.view.utils {
	
	import com.demonsters.debugger.MonsterDebugger;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	/**
	 * 
	 */
	public class ShowHideAnimation {
		
		private var _showList:Vector.<AnimObj>;
		private var _hideList:Vector.<AnimObj>;
		
		public function update(cont:Sprite, id:String, cfg:XML):void {
			var length:int = cfg[id].*.length() - cfg[id].grid.length();
			if (length > 0) {
				_showList = new Vector.<AnimObj>(length);
				_hideList = new Vector.<AnimObj>(length);
				var index:int = 0;
				for each(var list:XML in cfg[id].*) {
					if (list.show.length() != 0) {
						if (_showList[index] == null) {
							_showList[index] = new AnimObj();
							_hideList[index] = new AnimObj();
						}
						_showList[index].initShow(cont.getChildByName(list.localName()),list);
						_hideList[index].initHide(cont.getChildByName(list.localName()),list);
						index++;
					}
				}
			}
		}
		
		public function show():void {
			if (_showList != null) {
				anim(_showList);
			}
		}
		
		public function hide():void {
			if (_hideList != null) {
				anim(_hideList);
			}
		}
		
		private function anim(list:Vector.<AnimObj>) :void {
			for each(var item:AnimObj in list) {
				item.target.x = item.startX;
				item.target.y = item.startY;
				Starling.juggler.removeTweens(item.target);
				Starling.juggler.tween(item.target, item.time, item.properties);
			}
		}
	}
}