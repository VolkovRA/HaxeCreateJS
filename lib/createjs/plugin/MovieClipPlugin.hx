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
	 * A unique identifying string for this plugin.
	 * Used by TweenJS to ensure duplicate plugins are not installed on a tween.
	 * Default: "MovieClip"
	 */
	static public var ID(default, null):String;
	
	/**
	 * Very high priority, should run first.
	 * Default: 100
	 */
	static public var priority(default, null):Int;
	
	/**
	 * Called before a property is updated by the tween.
	 * @param	tween	The related tween instance.
	 * @param	step	The related tween step. This class is currently undocumented. See the bottom of Tween.js for info.
	 * @param	value	The current tweened value of the property, as calculated by TweenJS. Previous plugins may have modified this value.
	 * @param	ratio	A value indicating the eased progress through the current step. This number is generally between 0 and 1, though some eases will generate values outside this range.
	 * @param	end		Indicates that the tween has reached the end and is about to deregister itself.
	 */
	static public function change(tween:Tween, step:TweenStep, value:Any, ratio:Float, end:Dynamic):Void;
	
	/**
	 * Called by TweenJS when a new property initializes on a tween.
	 * Generally, the call to Plugin.init will be immediately followed by a call to Plugin.step.
	 * For example:
	 * <code>
	 * foo.x = 0;
	 * foo.y = 100;
	 * Tween.get(foo)
	 *     .to({x:10}) // init called with prop = "x", value = 0
	 *     .to({x:20}) // init is NOT called, since x was already inited
	 *     .to({y:200}) // init called with prop = "y", value = 100
	 * </code>
	 * @param	tween	The related tween instance.
	 * @param	prop	The name of the property that is being initialized.
	 * @param	value	If another plugin has modified the starting value, it will be passed in. Otherwise value will be undefined.
	 */
	static public function init(tween:Tween, prop:String, value:Any):Void;
	
	/**
	 * Installs this plugin for use with TweenJS.
	 * Call this once after TweenJS is loaded to enable this plugin.
	 */
	static public function install():Void;
	
	/**
	 * Called when a new step is added to a tween (ie. a new "to" action is added to a tween).
	 * For example: Tween.get(foo) .to({x:10}) // step called .wait(100) // step is NOT called .to({x:20, y:200}) // step called
	 * @param	tween	The related tween instance.
	 * @param	step	The related tween step. This class is currently undocumented. See the bottom of Tween.js for info.
	 * @param	props	The props object that was passed to to().
	 */
	static public function step(tween:Tween, step:TweenStep, props:Dynamic):Void;
}	