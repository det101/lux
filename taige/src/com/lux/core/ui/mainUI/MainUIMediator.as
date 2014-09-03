package com.lux.core.ui.mainUI
{
	import com.lux.core.command.FightSceneViewCommand;
	
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	/**
	 * @author det101
	 * @E-mail: lindaluo83@126.com
	 * 创建时间：2014-7-21 下午4:18:30
	 * 
	 */
	public class MainUIMediator extends Mediator
	{
		public static const NAME:String = "MainUIMediator";
		public function MainUIMediator(mediatorName:String=null, viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
		}
		
		public function enterFightScene(data:Object):void
		{
			sendNotification(FightSceneViewCommand.INIT_FIGHT_SCENE);
		}
	}
}