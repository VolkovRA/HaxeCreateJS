package createjs.tween;

import createjs.events.EventDispatcher;
import haxe.DynamicAccess;

/**
 * Base class that both Tween and Timeline extend. Should not be instantiated directly.
 * 
 * EVENTS
 * Event.CHANGE				Dispatched whenever the tween's position changes. It occurs after all tweened properties
 * 							are updated and actions are executed.
 * 
 * Event.COMPLETE			Dispatched when the tween reaches its end and has paused itself. This does not fire until
 * 							all loops are complete; tweens that loop continuously will never fire a complete event.
 * 
 * Documentation: https://www.createjs.com/docs/tweenjs/classes/AbstractTween.html
 * @author VolkovRA
 */
@:native("createjs.AbstractTween")
extern class AbstractTween extends EventDispatcher 
{
	/**
	 * Create a new AbstractTween.
	 * @param	properties	The configuration properties to apply to this instance (ex. {loop:-1, paused:true}).
	 * 						Supported props are listed below. These props are set on the corresponding instance properties except where specified.
	 */
	public function new(properties:AbstractTweenConfig = null);
	
	
	
	////////////////////
	//   PROPERTIES   //
	////////////////////
	
	/**
	 * Causes the tween to reverse direction at the end of each loop.
	 * Each single-direction play-through of the tween counts as a single bounce.
	 * For example, to play a tween once forward, and once back, set the loop to 1.
	 * Default: false
	 */
	public var bounce:Bool;
	
	/**
	 * Returns the name of the label on or immediately before the current position.
	 * For example, given a tween with two labels, "first" on frame index 4, and "second" on frame 8, currentLabel would return:
	 *   1. null if the current position is 2.
	 *   2. "first" if the current position is 4.
	 *   3. "first" if the current position is 7.
	 *   4. "second" if the current position is 15.
	 */
	public var currentLabel(default, null):String;
	
	/**
	 * Indicates the duration of this tween in milliseconds (or ticks if useTicks is true), irrespective of loops.
	 * This value is automatically updated as you modify the tween. Changing it directly could result in unexpected behaviour.
	 * Default: 0
	 */
	public var duration(default, null):Float;
	
	/**
	 * Causes this tween to continue playing when a global pause is active.
	 * For example, if TweenJS is using Ticker, then setting this to false (the default) will cause this tween to be paused
	 * when Ticker.paused is set to true. See the tick method for more info. Can be set via the props parameter.
	 * Default: false
	 */
	public var ignoreGlobalPause:Bool;
	
	/**
	 * Indicates the number of times to loop.
	 * If set to -1, the tween will loop continuously.
	 * Note that a tween must loop at least once to see it play in both directions when bounce is set to true.
	 * Default: 0
	 */
	public var loop:Float;
	
	/**
	 * Pauses or unpauses the tween.
	 * A paused tween is removed from the global registry and is eligible for garbage collection if no other references to it exist.
	 */
	public var paused:Bool;
	
	/**
	 * The current normalized position of the tween.
	 * This will always be a value between 0 and duration.
	 * Changing this property directly will have unexpected results, use Tween/setPosition.
	 * Default: 0
	 */
	public var position(default, null):Float;
	
	/**
	 * The raw tween position.
	 * This value will be between 0 and loops * duration while the tween is active, or -1 before it activates.
	 * Default: -1
	 */
	public var rawPosition(default, null):Float;
	
	/**
	 * Causes the tween to play in reverse.
	 * Default: false
	 */
	public var reversed:Bool;
	
	/**
	 * Changes the rate at which the tween advances.
	 * For example, a timeScale value of 2 will double the playback speed, a value of 0.5 would halve it.
	 * Default: 1
	 */
	public var timeScale:Float;
	
	/**
	 * Uses ticks for all durations instead of milliseconds.
	 * This also changes the behaviour of some actions (such as call).
	 * Changing this value on a running tween could have unexpected results.
	 * Default: false
	 */
	public var useTicks(default, null):Bool;
	
	
	
	/////////////////
	//   METHODS   //
	/////////////////
	
	/**
	 * Adds a label that can be used with Timeline/gotoAndPlay/Timeline/gotoAndStop.
	 * @param	label		The label name.
	 * @param	position	The position this label represents.
	 */
	public function addLabel(label:String, position:Float):Void;
	
	/**
	 * Advances the tween by a specified amount.
	 * @param	delta			The amount to advance in milliseconds (or ticks if useTicks is true). Negative values are supported.
	 * @param	ignoreActions	If true, actions will not be executed due to this change in position.
	 */
	public function advance(delta:Float, ignoreActions:Bool = false):Void;
	
	/**
	 * Calculates a normalized position based on a raw position.
	 * For example, given a tween with a duration of 3000ms set to loop: console.log(myTween.calculatePosition(3700); // 700
	 * @param	rawPosition	A raw position.
	 */
	public function calculatePosition(rawPosition:Float):Float;
	
	/**
	 * Returns a list of the labels defined on this tween sorted by position.
	 * @return	A sorted array of objects with label and position properties.
	 */
	public function getLabels():Array<TweenLabel>;
	
	/**
	 * Unpauses this timeline and jumps to the specified position or label.
	 * @param	position	The position in milliseconds (or ticks if useTicks is true) or label to jump to.
	 */
	@:overload(function(label:String):Void{})
	public function gotoAndPlay(position:Float):Void;
	
	/**
	 * Pauses this timeline and jumps to the specified position or label.
	 * @param	position	The position in milliseconds (or ticks if useTicks is true) or label to jump to.
	 */
	@:overload(function(label:String):Void{})
	public function gotoAndStop(position:Float):Void;
	
	/**
	 * If a numeric position is passed, it is returned unchanged.
	 * If a string is passed, the position of the corresponding frame label will be returned, or null if a matching label is not defined.
	 * @param	position	A numeric position value or label string.
	 * @return	The position of the corresponding frame label
	 */
	@:overload(function(label:String):Float{})
	public function resolve(position:Float):Float;
	
	/**
	 * Defines labels for use with gotoAndPlay/Stop. Overwrites any previously set labels.
	 * @param	labels	An object defining labels for using Timeline/gotoAndPlay/Timeline/gotoAndStop in the form {myLabelName:time} where time is in milliseconds (or ticks if useTicks is true).
	 */
	public function setLabels(labels:DynamicAccess<Float>):Void;
	
	/**
	 * Advances the tween to a specified position.
	 * @param	rawPosition		The raw position to seek to in milliseconds (or ticks if useTicks is true).
	 * @param	ignoreActions	If true, do not run any actions that would be triggered by this operation.
	 * @param	jump			If true, only actions at the new position will be run. If false, actions between the old and new position are run.
	 * @param	callback		Primarily for use with MovieClip, this callback is called after properties are updated, but before actions are run.
	 */
	public function setPosition(rawPosition:Float, ignoreActions:Bool = false, jump:Bool = false, callback:AbstractTween->Void):Void;
	
	/**
	 * AbstractTween can not be cloned.
	 */
	@:deprecated
	@:noCompletion
	public function clone():AbstractTween;
	
	/**
	 * Returns a string representation of this AbstractTween.
	 * @return A string representation of the instance.
	 */
	override public function toString():String;
}