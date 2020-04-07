package createjs.plugin;

import createjs.tween.Tween;
import createjs.tween.TweenStep;

/**
 * A TweenJS plugin for working with motion guides. Defined paths which objects can follow or orient along.
 * To use the plugin, install the plugin after TweenJS has loaded. To define a path, add
 * <code>
 * createjs.MotionGuidePlugin.install();
 * </code>
 * 
 * Example
 * <code>
 * // Using a Motion Guide
 * Tween.get(target).to({guide:{ path:[0,0, 0,200,200,200, 200,0,0,0] }},7000);
 * // Visualizing the line
 * graphics.moveTo(0,0).curveTo(0,200,200,200).curveTo(200,0,0,0);
 * </code>
 * 
 * Each path needs pre-computation to ensure there's fast performance. Because of the pre-computation there's no
 * built in support for path changes mid tween. These are the Guide Object's properties:
 *   1. path: Required, Array : The x/y points used to draw the path with a moveTo and 1 to n curveTo calls.
 *   2. start: Optional, 0-1 : Initial position, default 0 except for when continuing along the same path.
 *   3. end: Optional, 0-1 : Final position, default 1 if not specified.
 *   4. orient: Optional, string : "fixed"/"auto"/"cw"/"ccw"
 *        * "fixed" forces the object to face down the path all movement (relative to start rotation),
 *        * "auto" rotates the object along the path relative to the line.
 *        * "cw"/"ccw" force clockwise or counter clockwise rotations including Adobe Flash/Animate-like behaviour.
 * 			This may override your end rotation value.
 * 
 * Guide objects should not be shared between tweens even if all properties are identical, the library stores
 * information on these objects in the background and sharing them can cause unexpected behaviour.
 * Values outside 0-1 range of tweens will be a "best guess" from the appropriate part of the defined curve.
 * 
 * Documentation: https://www.createjs.com/docs/tweenjs/classes/MotionGuidePlugin.html
 * @author VolkovRA
 */
@:native("createjs.MotionGuidePlugin")
extern class MotionGuidePlugin 
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

/**
 * The guide path for motion.
 */
typedef Guide =
{
	/**
	 * Required, Array: The x/y points used to draw the path with a moveTo and 1 to n curveTo calls.
	 * <code>path:[0,0, 0,200,200,200, 200,0,0,0]</code>
	 */
	var path:Array<Float>;
	
	/**
	 * Initial position, default 0 except for when continuing along the same path.
	 */
	@:optional var start:Float;
	
	/**
	 * Final position, default 1 if not specified.
	 */
	@:optional var end:Float;
	
	/**
	 * Face orient of motion object.
	 */
	@:optional var orient:Orient;
}

/**
 * Face orient of motion object.
 */
@:enum abstract Orient(String) to String
{
	/**
	 * Forces the object to face down the path all movement (relative to start rotation).
	 */
	var FIXED = "fixed";
	
	/**
	 * Rotates the object along the path relative to the line.
	 */
	var AUTO = "auto";
	
	/**
	 * force clockwise rotations including Adobe Flash/Animate-like behaviour.
	 * This may override your end rotation value.
	 */
	var CW = "cw";
	
	/**
	 * force counter clockwise rotations including Adobe Flash/Animate-like behaviour.
	 * This may override your end rotation value.
	 */
	var CCW = "ccw";
}