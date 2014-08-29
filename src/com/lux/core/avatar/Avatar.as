package com.lux.core.avatar
{
	import lzm.starling.swf.SwfAssetManager;
	import lzm.starling.swf.display.SwfMovieClip;
	
	import starling.display.Sprite;
	
	/**
	 * @author det101
	 * @E-mail: lindaluo83@126.com
	 * 创建时间：2014-7-23 上午10:09:20
	 * 角色基类
	 */
	public class Avatar extends Sprite
	{
		private var _body:SwfMovieClip;
		
		private static const MOVE:String = "move";
		private static const ATTACT:String = "attact";
		private static const DEAD:String = "dead";
		private static const INJURED:String = "injured";
		private static const STANDE:String = "stand";
		
		private var _speed:int = 3;		//移动速度
		private var _targetX:int;
		private var _targetY:int;
		private var _path:Array;

		private var _angle:Number;
		public function Avatar(avatarVO:AvatarVO,asset:SwfAssetManager)
		{
			super();
			_body = asset.createMovieClip(avatarVO.baseVO.body);
			addChild(_body);
			_body.play();
			_body.completeFunction = playComplete;
		}
		
		
		public function update():void
		{
			
		}
		
		private function next():void
		{
			var arr:Array = _path.shift();
			_targetX = arr[0];
			_targetY = arr[1];
			_angle = Math.atan2(_targetY-this.y,_targetY-this.x);
			this.x += _speed*Math.cos(_angle);
			this.y += _speed*Math.sin(_angle);
		}
		
		private function playComplete(mc:SwfMovieClip):void
		{
//			if(mc.currentLabel!=MOVE)
		}
		
		public function moveTo(x:int,y:int):void
		{
			_targetX = x;
			_targetY = y;
			_path = new Array();
			_body.gotoAndPlay(MOVE);
		}
		
		public function stand():void
		{
			_body.gotoAndPlay(STANDE);
		}
		
		public function dead():void
		{
			_body.gotoAndPlay(DEAD);
		}
		
		public function attact():void
		{
			_body.gotoAndPlay(ATTACT);
		}
		
		/**
		 * 受伤 
		 * 
		 */		
		public function injured():void
		{
			_body.gotoAndPlay(INJURED);
		}
		
		public function releaseKkill(skillId:int):void
		{
			
		}
	}
}