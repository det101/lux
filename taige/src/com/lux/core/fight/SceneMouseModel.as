package com.lux.core.fight
{
	import com.lux.core.avatar.Avatar;
	
	import flash.geom.Point;
	
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
		private var _spr:SceneView;
		private var _currentAvatar:Avatar;
		private var _currentPoint:Point;
		public function SceneMouseModel(sp:SceneView)
		{
			_spr = sp;
			addEvent();
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
			trace("移动");
			var point:Point;
			if(_currentAvatar)
			{
				point = touch.getLocation(_spr);
				_currentAvatar.x = point.x;
				_currentAvatar.y = point.y;
			}
		}
		
		private function mouseUp(touch:Touch):void
		{
			trace("放开");
			if(_currentAvatar==null)		//如果没有选中对象
			{
				var point:Point = touch.getLocation(_spr);
				_spr.selfAvatar.moveTo(touch.globalX,touch.globalY);
			}
		}
		
		private function mouseDown(touch:Touch):void
		{
			var p:Point = touch.getLocation(_spr);
			_currentAvatar = _spr.getAvatarByPoint(p);
			_currentPoint = new Point(_currentAvatar.x,_currentAvatar.y);
			trace("按下",_currentAvatar);
		}
		
		/**
		 * 只能在圆圈内移动 
		 * 
		 */		
		private function moveCircle():void
		{
			if(_currentAvatar.x)
			{
				
			}
		}
		
	}
}