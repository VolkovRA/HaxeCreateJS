package createjs.plugin;

import createjs.tween.Tween;
import createjs.tween.TweenStep;

/**
 * The RotationPlugin for TweenJS modifies tweens of rotation properties.
 * These properties can be changed when calling install. Install using:
 * <code>RotationPlugin.install(props);</code>
 * 
 * After installation, by default all rotation tweens will rotate in the shortest direction.
 * For example, if you tween from rotation=15 to rotation=330, it will rotate counter-clockwise 45 degrees.
 * You can modify this behaviour by specifying a rotationDir tween value. A value of -1 will force CCW rotation, 1 will
 * force CW, and 0 will disable the plugin effects for that portion of the tween.
 * 
 * Note that the rotationDir value will persist until overridden in future to calls.
 * Set it to null to re-enable the default behavior.
 * <code>
 * // this tween will rotate: CCW, then CCW (because rotationDir persists), then CW.
 * myTween.get(foo).to({rotation:30, rotationDir:-1}).to({rotation:60}).to({rotation:10, rotationDir:1});
 * </code>
 * You can also disable the plugin completely for a tween by setting tween.pluginData.Rotation_disabled=true.
 * 
 * Documentation: https://www.createjs.com/docs/tweenjs/classes/RotationPlugin.html
 * @author VolkovRA
 */
@:native("createjs.RotationPlugin")
extern class RotationPlugin 
{
	/**
	 * READ-ONLY. A unique identifying string for this plugin.
	 * Used by TweenJS to ensure duplicate plugins are not installed on a tween.
	 */
	static public var ID(default, null):String;
	
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
	 * @param	props	An object defining the properties this plugin acts on.
	 * 					For example, passing {angle:true} will cause the plugin to only act on the angle property.
	 * 					By default the properties are rotation rotationX, rotationY, and rotationZ.
	 */
	static public function install(props:Dynamic):Void;
	
	/**
	 * Called when a new step is added to a tween (ie. a new "to" action is added to a tween).
	 * @param	tween	The related tween instance.
	 * @param	step	The related tween step. This class is currently undocumented. See the bottom of Tween.js for info.
	 * @param	props	The props object that was passed to to().
	 */
	static public function step(tween:Tween, step:TweenStep, props:Dynamic):Void;
}