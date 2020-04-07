package createjs.plugin;

import createjs.tween.Tween;
import createjs.tween.TweenStep;

/**
 * The RelativePlugin for TweenJS enables relative numeric values for tweens. Install using:
 * <code>
 * RelativePlugin.install();
 * </code>
 * 
 * Once installed, you can pass in relative numeric property values as strings beginning with "+" or "-".
 * For example, the following tween would tween the x position of foo from its initial value of 200 to 50 (200-150), then to 125 (50+75).
 * <code>
 * foo.x = 200;
 * Tween.get(foo).to({x:"-150"}, 500).to({x:"+75"}, 500);
 * </code>
 * 
 * Documentation: https://www.createjs.com/docs/tweenjs/classes/RelativePlugin.html
 * @author VolkovRA
 */
@:native("createjs.RelativePlugin")
extern class RelativePlugin 
{
	/**
	 * A unique identifying string for this plugin.
	 * Used by TweenJS to ensure duplicate plugins are not installed on a tween.
	 */
	static public var ID(default, null):String;
	
	/**
	 * Installs this plugin for use with TweenJS.
	 * Call this once after TweenJS is loaded to enable this plugin.
	 */
	static public function install():Void;
	
	/**
	 * Called by TweenJS when a new property initializes on a tween.
	 * @param	tween	The related tween instance.
	 * @param	prop	The name of the property that is being initialized.
	 * @param	value	If another plugin has modified the starting value, it will be passed in. Otherwise value will be undefined.
	 * @return	The modified starting tween value for the property. In most cases, you would simply wouldn't return anything, but some
	 * 			plugins may need to modify the starting value. You can also return Tween.IGNORE to prevent this prop from being added
	 * 			to the tween at all.
	 */
	static public function init(tween:Tween, prop:String, value:Any):Any;
	
	/**
	 * Called when a new step is added to a tween (ie. a new "to" action is added to a tween).
	 * @param	tween	The related tween instance.
	 * @param	step	The related tween step. This class is currently undocumented. See the bottom of Tween.js for info.
	 * @param	props	The props object that was passed to to().
	 */
	static public function step(tween:Tween, step:TweenStep, props:Dynamic):Void;
	
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
}