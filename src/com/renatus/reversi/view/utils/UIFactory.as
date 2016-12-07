package com.renatus.reversi.view.utils 
{
	import feathers.controls.Button;
	import starling.display.Image;
	import starling.events.Event;
	import starling.filters.DropShadowFilter;
	import starling.text.TextField;
	import starling.text.TextFormat;
	import starling.textures.Texture;
	import starling.utils.AssetManager;
	/**
	 * 
	 */
	public class UIFactory implements IUIFactory {
		
		private var _assets:AssetManager;
		
		public function UIFactory(assets:AssetManager) {
			_assets = assets;
		}
		
		public function getButton(textureID:String,clickListener:Function, name:String = ""):Button {
			var btn:Button = new Button();
			btn.useHandCursor = true;
			btn.defaultSkin = new Image(_assets.getTexture(textureID + "_normal"));
			btn.hoverSkin = new Image(_assets.getTexture(textureID + "_over"));
			btn.downSkin = new Image(_assets.getTexture(textureID + "_down"));
			btn.disabledSkin = new Image(_assets.getTexture(textureID + "_disable"));
			btn.addEventListener(Event.TRIGGERED, clickListener);
			btn.name = name;
			btn.validate();
			return btn;
		}
		
		public function getTitle(name:String = ""):TextField {
			var txt:TextField = getTextField("Derby", 28, 0xFFFFFF, name);
			txt.filter = new DropShadowFilter(2, 0.785, 0x1c6b65, 7, 1, 1);
			return txt;
		}
		
		public function getLabel(name:String = ""):TextField {
			var txt:TextField = getTextField("Derby", 24, 0xFFFFFF, name);
			txt.filter = new DropShadowFilter(2, 0.785, 0x3a230a, 5, 1, 1);
			return txt;
		}
		
		private function getTextField(fontID:String, size:int, color:uint, name:String = ""):TextField {
			var txt:TextField = new TextField(100, 100);
			txt.name = name;
			txt.touchable = false;
			txt.format = new TextFormat(fontID, size, color);
			return txt;
		}
		
		public function getTexture(textureID:String):Texture {
			return _assets.getTexture(textureID);
		}
		
		public function getImage(textureID:String):Image {
			return new Image(_assets.getTexture(textureID));
		}
	}
}