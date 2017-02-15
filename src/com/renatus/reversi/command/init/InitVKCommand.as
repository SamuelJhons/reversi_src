package com.renatus.reversi.command.init {
  
  import com.nikaent.ane.vk.VK;
  import com.renatus.reversi.command.vk.VKInitCommand;
  import com.renatus.reversi.command.vk.VKLoginCommand;
  import com.renatus.reversi.command.vk.VKWallPostCommand;
  import com.renatus.reversi.event.VKEvent;
  import org.puremvc.as3.patterns.command.SimpleCommand;
  import org.puremvc.as3.interfaces.INotification;
  /**
   * ...
   * @author Bezhenar Viacheslav
   */
  public class InitVKCommand extends SimpleCommand {
    
    override public function execute(notification:INotification):void {
      try {
        facade.registerCommand(VKEvent.INITIALIZE, VKInitCommand);
        facade.registerCommand(VKEvent.LOGIN, VKLoginCommand);
        facade.registerCommand(VKEvent.WALL_POST, VKWallPostCommand);
        sendNotification(VKEvent.INITIALIZE);
      } catch (error:Error) {
        
      }
      
      sendNotification(InitCommand.NEXT);
    }
  }
}