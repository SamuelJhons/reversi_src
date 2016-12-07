package com.renatus.reversi.view {
	
	import feathers.controls.Button;
	import starling.display.Image;
	import starling.events.Event;
	import starling.text.TextField;
	/**
	 * 
	 */
	internal class WarningView extends AView implements IGameView {
		
		public static const GFX_BACK:String				=	"back";
		public static const GFX_BTN_ACCEPT:String		=	"btn_accept";
		public static const GFX_BTN_CANCEL:String		=	"btn_cancel";
		public static const GFX_MAIN_TEXT:String		=	"main_text";
		
		public static const CANCEL_CLICK:String			=	"cancel_click";
		public static const ACCEPT_CLICK:String			=	"accept_click";
		
		public function prepare():void {
			var back:Image = new Image(_uiFactory.getTexture("back_warning"));
			back.name = GFX_BACK;
			_cont.addChild(back);
			
			var btnAccept:Button = _uiFactory.getButton("btn_accept", onAcceptEventListener, GFX_BTN_ACCEPT);
			_cont.addChild(btnAccept);
			
			var btnCancle:Button = _uiFactory.getButton("btn_cancel", onCancelEventListener, GFX_BTN_CANCEL);
			_cont.addChild(btnCancle);
			
			var mainText:TextField = _uiFactory.getLabel(GFX_MAIN_TEXT);
			_cont.addChild(mainText);
		}
		
		private function onCancelEventListener(event:Event):void {
			dispatchEvent(new Event(CANCEL_CLICK));
		}
		
		private function onAcceptEventListener(event:Event):void {
			dispatchEvent(new Event(ACCEPT_CLICK));
		}
	}
}