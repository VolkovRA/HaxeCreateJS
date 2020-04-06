package createjs.tween;

import js.lib.Function;

/**
 * Tweens properties for a single target. Methods can be chained to create complex animation sequences:
 * <code>
 * Tween.get(target)
 *     .wait(500)
 *     .to({alpha:0, visible:false}, 1000)
 *     .call(handleComplete);
 * </code>
 * 
 * Multiple tweens can share a target, however if they affect the same properties there could be unexpected behaviour.
 * To stop all tweens on an object, use removeTweens or pass override:true in the props argument.
 * <code>
 * Tween.get(target, {override:true}).to({x:100});
 * </code>
 * 
 * Subscribe to the Tween/change:event event to be notified when the tween position changes.
 * <code>
 * Tween.get(target, {override:true}).to({x:100}).addEventListener(Event.CHANGE, handleChange);
 * function handleChange(event:Event) {
 *     // The tween changed.
 * }
 * </code>
 * See the get method also.
 * 
 * EVENTS
 * Event.CHANGE				Dispatched whenever the tween's position changes. It occurs after all tweened properties
 * 							are updated and actions are executed.
 * 
 * Event.COMPLETE			Dispatched when the tween reaches its end and has paused itself. This does not fire until
 * 							all loops are complete; tweens that loop continuously will never fire a complete event.
 * 
 * Documentation: https://www.createjs.com/docs/tweenjs/classes/Tween.html
 * @author VolkovRA
 */
