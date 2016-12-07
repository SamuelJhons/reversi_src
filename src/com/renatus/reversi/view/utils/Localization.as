package com.renatus.reversi.view.utils {
	import starling.display.Sprite;
	import starling.text.TextField;
	/**
	 * 
	 */
	public class Localization {
		
		private var _lang:String	=	"ru";
		
		public function Localization() {
			
		}
		
		public function parse(cfg:XML, locale:XML, cont:Sprite):void {
			for each(var list:XML in cfg[cont.name].*) {
				if (list.@text_id.length() != 0) {
					TextField(cont.getChildByName(list.localName())).text = locale.item.(@id == list.@text_id)[_lang];
				}
			}
		}
		
		public function getText(locae:XML, id:String):String {
			return locae.item.(@id == id)[_lang];
		}
	}
}