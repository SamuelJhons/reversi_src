package com.renatus.reversi.view 
{
	import feathers.controls.Button;
	import feathers.controls.text.BitmapFontTextRenderer;
	import feathers.text.BitmapFontTextFormat;
	import starling.display.Image;
	import starling.events.Event;
	import starling.text.TextField;
	/**
	 * 
	 */
	internal class StartMenuView extends AView implements IGameView {
		
		public static const GFX_BACK_WIN:String		=	"back_win";
		public static const GFX_TITLE:String		=	"title";
		public static const GFX_BTN_PVP:String		=	"btn_pvp";
		public static const GFX_BTN_PVE:String		=	"btn_pve";
		public static const GFX_ARROW_LEFT:String	=	"arrow_left";
		public static const GFX_ARROW_RIGHT:String	=	"arrow_right";
		
		public static const PVP_CLICK:String		=	"pvpClick"
		
		public static const PVE_CLICK:String		=	"pveClick"
		
		private var _btnPVP:Button;
		private var _btnPVE:Button;
		
		public function prepare():void {
			var back:Image = new Image(_uiFactory.getTexture("back_start"));
			back.name = GFX_BACK_WIN;
			_cont.addChild(back);
			
			var title:TextField = _uiFactory.getTitle(GFX_TITLE);
			_cont.addChild(title);
			
			_btnPVE = _uiFactory.getButton("btn_pve", onPVEEventListener, GFX_BTN_PVE);
			_cont.addChild(_btnPVE);
			
			_btnPVP = _uiFactory.getButton("btn_pvp", onPVPEventListener, GFX_BTN_PVP);
			_cont.addChild(_btnPVP);
			
			var arrowLeft:Image = _uiFactory.getImage("arrow_left");
			arrowLeft.name = GFX_ARROW_LEFT;
			_cont.addChild(arrowLeft);
			
			var arrowRight:Image = new Image(_uiFactory.getTexture("arrow_right"));
			arrowRight.name = GFX_ARROW_RIGHT;
			_cont.addChild(arrowRight);
		}
		
		private function onPVEEventListener(event:Event):void {
			dispatchEvent(new Event(PVE_CLICK));
		}
		
		private function onPVPEventListener(event:Event):void {
			dispatchEvent(new Event(PVP_CLICK));
		}
	}
}