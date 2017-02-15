package com.renatus.reversi.view.utils {
  
  import com.demonsters.debugger.MonsterDebugger;
  import com.renatus.reversi.Config;
  import starling.display.DisplayObject;
  import starling.display.Sprite;
  /**
   * 
   */
  public class PlaceMaker {
    
    private var _width:int;
    private var _height:int;
    
    public function update(cont:Sprite, id:String, cfg:XML):void {
      _width = Config.screenWidth;
      _height = Config.screenHeight;
      for each(var list:XML in cfg[id].*) {
        switch(list.localName()) {
          case "grid":
            setGrid(list, cont);
            break;
          default:
            format(list, cont);
            break;
        }
      }
    }
    
    private function format(list:XML, cont:Sprite):void {
      var dispObj:DisplayObject = cont.getChildByName(list.name);
      for each(var id:XML in list.align.attributes()) {
        switch(id.localName()) {
          case "x":
            setX(list, cont);
            break;
          case "y":
            setY(list, cont);
            break;
        }
      }
    }
    
    private function setX(list:XML, cont:Sprite):void {
      var target:DisplayObject = cont.getChildByName(list.localName ());
      if (list.align.@target.length() != 0) {
        var targetCont:DisplayObject = cont.getChildByName(list.align.@target);
        if (list.align.@width.length() != 0) {
          target.width = targetCont.width * Number(list.align.@width) / 100;
        }
        target.x = targetCont.x + targetCont.width * Number(list.align.@x) / 100;
      } else {
        if (list.align.@width.length() != 0) {
          target.width = _width * Number(list.align.@width) / 100;
        }
        target.x = _width * Number(list.align.@x) / 100;
      }
      target.x -= (target.width >> 1);
    }
    
    private function setY(list:XML, cont:Sprite):void {
      var target:DisplayObject = cont.getChildByName(list.localName());
      if (list.align.@height.length() != 0) {
        target.height = _height * Number(list.align.@height) / 100;
      }
      if (list.align.@target.length() != 0) {
        target.y = cont.getChildByName(list.align.@target).y + cont.getChildByName(list.align.@target).height * Number(list.align.@y) / 100;
      } else {
        target.y = _height * Number(list.align.@y) / 100;
      }
      target.y -= (target.height >> 1);
      target.y += target.pivotY;
    }
    
    private function setGrid(list:XML, cont:Sprite):void {
      var count:int = int(list.@count);
      var gap:int = int(list.@gap);
      var pref:String = list.@pref;
      var prefAlign:String = list.@align;
      var back:DisplayObject;
      var item:DisplayObject;
      for (var i:int = 0; i < count; i++) {
        for (var j:int = 0; j < count; j++) {
          back = cont.getChildByName(pref + i + "_" + j);
          back.x = (back.width + gap) * j;
          back.y = (back.height + gap) * i;
          item = cont.getChildByName(prefAlign + i + "_" + j);
          item.x = back.x + (back.width >> 1);
          item.y = back.y + (back.height >> 1);
        }
      }
      var shiftX:int = (_width - cont.width) >> 1; 
      var shiftY:int = (_height - cont.height) >> 1;
      var index:int = cont.numChildren - 1;
      var cell:DisplayObject;
      while (index >= 0) {
        cell = cont.getChildAt(index);
        cell.x += shiftX;
        cell.y += shiftY;
        index--;
      }
    }
  }
}