@:native("createjs.Tween")
extern class Tween extends AbstractTween 
{
	/**
	 * Create a new Tween.
	 * @param	target		The target object that will have its properties tweened.
	 * @param	properties	The configuration properties to apply to this instance (ex. {loop:-1, paused:true}).
	 */
	public function new(target:Dynamic, properties:TweenConfig = null);
	
	
	
	////////////////
	//   STATIC   //
	////////////////
	
	/**
	 * Constant returned by plugins to tell the tween not to use default assignment.
	 */
	static public var IGNORE:Dynamic;
	
	/**
	 * Returns a new tween instance.
	 * This is functionally identical to using new Tween(...), but may look cleaner with the chained syntax of TweenJS.
	 * <code>
	 * var tween = Tween.get(target).to({x:100}, 500);
	 * // equivalent to:
	 * var tween = new Tween(target).to({x:100}, 500);
	 * </code>
	 * @param	target		The target object that will have its properties tweened.
	 * @param	properties	The configuration properties to apply to this instance (ex. {loop:-1, paused:true}).
	 * @return	A reference to the created tween.
	 */
	static public function get(target:Dynamic, properties:TweenConfig = null):Tween;
	
	/**
	 * Indicates whether there are any active tweens on the target object (if specified) or in general.
	 * @param	target	The target to check for active tweens. If not specified, the return value will indicate if there are any active tweens on any target.
	 * @return	Indicates if there are active tweens.
	 */
	static public function hasActiveTweens(target:Dynamic = null):Bool;
	
	/**
	 * Stop and remove all existing tweens.
	 */
	static public function removeAllTweens():Void;
	
	/**
	 * Removes all existing tweens for a target.
	 * This is called automatically by new tweens if the override property is true.
	 * @param	target	The target object to remove existing tweens from.
	 */
	static public function removeTweens(target:Dynamic):Void;
	
	/**
	 * Advances all tweens.
	 * This typically uses the Ticker class, but you can call it manually if you prefer to use your own "heartbeat" implementation.
	 * @param	delta	The change in time in milliseconds since the last tick. Required unless all tweens have useTicks set to true.
	 * @param	paused	Indicates whether a global pause is in effect. Tweens with Tween/ignoreGlobalPause:property will ignore this, but all others will pause if this is true.
	 */
	static public function tick(delta:Float, paused:Bool):Void;
	
	
	
	////////////////////
	//   PROPERTIES   //
	////////////////////
	
	/**
	 * The target of this tween.
	 * This is the object on which the tweened properties will be changed.
	 */
	public var target(default, null):Dynamic;
	
	/**
	 * Indicates the tween's current position is within a passive wait.
	 * Default: false
	 */
	public var passive(default, null):Bool;
	
	/**
	 * Allows you to specify data that will be used by installed plugins.
	 * Each plugin uses this differently, but in general you specify data by assigning it to a property of pluginData
	 * with the same name as the plugin. Note that in many cases, this data is used as soon as the plugin initializes
	 * itself for the tween. As such, this data should be set before the first to call in most cases.
	 * <code>myTween.pluginData.SmartRotation = data;</code>
	 * 
	 * Most plugins also support a property to disable them for a specific tween.
	 * This is typically the plugin name followed by "_disabled".
	 * <code>myTween.pluginData.SmartRotation_disabled = true;</code>
	 * 
	 * Some plugins also store working data in this object, usually in a property named _PluginClassName.
	 * See the documentation for individual plugins for more details.
	 * 
	 */
	public var pluginData:Dynamic;
	
	
	
	/////////////////
	//   METHODS   //
	/////////////////
	
	/**
	 * Adds an action to call the specified function.
	 * <code>
	 * //would call myFunction() after 1 second.
	 * Tween.get().wait(1000).call(myFunction);
	 * </code>
	 * @param	callback	The function to call.
	 * @param	params		The parameters to call the function with. If this is omitted, then the function will be called with a single param pointing to this tween.
	 * @param	scope		The scope to call the function in. If omitted, it will be called in the target's scope.
	 * @return	This tween instance (for chaining calls).
	 */
	public function call(callback:Function, params:Array<Dynamic> = null, scope:Dynamic = null):Tween;
	
	/**
	 * Adds a label that can be used with Tween/gotoAndPlay/Tween/gotoAndStop at the current point in the tween.
	 * For example:
	 * <code>
	 * var tween = Tween.get(foo)
	 *     .to({x:100}, 1000)
	 *     .label("myLabel")
	 *     .to({x:200}, 1000);
	 * </code>
	 * @param	name	The label name.
	 * @return	This tween instance (for chaining calls).
	 */
	public function label(name:String):Tween;
	
	/**
	 * Adds an action to pause the specified tween.
	 * <code>myTween.pause(otherTween).to({alpha:1}, 1000).play(otherTween);</code>
	 * 
	 * Note that this executes at the end of a tween update, so the tween may advance beyond the time the pause action was inserted at.
	 * For example:
	 * <code>myTween.to({foo:0}, 1000).pause().to({foo:1}, 1000);</code>
	 * 
	 * At 60fps the tween will advance by ~16ms per tick, if the tween above was at 999ms prior to the current tick, it will advance to 1015ms (15ms into the second "step") and then pause.
	 * @param	tween	The tween to pause. Defaults to this tween.
	 * @return	This tween instance (for chaining calls)
	 */
	public function pause(tween:Tween = null):Tween;
	
	/**
	 * Adds an action to play (unpause) the specified tween.
	 * This enables you to sequence multiple tweens.
	 * <code>myTween.to({x:100}, 500).play(otherTween);</code>
	 * @param	tween	The tween to play. Defaults to this tween.
	 * @return	This tween instance (for chaining calls).
	 */
	public function play(tween:Tween = null):Tween;
	
	/**
	 * Adds an action to set the specified props on the specified target.
	 * If target is null, it will use this tween's target. Note that for properties on the target object, you should consider using a
	 * zero duration to operation instead so the values are registered as tweened props.
	 * <code>myTween.wait(1000).set({visible:false}, foo);</code>
	 * @param	properties	The properties to set (ex. {visible:false}).
	 * @param	target		The target to set the properties on. If omitted, they will be set on the tween's target.
	 * @return	This tween instance (for chaining calls).
	 */
	public function set(properties:Dynamic, target:Dynamic = null):Tween;
	
	/**
	 * Adds a tween from the current values to the specified properties.
	 * Set duration to 0 to jump to these value. Numeric properties will be tweened from their current value in the tween to the target value.
	 * Non-numeric properties will be set at the end of the specified duration.
	 * @param	properties	An object specifying property target values for this tween (Ex. {x:300} would tween the x property of the target to 300).
	 * @param	duration	The duration of the tween in milliseconds (or in ticks if useTicks is true).
	 * @param	ease		The easing function to use for this tween.
	 * 						Default: Ease.linear
	 * @return	This tween instance (for chaining calls).
	 */
	public function to(properties:Dynamic, duration:Float = 0, ease:Function = null):Tween;
	
	/**
	 * Adds a wait (essentially an empty tween).
	 * <code>
	 * //This tween will wait 1s before alpha is faded to 0.
	 * Tween.get(target).wait(1000).to({alpha:0}, 1000);
	 * </code>
	 * @param	duration	The duration of the wait in milliseconds (or in ticks if useTicks is true).
	 * @param	passive		Tween properties will not be updated during a passive wait.
	 * 						This is mostly useful for use with Timeline instances that contain multiple tweens affecting the same target at different times.
	 * @return	This tween instance (for chaining calls).
	 */
	public function wait(duration:Float, passive:Bool = false):Tween;
	
	/**
	 * Returns a string representation of this Tween.
	 * @return A string representation of the instance.
	 */
	override public function toString():String;
}