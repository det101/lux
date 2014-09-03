package com.lux.core.avatar
{
	/**
	 * @author det101
	 * @E-mail: lindaluo83@126.com
	 * 创建时间：2014-8-26 下午3:08:42
	 * 
	 */
	public class AvatarVO
	{
		public var baseVO:AvatarBaseVO;		//基础表数值
		public function AvatarVO()
		{
			
		}
		
		public function readXML(xml:XML):void
		{
			baseVO = new AvatarBaseVO();
			baseVO.readXML(xml);
		}
		
		/**
		 * 克隆数据 
		 * @return 
		 * 
		 */		
		public function clone():AvatarVO
		{
			var avatarVo:AvatarVO = new AvatarVO();
			avatarVo.baseVO = baseVO.clone();
			
			return avatarVo;
		}
	}
}