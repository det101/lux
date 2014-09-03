package com.lux.core.command
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * @author det101
	 * @E-mail: lindaluo83@126.com
	 * 创建时间：2014-7-21 下午4:23:24
	 * 
	 */
	public class NetPlayerCommand extends SimpleCommand
	{
		public function NetPlayerCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			switch(notification.getName())
			{
					
				default:
				{
					break;
				}
			}
		}
	}
}