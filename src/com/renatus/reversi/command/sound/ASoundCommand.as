package com.renatus.reversi.command.sound {
	
	import com.renatus.reversi.model.ProxyName;
	import com.renatus.reversi.model.SoundData;
	import com.renatus.reversi.model.UiConfig;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 
	 */
	internal class ASoundCommand extends SimpleCommand {
		
		protected function get sfx():SoundData {
			return facade.retrieveProxy(ProxyName.SOUND).getData() as SoundData;
		}
		
		protected function get uiCfg():UiConfig {
			return facade.retrieveProxy(ProxyName.UI_CFG).getData() as UiConfig;
		}
	}
}