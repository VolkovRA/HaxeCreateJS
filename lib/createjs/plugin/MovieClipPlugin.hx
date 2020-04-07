package createjs.plugin;

import createjs.tween.Tween;
import createjs.tween.TweenStep;

/**
 * This plugin works with TweenJS to prevent the `startPosition` property from tweening.
 * MovieClipPlugin cannot be instantiated.
 * 
 * Documentation: https://www.createjs.com/docs/easeljs/classes/MovieClipPlugin.html
 * @author VolkovRA
 */
@:native("createjs.MovieClipPlugin")
extern class MovieClipPlugin 
{
	/**
	 * Default: "MovieClip"
	 */
	static public var ID(default, null):String;
	
	/**
	 * Very high priority, should run first.
	 * Default: 100
	 */
	static public var priority(default, null):Int;
	
	/**
	 * No description.
	 * @param	tween	
	 * @param	step	
	 * @param	value	
	 * @param	ratio	
	 * @param	end		
	 */
	static public function change(tween:Tween, step:TweenStep, value:Any, ratio:Float, end:Dynamic):Void;
	
	/**
	 * No description.
	 * @param	tween	
	 * @param	prop	
	 * @param	value	
	 */
	static public function init(tween:Tween, prop:String, value:Any):Void;
	
	/**
	 * Install this plugin to TweenJS.
	 */
	static public function install():Void;
	
	/**
	 * No description.
	 * @param	tween	
	 * @param	step	
	 * @param	props	
	 */
	static public function step(tween:Tween, step:TweenStep, props:Dynamic):Void;
}	