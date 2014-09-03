package com.lux.core.fight
{
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	/**
	 * @author det101
	 * @E-mail: lindaluo83@126.com
	 * 创建时间：2014-8-28 下午4:04:46
	 * 
	 */
	public class SceneMediator extends Mediator
	{
		public static const NAME:String = "SceneMediator";
		public function SceneMediator(mediatorName:String=null, viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
		}
	}
}