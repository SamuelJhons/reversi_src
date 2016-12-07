package com.renatus.reversi.view.utils {
	import starling.display.DisplayObject;
	/**
	 * 
	 */
	public class AnimObj {
		
		private var _startX:int;
		private var _startY:int;
		private var _time:Number;
		private var _target:DisplayObject;
		private var _properties:Object;
			
		public function initShow(target:DisplayObject, cfg:XML):void {
			_target = target;
			_properties = { };
			_properties.transition = String(cfg.show.@tran);
			_startX = target.x;
			_startY = target.y;
			_time = Number(cfg.show.@time) / 1000;
			switch(String(cfg.show.@dir)) {
				case "left":
					_properties.x = _startX;
					_startX += target.stage.stageWidth;
					break;
				case "down":
					_properties.y = _startY
					_startY -= target.stage.stageHeight;
					break;
				case "right":
					_properties.x = _startX;
					_startX -= target.stage.stageWidth;
					break;
				case "up":
					_properties.y = _startY
					_startY += target.stage.stageHeight;
					break;
			}
		}
		
		public function initHide(target:DisplayObject, cfg:XML):void {
			_target = target;
			_properties = { };
			_properties.transition = String(cfg.hide.@tran);
			_startX = target.x;
			_startY = target.y;
			_time = Number(cfg.hide.@time) / 1000;
			switch(String(cfg.hide.@dir)) {
				case "left":
					_properties.x = _startX - target.stage.stageWidth;
					break;
				case "down":
					_properties.y = _startY + target.stage.stageHeight;
					break;
				case "right":
					_properties.x = _startX + target.stage.stageWidth;
					break;
				case "up":
					_properties.y = _startY - target.stage.stageHeight;
					break;
			}
		}
		
		public function get startX():int { return _startX; }
		
		public function get startY():int { return _startY; }
		
		public function get time():Number { return _time; }
		
		public function get target():DisplayObject { return _target; }
		
		public function get properties():Object { return _properties; }
		
	}
}