package com.renatus.reversi.command.vk {
  
  import com.nikaent.ane.vk.VK;
  import com.nikaent.ane.vk.model.Scope;
  import com.nikaent.ane.vk.model.VKEvent;
  import org.puremvc.as3.interfaces.INotification;
  import org.puremvc.as3.patterns.command.SimpleCommand;
  /**
   * ...
   * @author Bezhenar Viacheslav
   */
  public class VKLoginCommand extends SimpleCommand {
    
    private static const ON_COMPLETE_EVENT_NAME:String   =   "onCompleteEvent";
    
    private var _onCompleteEvent:String;
    
    override public function execute(notification:INotification):void {
      var body:Object = notification.getBody();
      if (body.hasOwnProperty(ON_COMPLETE_EVENT_NAME)) {
        _onCompleteEvent = body[ON_COMPLETE_EVENT_NAME];
      }
      if (!VK.isLoggedIn()) {
        initListeners();
        VK.login(Scope.WALL); 
      } else if (_onCompleteEvent != null) {
        sendNotification(_onCompleteEvent);
      }
    }
    
    private function initListeners():void {
        VK.addEventListener(VKEvent.AUTH_FAILED, onAuthFaildEventListener);
        VK.addEventListener(VKEvent.AUTH_SUCCESSFUL, onAuthSeccessEventListener);
    }
    
    private function removeListeners():void {
        VK.removeEventListener(VKEvent.AUTH_FAILED, onAuthFaildEventListener);
        VK.removeEventListener(VKEvent.AUTH_SUCCESSFUL, onAuthSeccessEventListener);
    }
    
    private function onAuthSeccessEventListener(event:VKEvent):void {
      removeListeners();
      if (_onCompleteEvent != null) {
        sendNotification(_onCompleteEvent);
      }
    }
    
    private function onAuthFaildEventListener(event:VKEvent):void {
      removeListeners();
    }
  }
}