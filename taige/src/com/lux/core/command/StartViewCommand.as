package com.lux.core.command
{
	import com.lux.core.ui.loading.LoadingCommand;
	import com.lux.core.ui.mainUI.MainUICommand;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * @author det101
	 * @E-mail: lindaluo83@126.com
	 * 创建时间：2014-7-21 下午4:28:55
	 * 
	 */
	public class StartViewCommand extends SimpleCommand
	{
		public function StartViewCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			facade.registerCommand(MainUICommand.INIT_MAINUI,MainUICommand);
			facade.registerCommand(LoadingCommand.INIT_LOADING,LoadingCommand);
			
			registerArray(FightSceneViewCommand.COMMAND_ARRAY,FightSceneViewCommand);
				
				
			facade.sendNotification(MainUICommand.INIT_MAINUI);
		}
		
		private function registerArray(arr:Array,cls:Class):void
		{
			for(var i:int=arr.length-1;i>=0;i--)
			{
				facade.registerCommand(arr[i],cls);
			}
		}
	}
}