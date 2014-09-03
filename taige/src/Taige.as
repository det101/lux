package
{
	import com.lux.core.Game;
	import com.lux.proConfig.ContainerConfig;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.system.Capabilities;
	
	import starling.core.Starling;
	import starling.events.Event;
	
	[SWF(frameRate="30",width="1024",height="768")]
	public class Taige extends Sprite
	{
		private var _starling:Starling;
		public function Taige()
		{
			super();
			
			// 支持 autoOrient
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			addEventListener(flash.events.Event.ADDED_TO_STAGE,initStage);
		}
		
		protected function initStage(event:flash.events.Event):void
		{
			removeEventListener(flash.events.Event.ADDED_TO_STAGE,initStage);
			var iOS:Boolean=Capabilities.manufacturer.indexOf("iOS") != -1;
			
			Starling.handleLostContext=!iOS; // not necessary on iOS. Saves a lot of memory!
			
			var gameWidth:int;
			var gameHeight:int;
			
			if (Capabilities.os.indexOf("Windows") != -1)
			{
				gameWidth=this.stage.stageWidth;
				gameHeight=this.stage.stageHeight;
			}
			else
			{
				gameWidth=this.stage.fullScreenWidth;
				gameHeight=this.stage.fullScreenHeight;
			}
			
			
			
			var orignalWidth:int=ContainerConfig.WIDTH;
			var orignalHeight:int=ContainerConfig.HEIGHT;
			
			var rate:Number = orignalHeight/gameHeight;
			
			var orignalRate:Number=orignalHeight / orignalWidth;
			var diveceRate:Number=gameHeight / gameWidth;
			var screenRect:Rectangle;
			screenRect = new Rectangle(0,0,gameWidth, gameHeight);
			
			/////////////////////////addaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddadd///////////////////
			_starling=new Starling(Game, stage, screenRect, null, "auto", "auto");
			_starling.addEventListener(starling.events.Event.ROOT_CREATED, run);
			//			_starling.antiAliasing=16;
			_starling.simulateMultitouch = false;
			_starling.stage.stageWidth=orignalHeight/diveceRate;;
			_starling.stage.stageHeight=orignalHeight
			_starling.showStats = true;
		}
		
		private function run(e:starling.events.Event):void
		{
			_starling.removeEventListener(starling.events.Event.ROOT_CREATED, run);
			_starling.start();
		}
	}
}