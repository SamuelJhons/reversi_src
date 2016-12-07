package com.renatus.reversi.view {
	
	import com.renatus.reversi.Config;
	import com.renatus.reversi.view.utils.ItemData;
	import com.renatus.reversi.view.utils.LevelAnimation;
	import com.renatus.reversi.view.utils.LevelItem;
	import feathers.controls.Button;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.events.Event;
	/**
	 * 
	 */
	internal class LevelView extends AView implements IGameView {
		
		public static const PREF:String			=	"back_";
		public static const PREF2:String		=	"item_";
		
		public static const ITEM_SELECT:String		=	"item_select";
		
		private var _backList:Array;
		private var _itemList:Array;
		
		private var _levelAnim:LevelAnimation;
		
		public function LevelView() {
			
		}
		
		public function prepare():void {
			_levelAnim = new LevelAnimation();
			_backList = [];
			_itemList = [];
			var btn:Button;
			for (var i:int = 0; i < Config.HEIGHT ; i++) {
				_backList[i] = [];
				_itemList[i] = [];
				for (var j:int = 0; j < Config.WIDTH; j++) {
					btn = new Button();
					btn.useHandCursor = true;
					btn.defaultSkin = new Image(_uiFactory.getTexture("item_back_normal"));
					btn.disabledSkin = new Image(_uiFactory.getTexture("item_back_disable"));
					btn.name = PREF + i + "_" + j;
					btn.addEventListener(Event.TRIGGERED, onTriggeredEventListener);
					_backList[i][j] = btn;
					btn.validate();
					_cont.addChild(btn);
					_itemList[i][j] = new LevelItem(_uiFactory);
					_itemList[i][j].name = PREF2 + i + "_" + j;
					_cont.addChild(_itemList[i][j]);
				}
			}
		}
		
		override public function show():void {
			_levelAnim.showGrid(_backList);
			_cont.visible = true;
		}
		
		override public function hide():void {
			hideItems();
		}
		
		private function hideItems():void {
			for (var i:int = 0; i < Config.HEIGHT ; i++) {
				for (var j:int = 0; j < Config.WIDTH; j++) {
					_itemList[i][j].hideAnim();
					_backList[i][j].visible = false;
				}
			}
		}
		
		public function switchItem(data:ItemData):void {
			var item:LevelItem = _itemList[data.i][data.j] as LevelItem;
			item.switchAnim(data.id);
		}
		
		public function addItem(data:ItemData):void {
			var item:LevelItem = _itemList[data.i][data.j] as LevelItem;
			item.setID(data.id);
			item.addAnim();
			item.visible = true;
		}
		
		public function disableAll():void {
			for (var i:int = 0; i < Config.HEIGHT ; i++) {
				for (var j:int = 0; j < Config.WIDTH; j++) {
					_backList[i][j].isEnabled = false;
					_backList[i][j].useHandCursor = false;
				}
			}
		}
		
		public function enableLevel():void {
			_cont.touchable = true;
		}
		
		public function disableLevel():void {
			_cont.touchable = false;
		}
		
		public function enableItem(i:int, j:int):void {
			_backList[i][j].isEnabled = true;
			_backList[i][j].useHandCursor = true;
		}
		
		
		
		private function onTriggeredEventListener(event:Event):void {
			dispatchEvent(new Event(ITEM_SELECT, false, (event.target as DisplayObject).name));
		}
	}
}