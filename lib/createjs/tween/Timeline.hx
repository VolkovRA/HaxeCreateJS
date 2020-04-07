package createjs.tween;

import haxe.extern.Rest;

/**
 * The Timeline class synchronizes multiple tweens and allows them to be controlled as a group.
 * Please note that if a timeline is looping, the tweens on it may appear to loop even if the "loop" property of the tween is false.
 * 
 * NOTE: Timeline currently also accepts a param list in the form: tweens, labels, props.
 * This is for backwards compatibility only and will be removed in the future.
 * Include tweens and labels as properties on the props object.
 * 
 * EVENTS
 * Event.CHANGE				Dispatched whenever the tween's position changes. It occurs after all tweened properties
 * 							are updated and actions are executed.
 * 
 * Event.COMPLETE			Dispatched when the tween reaches its end and has paused itself. This does not fire until
 * 							all loops are complete; tweens that loop continuously will never fire a complete event.
 * 
 * Documentation: https://www.createjs.com/docs/tweenjs/classes/Timeline.html
 * @author VolkovRA
 */
@:native("createjs.Timeline")
extern class Timeline extends AbstractTween 
{
	/**
	 * Create a new Tween.
	 * @param	properties	The configuration properties to apply to this instance (ex. {loop:-1, paused:true}).
	 */
	public function new(properties:TimelineConfig = null);
	
	
	
	////////////////////
	//   PROPERTIES   //
	////////////////////
	
	/**
	 * The array of tweens in the timeline.
	 * It is <b>strongly</b> recommended that you use Tween/addTween and Tween/removeTween, rather
	 * than accessing this directly, but it is included for advanced uses.
	 */
	public var tweens:Array<Tween>;
	
	
	
	/////////////////
	//   METHODS   //
	/////////////////
	
	/**
	 * Adds one or more tweens (or timelines) to this timeline.
	 * The tweens will be paused (to remove them from the normal ticking system) and managed by this timeline.
	 * Adding a tween to multiple timelines will result in unexpected behaviour.
	 * @param	tween	The tween(s) to add. Accepts multiple arguments.
	 * @return	The first tween that was passed in.
	 */
	public function addTween(tween:Rest<Tween>):Tween;
	
	/**
	 * Removes one or more tweens from this timeline.
	 * @param	tween	Accepts multiple arguments.
	 * @return	Returns true if all of the tweens were successfully removed.
	 */
	public function removeTween(tween:Rest<Tween>):Bool;
	
	/**
	 * Recalculates the duration of the timeline.
	 * The duration is automatically updated when tweens are added or removed, but this method is useful
	 * if you modify a tween after it was added to the timeline.
	 */
	public function updateDuration():Void;
	
	/**
	 * Timeline can not be cloned.
	 */
	@:deprecated
	@:noCompletion
	override public function clone():Timeline;
	
	/**
	 * Returns a string representation of this Timeline.
	 * @return A string representation of the instance.
	 */
	override public function toString():String;
}