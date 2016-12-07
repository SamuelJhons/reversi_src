package com.renatus.reversi.view 
{
	import com.demonsters.debugger.MonsterDebugger;
	import feathers.controls.Button;
	import feathers.controls.text.BitmapFontTextRenderer;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.events.Event;
	import starling.extensions.PDParticleSystem;
	import starling.text.TextField;
	/**
	 * 
	 */
	internal class InterfaceView extends AView implements IGameView {
		
		public static const GFX_BTN_PAUSE:String		=	"btn_pause";
		public static const GFX_TXT_FIRST:String		=	"txt_first";
		public static const GFX_TXT_SECOND:String		=	"txt_second";
		public static const GFX_BAR_FIRST:String		=	"bar_first";
		public static const GFX_BAR_SECOND:String		=	"bar_second";
		public static const GFX_BACK_FIRST:String		=	"back_first";
		public static const GFX_BACK_SECOND:String		=	"back_second";
		public static const GFX_COUNT1_BACK:String		=	"count1_back";
		public static const GFX_COUNT2_BACK:String		=	"count2_back";
		
		public static const PAUSE_CLICK:String			=	"pause_click";
		
		private var _btnPause:Button;
		private var _txtFirst:TextField;
		private var _txtSecond:TextField;
		private var _barFirst:Image;
		private var _barSecond:Image;
		
		private var _ps1:PDParticleSystem;
		private var _ps2:PDParticleSystem;
		
		public function InterfaceView() {
			
		}
		
		public function prepare():void {
			_btnPause = _uiFactory.getButton("btn_pause", onPauseEventListener, GFX_BTN_PAUSE);
			_cont.addChild(_btnPause);
						
			var barBackFirst:Image = new Image(_uiFactory.getTexture("game_progress_back"));
			barBackFirst.name = GFX_BACK_FIRST;
			_cont.addChild(barBackFirst);
			
			var barBackSecond:Image = new Image(_uiFactory.getTexture("game_progress_back"));
			barBackSecond.name = GFX_BACK_SECOND;
			_cont.addChild(barBackSecond);
			
			_barFirst = new Image(_uiFactory.getTexture("game_progress_bar"));
			_barFirst.pivotY = _barFirst.height;
			_barFirst.name = GFX_BAR_FIRST;
			_cont.addChild(_barFirst);
			
			_barSecond = new Image(_uiFactory.getTexture("game_progress_bar"));
			_barSecond.pivotY = _barSecond.height;
			_barSecond.name = GFX_BAR_SECOND;
			_cont.addChild(_barSecond);
			
			var count1Back:Image = new Image(_uiFactory.getTexture("item1"));
			count1Back.name = GFX_COUNT1_BACK;
			_cont.addChild(count1Back);
			
			var count2Back:Image = new Image(_uiFactory.getTexture("item2"));
			count2Back.name = GFX_COUNT2_BACK;
			_cont.addChild(count2Back);
			
			_txtFirst = _uiFactory.getTitle(GFX_TXT_FIRST);
			_txtFirst.width = count1Back.width;
			_txtFirst.height = count1Back.height;
			_cont.addChild(_txtFirst);
			
			_txtSecond = _uiFactory.getTitle(GFX_TXT_SECOND);
			_txtSecond.width = count2Back.width;
			_txtSecond.height = count2Back.height;
			_cont.addChild(_txtSecond);
		}
		
		public function initParticles(pex:XML):void {
			_ps1 = new PDParticleSystem(pex, _uiFactory.getTexture("progress_particle"));
			_cont.addChildAt(_ps1, _cont.getChildIndex(_barFirst) + 1);
			_ps2 = new PDParticleSystem(pex, _uiFactory.getTexture("progress_particle"));
			_cont.addChildAt(_ps2, _cont.getChildIndex(_barSecond) + 1);
		}
		
		public function setFirstCount(value:int):void {
			_txtFirst.text = value + "";
			Starling.juggler.removeTweens(_barFirst);
			Starling.juggler.tween( _barFirst, 1, { scaleY:value / 72 + 0.125, 
													onUpdate:updateParticles, onUpdateArgs:[_barFirst,_ps1] } );
		}
		
		public function setSecondCount(value:int):void {
			_txtSecond.text = value + "";
			Starling.juggler.removeTweens(_barSecond);
			Starling.juggler.tween( _barSecond, 1, { scaleY: value / 72 + 0.125, 
													 onUpdate:updateParticles, onUpdateArgs:[_barSecond,_ps2] } );
		}
		
		private function updateParticles(bar:Image, particle:PDParticleSystem):void {
			particle.emitterY = bar.y - bar.height;
			particle.emitterX = bar.x + bar.width / 2;
		}
		
		private function onPauseEventListener(event:Event):void {
			dispatchEvent(new Event(PAUSE_CLICK));
		}
		
		override public function hide():void {
			super.hide();
			_ps1.visible = false;
			_ps2.visible = false;
			_ps1.stop();
			_ps2.stop();
			Starling.juggler.remove(_ps1);
			Starling.juggler.remove(_ps2);
		}
		
		override public function show():void {
			super.show();
			_barFirst.scaleY = 0.01;
			_barSecond.scaleY = 0.01;
			updateParticles(_barFirst, _ps1);
			updateParticles(_barSecond, _ps2);
			Starling.juggler.add(_ps1);
			Starling.juggler.add(_ps2);
			_ps1.start();
			_ps2.start();
			_ps1.visible = true;
			_ps2.visible = true;
		}
	}
}