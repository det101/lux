package com.lux.core.utils
{
	import flash.geom.Rectangle;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getTimer;
	
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.utils.AssetManager;
	
	
	/**
	 *
	 * GameAssetsManager.as
	 *
	 * 支持在加载中 同时 enqeue 新的资源并发出新的加载请求,使用队列的机制
	 *
	 * @author hanlu
	 * @date 2013-8-29
	 *
	 */
	public class CoreAsset extends AssetManager
	{
		public function CoreAsset(scaleFactor:Number=1, useMipmaps:Boolean=false)
		{
			super(scaleFactor, useMipmaps);
			verbose=true;
		}
		
		/**
		 *
		 * 禁止在逻辑层调用此方法
		 *
		 * @param parameters
		 *
		 */
//		override public function enqueue(... parameters):void
//		{
//			throw new Error("禁止在逻辑层调用此方法");
//		}
		
		public function enqueuesUnique(... parameters):void
		{
			for each (var u:Object in parameters)
			{
				if (getQualifiedClassName(u) == "flash.filesystem::File")
				{
					super.enqueue(u);
				}
				else
				{
					enqueueUnique(u as String);
				}
			}
		}
		
		override public function loadQueue(onProgress:Function):void
		{
			var fun:Function=function(r:Number):void
			{
				var isFinish:Boolean=(r == 1 || isNaN(r));
				if (isFinish)
				{
					//					mIsLoading=(_waitingTask.length > 0);
					oneLoadFinish();
				}
				if (onProgress != null)
					onProgress(r);
			}
			if (mIsLoading)
			{
				var t:LoadTexTask=getUnReadyTask();
				t.callBack=fun;
				t.isReady=true;
			}
			else
			{
				super.loadQueue(fun);
			}
		}
		
		protected function oneLoadFinish():void
		{
			if (_waitingTask.length > 0)
			{
				var next:LoadTexTask=_waitingTask.shift();
				if (next.urls.length > 0)
				{
					_uniqueUrls=_uniqueUrls.concat(next.urls);
					for each (var r:String in next.urls)
					{
						super.enqueue(r);
					}
					super.loadQueue(next.callBack);
				}
				else
				{
					next.callBack(1);
				}
			}
		}
		
		
		protected var _uniqueUrls:Vector.<String>=new Vector.<String>();
		//		private var _watingurls:Array=[];
		//		private var _watingcallbacks:Array=[];
		private var _waitingTask:Vector.<LoadTexTask>=new Vector.<LoadTexTask>();
		
		private function getUnReadyTask():LoadTexTask
		{
			if (_waitingTask.length == 0 || _waitingTask[_waitingTask.length - 1].isReady)
			{
				_waitingTask.push(new LoadTexTask());
			}
			return _waitingTask[_waitingTask.length - 1];
		}
		
		public function enqueueUnique(assetsUrl:String):void
		{
			if (_uniqueUrls.indexOf(assetsUrl) == -1 && !hasWaitingTask(assetsUrl))
			{
				if (mIsLoading)
				{
					getUnReadyTask().urls.push(assetsUrl);
				}
				else
				{
					_uniqueUrls.push(assetsUrl);
					super.enqueue(assetsUrl);
				}
			}
		}
		
		public function hasWaitingTask(url:String):Boolean
		{
			for each (var t:LoadTexTask in _waitingTask)
			{
				if (t.urls.indexOf(url) != -1)
				{
					return true;
				}
			}
			return false;
		}
		
		public function loadQueueComplete(fun:Function):void
		{
			var s:int=getTimer();
			loadQueue(function(r:Number):void
			{
				if (r == 1 || isNaN(r))
				{
					Debug.log(this, "本次加载消耗 共计： " + (getTimer() - s) / 1000);
					fun();
				}
			});
		}
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		public function getSubTextureFromAtlas(atlasname:String, subName:String):Texture
		{
			var at:TextureAtlas=this.getTextureAtlas(atlasname);
			return at.getTexture(subName);
		}
		
		public function getSubTexture(name:String, region:Rectangle=null, frame:Rectangle=null):Texture
		{
			var tex:Texture=getTexture(name);
			if (tex == null)
				return null;
			else
				return Texture.fromTexture(tex, region, frame);
		}
		
		public function getImage(texname:String):Image
		{
			var tex:Texture=this.getTexture(texname);
			return new Image(tex);
		}
		
		public function getMovieClip(taName:String, prefix:String=null, fps:int=12):MovieClip
		{
			if (prefix == null)
			{
				prefix=taName;
			}
			var textures:Vector.<Texture>=this.getTextureAtlas(taName).getTextures(prefix);
			var moviclip:MovieClip=new MovieClip(textures, fps);
			return moviclip;
		}
		
		override public function removeTexture(name:String, dispose:Boolean=true):void
		{
			searchAndDelete(name);
			super.removeTexture(name,dispose);
		}
		
		override public function removeTextureAtlas(name:String, dispose:Boolean=true):void
		{
			searchAndDelete(name);
		
			super.removeTextureAtlas(name,dispose);
		}
		
		override public function removeObject(name:String):void
		{
			searchAndDelete(name);
			super.removeObject(name);
		}
		
		override public function removeXml(name:String, dispose:Boolean=true):void
		{
			searchAndDelete(name);
			super.removeXml(name,dispose);
		}
		
		/**
		 * 删除不要的纹理集 
		 * @param content
		 * @return 
		 * 
		 */		
		private function searchAndDelete(content:String):int{
			for(var i:int=_uniqueUrls.length-1;i>=0;i--)
			{
				if(content==getName(_uniqueUrls[i]))
				{
					_uniqueUrls.splice(i,1);
				}
			}
			
			for(i=_waitingTask.length-1;i>=0;i--)
			{
				for(var j:int=_waitingTask[i].urls.length-1;j>=0;j--)
				{
					if(content==getName(_waitingTask[i].urls[j]))
					{
						_waitingTask[i].urls.splice(j,1);
					}
				}
			}
			return -1;
		}
		
		override protected function log(message:String):void
		{
			// TODO Auto Generated method stub
			Debug.log(this, message);
			if (verbose && message.indexOf("error") != -1)
			{
				//				Alert.show(message);
			}
		}
		
		
	}
}

class LoadTexTask
{
	public var urls:Vector.<String>=new Vector.<String>();
	public var callBack:Function;
	public var isReady:Boolean;
}
