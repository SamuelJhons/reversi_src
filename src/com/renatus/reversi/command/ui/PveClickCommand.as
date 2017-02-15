package com.renatus.reversi.command.ui {
  
  import com.renatus.reversi.command.level.LevelList;
  import com.renatus.reversi.command.level.ModeID;
  import com.renatus.reversi.event.StartMenuEvent;
  import org.puremvc.as3.interfaces.INotification;
  import org.puremvc.as3.patterns.command.SimpleCommand;
  
  /**
   * ...
   */
  public class PveClickCommand extends SimpleCommand {
    
    override public function execute(notification:INotification):void {
      sendNotification(StartMenuEvent.HIDE);
      sendNotification(LevelList.PREP_LEVEL, ModeID.PVE);
    }
  }
}