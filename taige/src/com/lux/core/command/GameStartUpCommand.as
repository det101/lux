package com.lux.core.command
{
	import org.puremvc.as3.patterns.command.MacroCommand;
	
	/**
	 * @author det101
	 * @E-mail: lindaluo83@126.com
	 * 创建时间：2014-6-25 下午7:23:19
	 * 
	 */
	public class GameStartUpCommand extends MacroCommand
	{
		public static const START_UP:String = "GameStartUpCommand.START_UP";		//注册多command用
		public function GameStartUpCommand()
		{
			super();
		}
		
		override protected function initializeMacroCommand():void
		{
			trace("初始化mvc");
			addSubCommand(StartScoketCommand);
			addSubCommand(StartViewCommand);
		}
		
	}
}