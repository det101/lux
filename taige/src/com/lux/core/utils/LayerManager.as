package com.lux.core.utils
{
	
	import flash.display.Stage;
	import flash.utils.Dictionary;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.display.Sprite;
	import starling.display.Stage;
	
	
	/**
	 * LayerManager
	 * @author 陆小龙 luxiaolong.lux@snda.com
	 * $Id:$
	 * @version 1.0
	 */
	public class LayerManager
	{
		
		private var _diction:Dictionary = null;
		
		private var _layerArr:Array = null;
		

		public static const LAYER_BUILD_SCENE:String = "LayerManager.LAYER_BUILD_SCENE"; 	//建造界面的层
		public static const LAYER_BUILD_UI:String = "LayerManager.LAYER_BUILD_UI";  		//建造界面的层
		
		public static const LAYER_FIGHTSCENE:String = "LayerManager.LAYER_FIGHTSCENE";		//战斗场景

		
		
		public static var stage:starling.display.Stage;
		
		public static var stage2D:flash.display.Stage;
		
		public static var sokectError:Boolean;									//已经断开
		
		public static var OFFX:int;
		public static var OFFY:int;

		public function LayerManager(single:Single)
		{
			
		}
		
		
		public function get stageSp():Sprite
		{
			return _stageSp;
		}
		
		public function distroy():void
		{
			if(_stageSp)
			{
				_stageSp.removeChildren(0,-1,true);
				_stageSp = null;
			}
		}
		
		/**
		 * 移除所有对象 
		 * 
		 */		
		public function removeAll():void{
			
			for(var i:int=0;i<_layerArr.length;i++)
			{
				var sp:Sprite = _diction["layer_"+_layerArr[i]];
				sp.removeChildren();
			}
		}
		
		/**
		 * 初始化层级 
		 * @param $stage		stage	
		 * @param spArr			层级的名字,格式["a","b"];
		 * 
		 */			
		public function initLayer($stage:starling.display.Stage):void
		{
			stage = $stage
				
			_stageSp = new Sprite();
			//添加旭东寻路层

			_layerArr = [LAYER_BUILD_SCENE,LAYER_FIGHTSCENE];
			
			_diction = new Dictionary();
			
			for(var i:int=0;i<_layerArr.length;i++)
			{
				var sp:Sprite = new Sprite();
				_diction["layer_"+_layerArr[i]] = sp;
				_stageSp.addChild(_diction["layer_"+_layerArr[i]]);
			}
			
			$stage.addChild(_stageSp);
		}
		
		/**
		 * 添加到对应的层级 
		 * @param display
		 * @param container
		 * 
		 */		
		public function addToLayer(display:DisplayObject,container:String,$x:Number=0,$y:Number=0,isAnimation:Boolean=false):void
		{
			_diction["layer_"+container].addChild(display);
			display.x = $x;
			display.y = $y;
		}
		
		public function addToCenter(display:DisplayObject,displayContainer:DisplayObjectContainer,isAnimation:Boolean=true):void
		{
			setCenter(display,displayContainer);
			if(isAnimation)
			{
//				animation(display);
			}
		}
		
		/**
		 * 通过名字获得层级容器 
		 * @param container
		 * @return 
		 * 
		 */		
		public function getLayerByName(container:String):Sprite
		{
			return _diction["layer_"+container];
		}
		
		
		
		/**
		 * 弹窗缓动动画 
		 * @param mc
		 * @param $point
		 * @return 
		 * 
		 */		
		public function animation(window:DisplayObject,$pointX:Number=0,$pointY:Number=0):void
		{
			
			var _x:Number = window.x;
			var _y:Number = window.y;
			
			var windowWidth:Number = window.width;
			var windowHeight:Number = window.height;
			
			window.x = window.x + windowWidth * 0.1;
			window.y = window.y + windowHeight * 0.1;
			
			window.scaleX = 0.8;
			window.scaleY =  0.8;
			
			window.alpha = 0.3;
			
			
			window.x = _x;
			window.y = _y;
//			TweenMax.to(window, 2, 
//				{transformAroundCenter:{x:_x,y:_y,scaleX:1, scaleY:1}, ease:Elastic.easeOut});
			
//			Tweener.addTween(window, { x:_x, y:_y, scaleX:1, scaleY:1, time:0.1,transition:"easeInSine"});
//			Tweener.addTween(window, { alpha:1, transition:"linear", time:0.3 } );
		}
		
		
		/**
		 * 添加父容器  并且居中显示 
		 * @param display
		 * @param displayContainer
		 * 
		 */		
		public function setCenter(display:DisplayObject,displayContainer:DisplayObjectContainer):void
		{
			//注册点在左上角的居中
			var numX:Number = (displayContainer.stage.stageWidth-display.width)/2;			
			var numY:Number = (displayContainer.stage.stageHeight-display.height)/2;
			
			//先取容器的的宽高,添加到容器 取相对于容器的getBounds
			displayContainer.addChild(display);		
			
			
			//算出注册点偏移值
			var amendNumX:Number =display.x - display.getBounds(displayContainer).x;		
			var amendNumY:Number =display.y - display.getBounds(displayContainer).y;
			
			//实际值
			display.x = numX+amendNumX;
			display.y = numY+amendNumY;
			
		}
		
		
		private static var _instance:LayerManager = null;
		private var _stageSp:Sprite;
		public static function get Instance():LayerManager
		{
			if(_instance==null)
			{
				_instance = new LayerManager(new Single);
			}
			
			return _instance;
		}
	}
}

class Single
{
	
}
