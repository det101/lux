package com.lux.core.configModel
{
	import com.lux.core.avatar.AvatarVO;

	/**
	 * @author det101
	 * @E-mail: lindaluo83@126.com
	 * 创建时间：2014-8-28 下午4:48:49
	 * 
	 */
	public class AvatarConfigModel
	{
		private var _avatars:Vector.<AvatarVO>;
		public function AvatarConfigModel()
		{
		}
		
		public function readXml(xml:XML):void
		{
			_avatars = new Vector.<AvatarVO>();
			
			for each(var item:XML in xml.item)
			{
				var avatarVO:AvatarVO = new AvatarVO();
				avatarVO.readXML(item);
				_avatars.push(avatarVO);
			}
		}
		
		/**
		 * 过id查询数据 
		 * @param tableId
		 * @return 
		 * 
		 */		
		public function getAvatarVOByTableId(tableId:int):AvatarVO
		{
			for(var i:int=_avatars.length-1;i>=0;i--)
			{
				if(_avatars[i].baseVO.tableId==tableId)
					return _avatars[i];
			}
			
			return null;
		}
		
		private static var _instance:AvatarConfigModel;
		public static function getInstance():AvatarConfigModel
		{
			return _instance ||= new AvatarConfigModel();
		}
	}
}