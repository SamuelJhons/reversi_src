package com.renatus.reversi.view {
	
	import com.demonsters.debugger.MonsterDebugger;
	import feathers.controls.Button;
	import feathers.controls.Radio;
	import feathers.controls.Slider;
	import feathers.core.ToggleGroup;
	import feathers.layout.Direction;
	import feathers.skins.ImageSkin;
	import flash.geom.Rectangle;
	import starling.display.Image;
	import starling.events.Event;
	import starling.text.TextField;
	/**
	 * 
	 */
	public class StartPVPView extends AView implements IGameView {
		
		public static const GFX_BACK_WIN:String			=	"back_win";
		public static const GFX_TITLE:String			=	"title";
		public static const GFX_BTN_BACK:String			=	"btn_back";
		public static const GFX_BTN_PLAY:String			=	"btn_play";
		public static const GFX_RADIO1:String			=	"radio1";
		public static const GFX_RADIO2:String			=	"radio2";
		public static const GFX_ARROW:String			=	"arrow";
		public static const GFX_SLIDER:String			=	"slider";
		public static const GFX_SLIDER_BACK:String		=	"slider_back";
		
		public static const ON_CHANGE_RADIO:String		=	"onChangeRadio";
		public static const ON_PLAY:String				=	"onPlay";
		public static const ON_BACK:String				=	"onBack";
		public static const ON_SLIDER_CHANGE:String		=	"onSliderChange";
		
		
		private var _imgArrow:Image;
		
		public function prepare():void {
			var back:Image = new Image(_uiFactory.getTexture("back_start"));
			back.name = GFX_BACK_WIN;
			_cont.addChild(back);
			
			var title:TextField = _uiFactory.getTitle(GFX_TITLE);
			_cont.addChild(title);			
			
			var txtSelectColor:TextField = _uiFactory.getLabel("txt_select_color");
			_cont.addChild(txtSelectColor);
			
			var txtSelectDiff:TextField = _uiFactory.getLabel("txt_select_diff");
			_cont.addChild(txtSelectDiff);
			
			var btnBack:Button = _uiFactory.getButton("btn_back", onBackEventListener, GFX_BTN_BACK);
			_cont.addChild(btnBack);
			
			var btnPlay:Button = _uiFactory.getButton("btn_play", onPlayEventListener, GFX_BTN_PLAY);
			_cont.addChild(btnPlay);
			
			_imgArrow = _uiFactory.getImage("arrow_left");
			_imgArrow.name = GFX_ARROW;
			_cont.addChild(_imgArrow);
			
			var group:ToggleGroup = new ToggleGroup();
			group.addEventListener(Event.CHANGE, onRadioChangeEventListener);
			
			var radioItem1:Radio = new Radio();
			radioItem1.toggleGroup = group;
			radioItem1.isSelected = true;
			radioItem1.defaultSkin = _uiFactory.getImage("item1_selected");
			radioItem1.defaultSelectedSkin = _uiFactory.getImage("item1");
			radioItem1.name = GFX_RADIO1;
			_cont.addChild(radioItem1);
			radioItem1.validate();
			
			var radioItem2:Radio = new Radio();
			radioItem2.toggleGroup = group;
			radioItem2.defaultSkin = _uiFactory.getImage("item2_selected");
			radioItem2.defaultSelectedSkin = _uiFactory.getImage("item2");
			radioItem2.name = GFX_RADIO2;
			_cont.addChild(radioItem2);
			radioItem2.validate();
			
			var sliderBack:Image = _uiFactory.getImage("slider_back");
			sliderBack.name = GFX_SLIDER_BACK;
			_cont.addChild(sliderBack);
			
			var slider:Slider = new Slider();
			slider.minimum = 1;
			slider.maximum = 5;
			slider.step = 1;
			slider.direction = Direction.HORIZONTAL;
			slider.thumbFactory = function():Button {
				var button:Button = new Button();
				var skin:ImageSkin = new ImageSkin( _uiFactory.getTexture("slider_bar") );
				skin.scale9Grid = new Rectangle( 7, 7, 2, 2 );
				button.defaultSkin = skin;
				return button;
			}
			slider.name = GFX_SLIDER;
			_cont.addChild(slider);
			slider.width = sliderBack.width * 0.95;
			slider.validate();
			slider.addEventListener(Event.CHANGE, onSliderChangeEventListener);
		}
		
		private function onSliderChangeEventListener(event:Event):void {
			dispatchEvent(new Event(ON_SLIDER_CHANGE, false, Slider(event.target).value));
		}
		
		private function onRadioChangeEventListener(event:Event):void {
			if (ToggleGroup(event.target).selectedIndex == 0) {
				_imgArrow.texture = _uiFactory.getTexture("arrow_left");
			} else {
				_imgArrow.texture = _uiFactory.getTexture("arrow_right");
			}
			_imgArrow.readjustSize();
			dispatchEvent(new Event(ON_CHANGE_RADIO));
		}
		
		private function onPlayEventListener(event:Event):void {
			dispatchEvent(new Event(ON_PLAY));
		}
		
		private function onBackEventListener(event:Event):void {
			dispatchEvent(new Event(ON_BACK));
		}
	}
}