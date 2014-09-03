package com.lux.core.ui.mainUI
{
	import com.lux.Config;
	import com.lux.core.utils.CoreAsset;
	import com.lux.core.utils.LayerManager;
	
	import feathers.controls.Label;
	
	import lzm.starling.swf.Swf;
	import lzm.starling.swf.SwfAssetManager;
	import lzm.starling.swf.display.SwfMovieClip;
	import lzm.starling.ui.layout.LayoutUitl;
	
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import starling.display.Sprite;
	import starling.events.TouchEvent;

	/**
	 * @author det101
	 * @E-mail: lindaluo83@126.com
	 * 创建时间：2014-7-21 下午4:17:12
	 * 
	 */
	public class MainUI extends Sprite
	{
		
		private var _asset:SwfAssetManager;
		private var _mediatorContair:Mediator;
		public function MainUI()
		{
			_asset = new SwfAssetManager();
			LayerManager.Instance.addToLayer(this,LayerManager.LAYER_BUILD_SCENE);
		}
		
		public function setContainer(container:Mediator):void
		{
			_mediatorContair = container;
		}
		
		public function setData():void
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
				var spr:Sprite = _asset.createSprite("spr_mainUI");
				addChild(spr);
				callBack("enterFightScene");
			}
		}
		
		private function initView():void
		{
			
		}
		
		private function callBack(funName:String,data:Object=null):void
		{
			if(_mediatorContair.hasOwnProperty(funName))
			{
				_mediatorContair[funName](data);
			}
		}
	}
}