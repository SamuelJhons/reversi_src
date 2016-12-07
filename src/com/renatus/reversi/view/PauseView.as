package com.renatus.reversi.view {
	
	import feathers.controls.Button;
	import feathers.controls.text.BitmapFontTextRenderer;
	import starling.display.Image;
	import starling.events.Event;
	import starling.text.TextField;
	/**
	 * 
	 */
	internal class PauseView extends AView implements IGameView {
		
		public static const GFX_BACK:String			=	"back";
		public static const GFX_BTN_MENU:String		=	"btn_menu"
		public static const GFX_BTN_REPLAY:String	=	"btn_replay";
		public static const GFX_BTN_PLAY:String		=	"btn_play";
		public static const GFX_TITLE:String		=	"title";
		
		public static const MENU_CLICK:String		=	"menu_click";
		public static const PLAY_CLICK:String		=	"play_click";
		public static const REPLAY_CLICK:String		=	"replay_click";
		
		public function PauseView() {
			
		}
		
		public function prepare():void {
			var back:Image = new Image(_uiFactory.getTexture("back_pause"));
			back.name = GFX_BACK;
			_cont.addChild(back);
			
			var title:TextField = _uiFactory.getTitle(GFX_TITLE);
			_cont.addChild(title);
			
			var btnMenu:Button = _uiFactory.getButton("btn_menu", onMenuEventListener, GFX_BTN_MENU);
			_cont.addChild(btnMenu);
			
			var btnReplay:Button = _uiFactory.getButton("btn_replay", onReplayEventListener, GFX_BTN_REPLAY);
			_cont.addChild(btnReplay);
			
			var btnPlay:Button = _uiFactory.getButton("btn_play", onPlayEventListener, GFX_BTN_PLAY);
			_cont.addChild(btnPlay);
		}
		
		private function onPlayEventListener(event:Event):void {
			dispatchEvent(new Event(PLAY_CLICK));
		}
		
		private function onReplayEventListener(event:Event):void {
			dispatchEvent(new Event(REPLAY_CLICK));
		}
		
		private function onMenuEventListener(event:Event):void {
			dispatchEvent(new Event(MENU_CLICK));
		}
	}
}