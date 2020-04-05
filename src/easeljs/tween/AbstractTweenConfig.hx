package easeljs.tween;

import easeljs.events.Event;

/**
 * The base configuration properties to apply to all Tween or Timeline instances (ex. {loop:-1, paused:true}).
 * These props are set on the corresponding instance properties except where specified.
 * 
 * Documentation: https://www.createjs.com/docs/tweenjs/classes/AbstractTween.html
 * @author VolkovRA
 */
typedef AbstractTweenConfig =
{
	/**
	 * Uses ticks for all durations instead of milliseconds.
	 * This also changes the behaviour of some actions (such as call).
	 * Changing this value on a running tween could have unexpected results.
	 * Default: false
	 */
	@:optional var useTicks:Bool;
	
	/**
	 * Causes this tween to continue playing when a global pause is active.
	 * For example, if TweenJS is using Ticker, then setting this to false (the default) will cause this tween to be
	 * paused when Ticker.paused is set to true. See the tick method for more info. Can be set via the props parameter.
	 * Default: false
	 */
	@:optional var ignoreGlobalPause:Bool;
	
	/**
	 * Indicates the number of times to loop.
	 * If set to -1, the tween will loop continuously.
	 * Note that a tween must loop at least once to see it play in both directions when bounce is set to true.
	 * Default: 0
	 */
	@:optional var loop:Float;
	
	/**
	 * Causes the tween to play in reverse.
	 * Default: false
	 */
	@:optional var reversed:Bool;
	
	/**
	 * Causes the tween to reverse direction at the end of each loop.
	 * Each single-direction play-through of the tween counts as a single bounce.
	 * For example, to play a tween once forward, and once back, set the loop to 1.
	 * Default: false
	 */
	@:optional var bounce:Bool;
	
	/**
	 * Changes the rate at which the tween advances.
	 * For example, a timeScale value of 2 will double the playback speed, a value of 0.5 would halve it.
	 * Default: 1
	 */
	@:optional var timeScale:Float;
	
	/**
	 * Pauses or unpauses the tween.
	 * A paused tween is removed from the global registry and is eligible for garbage collection if no other references to it exist.
	 * Default: false
	 */
	@:optional var paused:Bool;
	
	/**
	 * The current normalized position of the tween.
	 * This will always be a value between 0 and duration.
	 * Changing this property directly will have unexpected results, use Tween/setPosition.
	 * Default: 0
	 */
	@:optional var position:Float;
	
	/**
	 * Adds the specified function as a listener to the change event.
	 */
	@:optional var onChange:Event->Void;
	
	/**
	 * Adds the specified function as a listener to the complete event.
	 */
	@:optional var onComplete:Event->Void;
}