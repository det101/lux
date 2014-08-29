package com.lux.core.avatar
{
	/**
	 * @author det101
	 * @E-mail: lindaluo83@126.com
	 * 创建时间：2014-8-26 下午3:09:30
	 * 
	 */
	public class AvatarBaseVO
	{
		public var speed:int=0;		//速度
		public var name:String="";	//名字
		public var tableId:int = 0;	//表id
		public var body:String = "";	//资源名字
		
		private static const ATTR_ARRAY:Array = ["speed","name","tableId","body"];
		public function AvatarBaseVO()
		{
		}
		
		public function readXML(xml:XML):void
		{
			speed = xml.@speed;
			name = xml.@name;
			tableId = xml.@tableId;
			body = xml.@body;
		}
		
		/**
		 * 克隆数据 
		 * @return 
		 * 
		 */		
		public function clone():AvatarBaseVO
		{
			var baseVO:AvatarBaseVO = new AvatarBaseVO();
			
			for(var i:int=ATTR_ARRAY.length-1;i>=0;i--)
			{
				baseVO[ATTR_ARRAY[i]] = this[ATTR_ARRAY];
			}
			
			return baseVO;
		}
	}
}