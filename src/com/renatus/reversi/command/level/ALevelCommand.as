package com.renatus.reversi.command.level {
	
	import com.renatus.reversi.model.LevelData;
	import com.renatus.reversi.model.ProxyName;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * 
	 */
	public class ALevelCommand extends SimpleCommand {
		
		protected function get data():LevelData {
			return facade.retrieveProxy(ProxyName.LEVEL).getData() as LevelData;
		}
		
	}
}