package com.renatus.reversi.view {
  
  import com.renatus.reversi.view.utils.Localization;
  import feathers.controls.Button;
  import starling.display.Image;
  import starling.events.Event;
  import starling.text.TextField;
  /**
   * 
   */
  internal class GameOverView extends AView implements IGameView {
    
    public static const GFX_BACK:String		=	"back";
    public static const GFX_TITLE:String	=	"title";
    public static const GFX_TXT_MAIN:String	=	"txt_main";
    public static const BTN_MENU:String		=	"btn_menu";
    public static const BTN_REPLAY:String	=	"btn_replay";
    CONFIG::ANDROID {
      public static const BTN_SHARE:String  =   "btn_share";
      public static const SHARE_CLICK:String  =   "shareClick"
    }
    
    public static const MENU_CLICK:String	=	"menu_click";
    
    public static const REPLAY_CLICK:String	=	"replay_click";
    
    private var _txtMain:TextField;
    
    public function prepare():void {
      
      var back:Image = new Image(_uiFactory.getTexture("back_start"));
      back.name = GFX_BACK;
      _cont.addChild(back);
      
      var title:TextField = _uiFactory.getTitle(GFX_TITLE);
      _cont.addChild(title);
      
      var btnReplay:Button = _uiFactory.getButton("btn_replay", onReplayEventListener, BTN_REPLAY);
      _cont.addChild(btnReplay);
      
      var btnMenu:Button = _uiFactory.getButton("btn_menu", onMenuEventListener, BTN_MENU);
      _cont.addChild(btnMenu);
      
      CONFIG::ANDROID {
          var btnShare:Button = _uiFactory.getButton("btn_share", onShareEventListener, BTN_SHARE);
          _cont.addChild(btnShare);
      }
      
      _txtMain = _uiFactory.getLabel(GFX_TXT_MAIN);
      _cont.addChild(_txtMain);
    }
    
    CONFIG::ANDROID {
        private function onShareEventListener():void {
          dispatchEvent(new Event(SHARE_CLICK));
        }
    }
    
    public function setWinText(locale:XML, id:String):void {
      _txtMain.text = Localization.getText(locale, id);
    }
    
    private function onMenuEventListener(event:Event):void {
      dispatchEvent(new Event(MENU_CLICK));
    }
    
    private function onReplayEventListener(event:Event):void {
      dispatchEvent(new Event(REPLAY_CLICK));
    }
  }
}