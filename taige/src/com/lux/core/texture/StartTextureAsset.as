package com.lux.core.texture
{
	import com.lux.core.utils.CoreAsset;
	
	/**
	 * @author det101
	 * @E-mail: lindaluo83@126.com
	 * 创建时间：2014-7-21 下午6:12:29
	 * 启动需要的素材
	 */
	public class StartTextureAsset
	{
		private var _asset:CoreAsset;
		public function StartTextureAsset()
		{
			_asset = new CoreAsset();
		}
		
		
		public function get asset():CoreAsset
		{
			return _asset;
		}

		private static var _instance:StartTextureAsset;
		public static function getInstance():StartTextureAsset
		{
			return _instance ||= new StartTextureAsset();
		}
	}
}