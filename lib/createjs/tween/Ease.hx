package createjs.tween;

import js.lib.Function;

/**
 * The Ease class provides a collection of easing functions for use with TweenJS.
 * It does not use the standard 4 param easing signature.
 * Instead it uses a single param which indicates the current linear ratio (0 to 1) of the tween.
 * 
 * Most methods on Ease can be passed directly as easing functions:
 * <code>Tween.get(target).to({x:100}, 500, Ease.linear);</code>
 * 
 * However, methods beginning with "get" will return an easing function based on parameter values:
 * <code>Tween.get(target).to({y:200}, 500, Ease.getPowIn(2.2));</code>
 * 
 * Please see the spark table demo for an overview of the different ease types on TweenJS.com.
 * <i>Equations derived from work by Robert Penner.</i>
 * 
 * Documentation: https://www.createjs.com/docs/tweenjs/classes/Ease.html
 * Documentation: https://www.createjs.com/demos/tweenjs/tween_sparktable
 * @author VolkovRA
 */
@:native("createjs.Ease")
extern class Ease 
{
	////////////////
	//   EASING   //
	////////////////
	
	/**
	 * Easing function.
	 * @param	t Time value.
	 * @return	Tween value.
	 */
	static public function backIn(t:Float):Float;
	
	/**
	 * Easing function.
	 * @param	t Time value.
	 * @return	Tween value.
	 */
	static public function backInOut(t:Float):Float;
	
	/**
	 * Easing function.
	 * @param	t Time value.
	 * @return	Tween value.
	 */
	static public function backOut(t:Float):Float;
	
	/**
	 * Easing function.
	 * @param	t Time value.
	 * @return	Tween value.
	 */
	static public function bounceIn(t:Float):Float;
	
	/**
	 * Easing function.
	 * @param	t Time value.
	 * @return	Tween value.
	 */
	static public function bounceInOut(t:Float):Float;
	
	/**
	 * Easing function.
	 * @param	t Time value.
	 * @return	Tween value.
	 */
	static public function bounceOut(t:Float):Float;
	
	/**
	 * Easing function.
	 * @param	t Time value.
	 * @return	Tween value.
	 */
	static public function circIn(t:Float):Float;
	
	/**
	 * Easing function.
	 * @param	t Time value.
	 * @return	Tween value.
	 */
	static public function circInOut(t:Float):Float;
	
	/**
	 * Easing function.
	 * @param	t Time value.
	 * @return	Tween value.
	 */
	static public function circOut(t:Float):Float;
	
	/**
	 * Easing function.
	 * @param	t Time value.
	 * @return	Tween value.
	 */
	static public function cubicIn(t:Float):Float;
	
	/**
	 * Easing function.
	 * @param	t Time value.
	 * @return	Tween value.
	 */
	static public function cubicInOut(t:Float):Float;
	
	/**
	 * Easing function.
	 * @param	t Time value.
	 * @return	Tween value.
	 */
	static public function cubicOut(t:Float):Float;
	
	/**
	 * Easing function.
	 * @param	t Time value.
	 * @return	Tween value.
	 */
	static public function elasticIn(t:Float):Float;
	
	/**
	 * Easing function.
	 * @param	t Time value.
	 * @return	Tween value.
	 */
	static public function elasticInOut(t:Float):Float;
	
	/**
	 * Easing function.
	 * @param	t Time value.
	 * @return	Tween value.
	 */
	static public function elasticOut(t:Float):Float;
	
	/**
	 * Easing function.
	 * @param	t Time value.
	 * @return	Tween value.
	 */
	static public function linear(t:Float):Float;
	
	/**
	 * Easing function.
	 * @param	t Time value.
	 * @return	Tween value.
	 */
	static public function none(t:Float):Float;
	
	/**
	 * Easing function.
	 * @param	t Time value.
	 * @return	Tween value.
	 */
	static public function quadIn(t:Float):Float;
	
	/**
	 * Easing function.
	 * @param	t Time value.
	 * @return	Tween value.
	 */
	static public function quadInOut(t:Float):Float;
	
	/**
	 * Easing function.
	 * @param	t Time value.
	 * @return	Tween value.
	 */
	static public function quadOut(t:Float):Float;
	
	/**
	 * Easing function.
	 * @param	t Time value.
	 * @return	Tween value.
	 */
	static public function quartIn(t:Float):Float;
	
	/**
	 * Easing function.
	 * @param	t Time value.
	 * @return	Tween value.
	 */
	static public function quartInOut(t:Float):Float;
	
	/**
	 * Easing function.
	 * @param	t Time value.
	 * @return	Tween value.
	 */
	static public function quartOut(t:Float):Float;
	
	/**
	 * Easing function.
	 * @param	t Time value.
	 * @return	Tween value.
	 */
	static public function quintIn(t:Float):Float;
	
	/**
	 * Easing function.
	 * @param	t Time value.
	 * @return	Tween value.
	 */
	static public function quintInOut(t:Float):Float;
	
	/**
	 * Easing function.
	 * @param	t Time value.
	 * @return	Tween value.
	 */
	static public function quintOut(t:Float):Float;
	
	/**
	 * Easing function.
	 * @param	t Time value.
	 * @return	Tween value.
	 */
	static public function sineIn(t:Float):Float;
	
	/**
	 * Easing function.
	 * @param	t Time value.
	 * @return	Tween value.
	 */
	static public function sineInOut(t:Float):Float;
	
	/**
	 * Easing function.
	 * @param	t Time value.
	 * @return	Tween value.
	 */
	static public function sineOut(t:Float):Float;
	
	
	
	/////////////////////////////
	//   EASING CONSTRUCTORS   //
	/////////////////////////////
	
	/**
	 * Mimics the simple -100 to 100 easing in Adobe Flash/Animate.
	 * @param	amount	A value from -1 (ease in) to 1 (ease out) indicating the strength and direction of the ease.
	 * @return	Easing function.
	 */
	static public function get(amount:Float):Function;
	
	/**
	 * Configurable "back in" ease.
	 * @param	amount	The strength of the ease.
	 * @return	Easing function.
	 */
	static public function getBackIn(amount:Float):Function;
	
	/**
	 * Configurable "back in out" ease.
	 * @param	amount	The strength of the ease.
	 * @return	Easing function.
	 */
	static public function getBackInOut(amount:Float):Function;
	
	/**
	 * Configurable "back out" ease.
	 * @param	amount	The strength of the ease.
	 * @return	Easing function.
	 */
	static public function getBackOut(amount:Float):Function;
	
	/**
	 * Configurable elastic ease.
	 * @param	amplitude	Ampliture value.
	 * @param	period		Period value.
	 * @return	Easing function.
	 */
	static public function getElasticIn(amplitude:Float, period:Float):Function;
	
	/**
	 * Configurable elastic ease.
	 * @param	amplitude	Ampliture value.
	 * @param	period		Period value.
	 * @return	Easing function.
	 */
	static public function getElasticInOut(amplitude:Float, period:Float):Function;
	
	/**
	 * Configurable elastic ease.
	 * @param	amplitude	Ampliture value.
	 * @param	period		Period value.
	 * @return	Easing function.
	 */
	static public function getElasticOut(amplitude:Float, period:Float):Function;
	
	/**
	 * Configurable exponential ease.
	 * @param	pow	The exponent to use (ex. 3 would return a cubic ease).
	 * @return	Easing function.
	 */
	static public function getPowIn(pow:Float):Function;
	
	/**
	 * Configurable exponential ease.
	 * @param	pow	The exponent to use (ex. 3 would return a cubic ease).
	 * @return	Easing function.
	 */
	static public function getPowInOut(pow:Float):Function;
	
	/**
	 * Configurable exponential ease.
	 * @param	pow	The exponent to use (ex. 3 would return a cubic ease).
	 * @return	Easing function.
	 */
	static public function getPowOut(pow:Float):Function;
}