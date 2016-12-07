package com.renatus.reversi.view.utils {
	
	import feathers.controls.Button;
	import starling.display.Image;
	import starling.text.TextField;
	import starling.textures.Texture;
	
	/**
	 * 
	 */
	public interface IUIFactory {
		function getButton(textureID:String,clickListener:Function, name:String = ""):Button;
		function getTitle(name:String = ""):TextField;
		function getLabel(name:String = ""):TextField;
		function getTexture(textureID:String):Texture;
		function getImage(textureID:String):Image;
	}
}