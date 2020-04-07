package createjs.plugin;

import createjs.tween.Tween;
import createjs.tween.TweenStep;
import js.lib.RegExp;

/**
 * The ColorPlugin enables tweening of almost any CSS color values.
 * This includes 3 or 6 digit hex colors (#00FF00), rgb, rgba, hsl, and hsla colors (but not named colors, such as red).
 * 
 * It can operate in either rgb or hsl mode. It will convert all colors into that mode, and output them accordingly.
 * 
 * Documentation: https://www.createjs.com/docs/tweenjs/classes/ColorPlugin.html
 * @author VolkovRA
 */
@:native("createjs.ColorPlugin")
extern class ColorPlugin 
{
	/**
	 * A unique identifying string for this plugin.
	 * Used by TweenJS to ensure duplicate plugins are not installed on a tween.
	 */
	static public var ID(default, null):String;
	
	/**
	 * RegExp pattern that detects CSS color values.
	 */
	static public var COLOR_RE(default, null):RegExp;
	
	/**
	 * RegExp pattern that matches a 3 or 6 digit RGB string with a preceding #.
	 */
	static public var HEX_RE(default, null):RegExp;
	
	/**
	 * RegExp pattern that matches rgb or hsl color strings, with groups for each value.
	 */
	static public var RGB_HSL_RE(default, null):RegExp;
	
	/**
	 * Installs this plugin for use with TweenJS.
	 * Call this once after TweenJS is loaded to enable this plugin.
	 * @param	mode	A string equalling either "rgb" or "hsl" indicating what color mode should be used for calculations and output.
	 * 					You can input any color type regardless of the mode setting.
	 */
	static public function install(mode:Mode = Mode.RGB):Void;
	
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
 * Mode of calculations and output color.
 */
@:enum abstract Mode(String) to String
{
	/**
	 * RGB Color mode.
	 */
	var RGB = "rgb";
	
	/**
	 * HSL Color mode.
	 */
	var HSL = "hsl";
}