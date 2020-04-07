package createjs.plugin;

import createjs.tween.Tween;
import createjs.tween.TweenStep;

/**
 * A sample TweenJS plugin.
 * This plugin is purely for demonstration, and contains documentation and helpful tips on building plugins.
 * 
 * It sets the y position of the target based on a sinusoidal function of its x position.
 * 
 * NOTE: The code for this class is heavily commented. Please look at it if you'd like to write a plugin.
 * 
 * A TweenJS plugin is simply an object that exposes two properties (id, priority), and three methods (init, step, and change).
 * Generally a plugin will also expose an install method as well, though this is not strictly necessary.
 * 
 * Documentation: https://www.createjs.com/docs/tweenjs/classes/SamplePlugin.html
 * @author VolkovRA
 */
@:native("createjs.SamplePlugin")
extern class SamplePlugin 
{
	/**
	 * A unique identifying string for this plugin.
	 * Used by TweenJS to ensure duplicate plugins are not installed on a tween.
	 */
	static public var ID(default, null):String;
	
	/**
	 * Used by TweenJS to determine when to call this plugin relative to others.
	 * Plugins with higher priority read first, and write last.
	 * 
	 * For example, if plugin A has priority=0, and plugin B has priority=9 then B's init and step methods
	 * would be called before A's, but B's change method would be called after A's.
	 * Default: 0
	 */
	static public var priority(default, null):Int;
	
	/**
	 * Called before a property is updated by the tween.
	 * @param	tween	The related tween instance.
	 * @param	step	The related tween step. This class is currently undocumented. See the bottom of Tween.js for info.
	 * @param	prop	The name of the property being tweened.
	 * @param	value	The current tweened value of the property, as calculated by TweenJS. Previous plugins may have modified this value.
	 * @param	ratio	A value indicating the eased progress through the current step. This number is generally between 0 and 1, though some eases will generate values outside this range.
	 * @param	end		Indicates that the tween has reached the end and is about to deregister itself.
	 * @return	Return the value that should be assigned to the target property.
	 */
	static public function change(tween:Tween, step:TweenStep, prop:String, value:Any, ratio:Float, end:Bool):Any;
	
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
	 * @return	The modified starting tween value for the property. In most cases, you would simply wouldn't return anything, but some
	 * 			plugins may need to modify the starting value. You can also return Tween.IGNORE to prevent this prop from being added
	 * 			to the tween at all.
	 */
	static public function init(tween:Tween, prop:String, value:Any):Any;
	
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