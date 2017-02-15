package com.renatus.reversi.command.vk {
  
  import com.nikaent.ane.vk.VK;
  import org.puremvc.as3.interfaces.INotification;
  import org.puremvc.as3.patterns.command.SimpleCommand;
  /**
   * ...
   * @author Bezhenar Viacheslav
   */
  public class VKInitCommand extends SimpleCommand {
    
    override public function execute(notification:INotification):void {
      var vkID:String = String(CONFIG::VK_ID);
      VK.init(vkID, null, true); 
    }
  }
}