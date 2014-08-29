package com.lux.core.utils
{
	import flash.system.Capabilities;

	/**
	 * @author det101
	 * @E-mail: lindaluo83@126.com
	 * 创建时间：2014-7-21 下午4:26:47
	 * 
	 */
	public class Debug
	{
		public function Debug()
		{
		}
		
		public static function log(...arg):void
		{
			if(Capabilities.isDebugger)
			{
				trace(arg);
			}
		}
	}
}