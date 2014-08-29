package com.lux.core.ui.loading
{
	import com.lux.core.utils.Debug;
	
	import starling.display.Sprite;
	
	/**
	 * @author det101
	 * @E-mail: lindaluo83@126.com
	 * 创建时间：2014-7-21 下午6:26:14
	 * 
	 */
	public class LoadingView extends Sprite
	{
		public function LoadingView()
		{
			super();
		}
		
		public function setProgress(r:Number):void
		{
			Debug.log("加载进度",r);
		}
	}
}