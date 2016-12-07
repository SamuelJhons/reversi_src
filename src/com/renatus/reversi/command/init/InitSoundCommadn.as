package com.renatus.reversi.command.init {
	
	import com.renatus.reversi.command.sound.PlayMusicCommand;
	import com.renatus.reversi.command.sound.PlaySoundCommand;
	import com.renatus.reversi.command.sound.SoundCommand;
	import com.renatus.reversi.command.sound.StopMusicCommand;
	import com.renatus.reversi.model.GameProxy;
	import com.renatus.reversi.model.ProxyName;
	import com.renatus.reversi.model.SoundData;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	/**
	 * 
	 */
	public class InitSoundCommadn extends SimpleCommand{
		
		override public function execute(notification:INotification):void {
			var sfx:SoundData = new SoundData();
			facade.registerProxy(new GameProxy(ProxyName.SOUND, sfx));
			sfx.musicChanel = new SoundChannel();
			sfx.musicTransform = new SoundTransform(0.8);
			sfx.soundTransform = new SoundTransform(1);
			
			facade.registerCommand(SoundCommand.PLAY_BACK, PlayMusicCommand);
			facade.registerCommand(SoundCommand.STOP_BACK, StopMusicCommand);
			facade.registerCommand(SoundCommand.CLICK, 	   PlaySoundCommand);
			facade.registerCommand(SoundCommand.MENU, 	   PlaySoundCommand);
			facade.registerCommand(SoundCommand.MOVE, 	   PlaySoundCommand);
			facade.registerCommand(SoundCommand.NOTIFY,    PlaySoundCommand);
			facade.registerCommand(SoundCommand.COMPLETE,  PlaySoundCommand);
			
			sendNotification(InitCommand.NEXT);
		}
	}
}