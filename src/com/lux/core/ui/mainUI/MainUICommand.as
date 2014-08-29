package com.lux.core.ui.mainUI
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * @author det101
	 * @E-mail: lindaluo83@126.com
	 * 创建时间：2014-7-21 下午4:44:23
	 * 
	 */
	public class MainUICommand extends SimpleCommand
	{
		public static const INIT_MAINUI:String = "MainUICommand.INIT_MAINUI";
		public function MainUICommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			switch(notification.getName())
			{
				case INIT_MAINUI:
				{
					initMainUI();
					break;
				}
					
				
					
				default:
				{
					break;
				}
			}
		}
		
		/**
		 * 初始化主界面 
		 * 
		 */		
		private function initMainUI():void
		{
			var mainUI:MainUI = new MainUI();
			var mainUIMediator:MainUIMediator = new MainUIMediator(MainUIMediator.NAME,mainUI);
			mainUI.setContainer(mainUIMediator);
			mainUI.setData();
			facade.registerMediator(mainUIMediator);
		}
	}
}