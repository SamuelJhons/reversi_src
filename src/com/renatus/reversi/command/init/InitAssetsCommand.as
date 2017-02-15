package com.renatus.reversi.command.init {
  
  import com.renatus.reversi.Config;
  import com.renatus.reversi.model.GameProxy;
  import com.renatus.reversi.model.ProxyName;
  import com.renatus.reversi.model.UiConfig;
  import com.renatus.reversi.view.utils.UIFactory;
  import org.puremvc.as3.interfaces.INotification;
  import org.puremvc.as3.patterns.command.SimpleCommand;
  import starling.display.Sprite;
  import starling.utils.AssetManager;
  
  /**
   * 
   */
  internal class InitAssetsCommand extends SimpleCommand {
    
    public static const WEB:String         =   "";
    public static const ANDROID1:String    =   "1";
    public static const ANDROID2:String    =   "2";
    public static const ANDROID3:String    =   "3";
    
    private static const WEB_FONT:Number         =   1;
    private static const ANDROID1_FONT:Number    =   0.8;
    private static const ANDROID2_FONT:Number    =   1.2;
    private static const ANDROID3_FONT:Number    =   1.8;
    
    public static const PATH:String		=	"assets/";
    
    [Embed(source = "../../../../../../gfx/derby.ttf" , embedAsCFF="false", fontFamily="Derby")]
    private static const derby:Class;
    private var _scaleID:String;
    private var _fontScale:Number;
    
    override public function execute(notification:INotification):void {
      facade.registerProxy(new GameProxy(ProxyName.UI_CFG, new UiConfig()));
      uiCfg.root = notification.getBody() as Sprite;
      initScaleID();
      loadAssets();
    }
    
    private function initScaleID():void {
      if (CONFIG::ANDROID) {
        if (Config.screenHeight >= 1080) {
          _scaleID = ANDROID3;
          _fontScale = ANDROID3_FONT;
        } else if (Config.screenHeight >= 720) {
          _scaleID = ANDROID2;
          _fontScale = ANDROID2_FONT;
        } else {
          _scaleID = ANDROID1;
          _fontScale = ANDROID1_FONT;
        }
      } else {
        _scaleID = WEB;
        _fontScale = WEB_FONT;
      }
    }
    
    public function loadAssets():void {
      uiCfg.assets = new AssetManager();
      uiCfg.assets.enqueue(PATH + "ui_config.xml");
      uiCfg.assets.enqueue(PATH + "atlas" + _scaleID + ".png");
      uiCfg.assets.enqueue(PATH + "atlas" + _scaleID + ".xml");
      uiCfg.assets.enqueue(PATH + "locale.xml");
      uiCfg.assets.enqueue(PATH + "particle.pex");
      uiCfg.assets.enqueue(PATH + "sfx/click.mp3");
      uiCfg.assets.enqueue(PATH + "sfx/complete.mp3");
      uiCfg.assets.enqueue(PATH + "sfx/complete.mp3");
      uiCfg.assets.enqueue(PATH + "sfx/menu.mp3");
      uiCfg.assets.enqueue(PATH + "sfx/move.mp3");
      uiCfg.assets.enqueue(PATH + "sfx/notify.mp3");
      uiCfg.assets.enqueue(PATH + "sfx/back.mp3");
      uiCfg.assets.loadQueue(handlerLoadQueue);
    }
    
    private function handlerLoadQueue(ratio:Number):void {
      if (ratio == 1.0) {
        onInitAsets();
      }
    }
    
    private function onInitAsets():void {
      uiCfg.cfg = uiCfg.assets.getXml("ui_config");
      uiCfg.locale = uiCfg.assets.getXml("locale");
      UIFactory.getInstance().init(uiCfg.assets, _fontScale);
      sendNotification(InitCommand.NEXT);
    }
  
    private function get uiCfg():UiConfig {
      return facade.retrieveProxy(ProxyName.UI_CFG).getData() as UiConfig;
    }
  }
}