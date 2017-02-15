package com.renatus.reversi.command.vk {
  
  import com.nikaent.ane.vk.VK;
  import com.renatus.reversi.event.VKEvent;
  import com.renatus.reversi.model.ProxyName;
  import com.renatus.reversi.model.UiConfig;
  import com.renatus.reversi.view.utils.Localization;
  import org.puremvc.as3.interfaces.INotification;
  import org.puremvc.as3.patterns.command.SimpleCommand;
  /**
   * ...
   * @author Bezhenar Viacheslav
   */
  public class VKWallPostCommand extends SimpleCommand {
    
    override public function execute(notification:INotification):void {
      if (!VK.isLoggedIn()) {
        sendNotification(VKEvent.LOGIN, { onCompleteEvent:VKEvent.WALL_POST } );
      } else {
        VK.api("wall.post", { message:Localization.getText(uiCfg.locale, "wall_post") }, onSuccess, onError);
      }
    }
    
    private function onError(data:Object):void {
      //
    }
    
    private function onSuccess(data:Object):void {
      //
    } 
    
    private function get uiCfg():UiConfig {
      return facade.retrieveProxy(ProxyName.UI_CFG).getData() as UiConfig;
    }
  }
}