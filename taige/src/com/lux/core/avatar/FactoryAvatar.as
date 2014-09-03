package com.lux.core.avatar
{
	import lzm.starling.swf.SwfAssetManager;

	/**
	 * @author det101
	 * @E-mail: lindaluo83@126.com
	 * 创建时间：2014-8-26 下午3:24:21
	 * 
	 */
	public class FactoryAvatar
	{
		public function FactoryAvatar()
		{
		}
		
		public function create(avatarVO:AvatarVO,asset:SwfAssetManager):Avatar
		{
			return new Avatar(avatarVO,asset);
		}
		
		private static var _instance:FactoryAvatar;
		public static function getInstance():FactoryAvatar
		{
			return _instance ||= new FactoryAvatar();
		}
	}
}