package com.lux.core.command
{
	import com.lux.core.utils.Debug;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * @author det101
	 * @E-mail: lindaluo83@126.com
	 * 创建时间：2014-7-21 下午4:25:50
	 * 
	 */
	public class StartScoketCommand extends SimpleCommand
	{
		public function StartScoketCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			Debug.log("初始化网络模块");
		}
	}
}