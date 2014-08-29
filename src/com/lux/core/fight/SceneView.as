package com.lux.core.fight
{
	import com.lux.Config;
	import com.lux.core.avatar.Avatar;
	import com.lux.core.avatar.AvatarVO;
	import com.lux.core.configModel.AvatarConfigModel;
	
	import lzm.starling.swf.SwfAssetManager;
	import lzm.starling.swf.display.SwfMovieClip;
	
	import starling.display.Sprite;
	
	/**
	 * @author det101
	 * @E-mail: lindaluo83@126.com
	 * 创建时间：2014-7-21 下午8:01:16
	 * 
	 */
	public class SceneView extends Sprite
	{
		private var _senceData:SceneData;
		
		
		private var _asset:SwfAssetManager;
		
		private var _sceneMouseModel:SceneMouseModel;		//鼠标和触摸事件
		private var _selfAvatar:Avatar;
		public function SceneView(sceneData:SceneData)
		{
			super();
			_senceData = sceneData;
			_asset = new SwfAssetManager();
			loadRes();
		}
		
		public function get selfAvatar():Avatar
		{
			return _selfAvatar;
		}

		/**
		 * 加载资源 
		 * 
		 */		
		private function loadRes():void
		{
			_asset.enqueue("MainUI1",[Config.root+"/ui/mainUI/MainUI1"+Config.resType,
				Config.root+"/ui/mainUI/MainUI1"+Config.dataType,
				Config.root+"/ui/mainUI/MainUI1"+Config.uiLayout,
				Config.root+"/ui/mainUI/big_images/img_room001"+Config.resType],30);
			_asset.loadQueue(onProgress);
		}
		
		private function onProgress(r:Number):void
		{
			if(r==1)
			{
				initRole();
				initScence();
			}
		}
		
		/**
		 * 初始化场景信息 
		 * 
		 */		
		private function initScence():void
		{
			_sceneMouseModel = new SceneMouseModel(this);
		}
		
		/**
		 * 初始化所有角色 
		 * 
		 */		
		private function initRole():void
		{
			
			var spr:Sprite = _asset.createSprite("spr_mainUI");
			addChild(spr);
			
			var avatarVO:AvatarVO = AvatarConfigModel.getInstance().getAvatarVOByTableId(10001);
			_selfAvatar = new Avatar(avatarVO,_asset);
			_selfAvatar.x = 200;
			_selfAvatar.y = 150
			addChild(_selfAvatar);
		}
	}
}