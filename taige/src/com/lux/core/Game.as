package com.lux.core
{
	import com.lux.core.command.GameStartUpCommand;
	import com.lux.core.configModel.AvatarConfigModel;
	import com.lux.core.texture.StartTextureAsset;
	import com.lux.core.ui.loading.LoadingCommand;
	import com.lux.core.ui.loading.LoadingMediator;
	import com.lux.core.utils.LayerManager;
	
	import flash.filesystem.File;
	import flash.net.dns.AAAARecord;
	
	import feathers.themes.AeonDesktopTheme;
	
	import lzm.starling.swf.Swf;
	
	import org.puremvc.as3.patterns.facade.Facade;
	
	import starling.display.Sprite;
	import starling.events.Event;

	/**
	 *  
	 * @author det101
	 * 
	 */	
	public class Game extends Sprite
	{
		public function Game()
		{
			super();
			
			
			this.addEventListener(Event.ADDED_TO_STAGE,initStage);
		}
		
		/**
		 * 初始化样式 
		 * 
		 */		
		private function initView():void
		{
			new AeonDesktopTheme();
		}
		
		private function initStage(e:Event):void
		{
			Swf.init(this);
			LayerManager.Instance.initLayer(this.stage);
			initMVC();
			initTexture();
		}
		
		private function initTexture():void
		{
			Facade.getInstance().sendNotification(LoadingCommand.INIT_LOADING);
			var f:File = File.applicationDirectory.resolvePath("configXml");
			StartTextureAsset.getInstance().asset.enqueuesUnique(f);
			StartTextureAsset.getInstance().asset.loadQueue(onLoaderTextrueProgress);
		}
		
		/**
		 * 加载的进度 
		 * @param r
		 * 
		 */		
		private function onLoaderTextrueProgress(r:Number):void
		{
			Facade.getInstance().sendNotification(LoadingMediator.LOADING_PROGRESS,r);
			if(r==1)
			{
				initConfigXml();
				initView();
			}
		}
		
		private function initConfigXml():void
		{
			AvatarConfigModel.getInstance().readXml(StartTextureAsset.getInstance().asset.getXml("Role"));
		}
		
		/**
		 * 初始化mvc 
		 * 
		 */		
		private function initMVC():void
		{
			Facade.getInstance().registerCommand(GameStartUpCommand.START_UP,GameStartUpCommand);
			Facade.getInstance().sendNotification(GameStartUpCommand.START_UP);
		}
	}
}