package com.lux.core.fight{
	
public class SceneData
{  
	  public var res_name:int;
	  public var name:int;
	  public var scene_Id:int;
	  private static const Attr_Arr:Array = ["res_name","name","scene_Id",];
	  
	  public function SceneData()
	  {
		  
	  }  
	  
	  public function readXML(xml:XML):void
	  {
	      res_name=xml.@res_name;
	      name=xml.@name;
	      scene_Id=xml.@scene_Id;
	  }
	  
	}
}