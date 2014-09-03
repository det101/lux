package com.lux.core.command
{
	import com.lux.core.fight.SceneData;
	import com.lux.core.fight.SceneMediator;
	import com.lux.core.fight.SceneView;
	import com.lux.core.ui.loading.LoadingMediator;
	import com.lux.core.ui.loading.LoadingView;
	import com.lux.core.utils.LayerManager;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	/**
	 * @author det101
	 * @E-mail: lindaluo83@126.com
	 * 创建时间：2014-8-28 下午3:54:57
	 * 战斗场景的管理类
	 */
	public class FightSceneViewCommand extends SimpleCommand
	{
		public static const INIT_FIGHT_SCENE:String = "FightSceneViewCommand.INIT_FIGHT_SCENE";		//初始化战斗场景
		
		public static const COMMAND_ARRAY:Array = [INIT_FIGHT_SCENE];
		public function FightSceneViewCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			switch(notification.getName())
			{
				case INIT_FIGHT_SCENE:
				{
					initFightScene(notification);
					break;
				}
					
				default:
				{
					break;
				}
			}
		}
		
		/**
		 * 初始化战斗场景 
		 * @param notification
		 * 
		 */		
		private function initFightScene(notification:INotification):void
		{
			var sceneDta:SceneData = notification.getBody() as SceneData;
			var scene:SceneView = new SceneView(sceneDta);
			var sceneMediator:SceneMediator = new SceneMediator(SceneMediator.NAME,scene);
			LayerManager.Instance.addToLayer(scene,LayerManager.LAYER_FIGHTSCENE);
		}
	}
}