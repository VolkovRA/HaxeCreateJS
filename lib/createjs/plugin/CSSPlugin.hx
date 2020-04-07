package createjs.plugin;

import createjs.tween.Tween;
import createjs.tween.TweenStep;
import js.lib.RegExp;

/**
 * A TweenJS plugin for working with numeric CSS string properties (ex. top, left).
 * To use simply install after TweenJS has loaded:
 * <code>
 * createjs.CSSPlugin.install();
 * </code>
 * 
 * CSSPlugin works with almost any style property or unit. It identifies CSS values by looking for an initial value
 * on the element's style object. It also uses this initial value to parse out the units to use with that value.
 * 
 * In the following example, top would be tweened as a style using em units using CSSPlugin, but width would be not
 * be tweened as a style (because there is no initial inline style value for it).
 * <code>
 * myEl.style.top = "10em";
 * Tween.get(myEl).to({top:20, width:100}, 1000);
 * </code>
 * 
 * CSSPlugin can also use computed styles. Please see AbstractTween/compute:property for more information.
 * 
 * CSSPlugin has specific handling for the transform style, and will tween any transforms as long as their operations
 * and units match. For example:
 * <code>
 * myEl.style.transform = "translate(20px, 30px)";
 * Tween.get(myEl)
 *     .to({transform: "translate(40px, 50px)"}, 900) // would be tweened, everything matches
 *     .to({transform: "translate(5em, 300px)"}, 900) // would NOT be tweened, different units (px vs em)
 *     .to({transform: "scaleX(2)"}, 900) // would NOT be tweened, different operations (translate vs rotate)
 * </code>
 * 
 * You can also use * to copy the operation at that position from the previous transform.
 * <code>
 * myEl.style.transform = "translate(0px, 0px) rotate(0deg)";
 * Tween.get(myEl)
 *     .to({transform: "translate(50px, 50px) *"}, 900) // would copy the "rotate" operation
 *     .to({transform: "* rotate(90deg)"}, 900) // would copy the "translate" operation
 * </code>
 * 
 * Please note that the CSS Plugin is not included in the TweenJS minified file.
 * 
 * Documentation: https://www.createjs.com/docs/tweenjs/classes/CSSPlugin.html
 * @author VolkovRA
 */
@:native("createjs.CSSPlugin")
extern class CSSPlugin 
{
	/**
	 * A unique identifying string for this plugin.
	 * Used by TweenJS to ensure duplicate plugins are not installed on a tween.
	 */
	static public var ID(default, null):String;
	
	/**
	 * By default, CSSPlugin uses only inline styles on the target element (ie. set via the style attribute,
	 * style property, or cssText) to determine which properties should be tweened via CSS, and what units to use.
	 * 
	 * Setting compute to true causes CSSPlugin to use getComputedStyle for this purpose. This has the advantage
	 * of including all styles that effect the target element, however there are some important considerations for its use:
	 *   1. getComputedStyle is computationally expensive, which could lead to performance issues if you are creating a
	 * 		large number of tweens at once.
	 *   2. styles are normalized. For example, a width value specified as a % may be computed as px, which CSSPlugin will
	 * 		use for the tween. Different browsers may normalize values differently.
	 *   3. there are a large number of computed styles, which increases the chance that a property will be identified as a style.
	 *   4. does not work with IE8 or below.
	 * 
	 * <code>
	 * The compute setting can be overridden on a per-tween basis by setting tween.pluginData.CSS_compute. For example,
	 * to enable computed styles for a new tween, you could use:
	 * 
	 *     Tween.get(el, {pluginData:{CSS_compute:true}}).to({top:20}, 1000);
	 * 
	 * Given the considerations for compute, it is recommended that you keep the default global setting of false and override it
	 * in specific cases via pluginData.
	 * </code>
	 * 
	 * Default: false
	 */
	static public var compute:Bool;
	
	/**
	 * Extracts the numeric value and suffix from a single CSS value.
	 */
	static public var VALUE_RE(default, null):RegExp;
	
	/**
	 * Extracts the numeric value and suffix from comma delimited lists.
	 */
	static public var TRANSFORM_VALUE_RE(default, null):RegExp;
	
	/**
	 * Extracts the components of a transform.
	 */
	static public var TRANSFORM_RE(default, null):RegExp;
	
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