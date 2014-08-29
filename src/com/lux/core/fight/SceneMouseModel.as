package com.lux.core.fight
{
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	/**
	 * @author det101
	 * @E-mail: lindaluo83@126.com
	 * 创建时间：2014-8-26 下午2:08:55
	 * 
	 */
	public class SceneMouseModel
	{
		private var _spr:Sprite;
		public function SceneMouseModel(sp:Sprite)
		{
			_spr = sp;
		}
		
		/**
		 * 添加事件 
		 * 
		 */		
		public function addEvent():void
		{
			_spr.addEventListener(TouchEvent.TOUCH,onTouch);
		}
		
		/**
		 * 取消事件 
		 * 
		 */		
		public function removeEvent():void
		{
			_spr.removeEventListener(TouchEvent.TOUCH,onTouch);
		}
		
		/**
		 * touch事件的处理 
		 * @param e
		 * 
		 */		
		private function onTouch(e:TouchEvent):void
		{
			var touch:Touch = e.getTouch(_spr);
			if(touch)
			{
				switch(touch.phase)
				{
					case TouchPhase.BEGAN:
						mouseDown(touch);
						break;
					
					case TouchPhase.ENDED:
						mouseUp(touch);
						break;
					
					case TouchPhase.MOVED:
						mouseMove(touch);
						break;
						
				}
			}
		}
		
		private function mouseMove(touch:Touch):void
		{
			// TODO Auto Generated method stub
			
		}
		
		private function mouseUp(touch:Touch):void
		{
			// TODO Auto Generated method stub
			
		}
		
		private function mouseDown(touch:Touch):void
		{
			// TODO Auto Generated method stub
			
		}
		
	}
}