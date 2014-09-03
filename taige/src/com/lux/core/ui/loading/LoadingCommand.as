package com.lux.core.ui.loading
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * @author det101
	 * @E-mail: lindaluo83@126.com
	 * 创建时间：2014-7-21 下午6:31:12
	 * 
	 */
	public class LoadingCommand extends SimpleCommand
	{
		public static const INIT_LOADING:String = "LoadingCommand.LOADING_INIT";
		public function LoadingCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			switch(notification.getName())
			{
				case INIT_LOADING:
				{
					initLoadingView();
					break;
				}
					
				default:
				{
					break;
				}
			}
		}
		
		/**
		 * 初始化loading 
		 * 
		 */		
		private function initLoadingView():void
		{
			var loadingView:LoadingView = new LoadingView();
			var loadingMediator:LoadingMediator = new LoadingMediator(LoadingMediator.NAME,loadingView);
			facade.registerMediator(loadingMediator);
			
		}
	}
}