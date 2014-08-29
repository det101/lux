package com.lux.core.ui.loading
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	/**
	 * @author det101
	 * @E-mail: lindaluo83@126.com
	 * 创建时间：2014-7-21 下午6:26:40
	 * 
	 */
	public class LoadingMediator extends Mediator
	{
		public static const NAME:String = "LoadingMediator";
		public static const LOADING_PROGRESS:String = "LoadingMediator.LOADING_PROGRESS";
		public function LoadingMediator(mediatorName:String=null, viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
		}
		
		public function get view():LoadingView
		{
			return viewComponent as LoadingView;
		}
		
		override public function handleNotification(notification:INotification):void
		{
			switch(notification.getName())
			{
				case LOADING_PROGRESS:		//进度条
				{
					view.setProgress(notification.getBody() as Number);
					break;
				}
					
				default:
				{
					break;
				}
			}
		}
		
		override public function listNotificationInterests():Array
		{
			return [LOADING_PROGRESS];
		}
	}
}