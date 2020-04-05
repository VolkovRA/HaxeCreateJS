package easeljs.display;

import easeljs.geom.Rectangle;
import js.html.CanvasRenderingContext2D;

/**
 * The MovieClip class associates a TweenJS Timeline with an EaselJS Container.
 * It allows you to create objects which encapsulate timeline animations, state changes, and synched actions.
 * The MovieClip class has been included in the EaselJS minified file since 0.7.0.
 * 
 * Currently MovieClip only works properly if it is tick based (as opposed to time based) though some
 * concessions have been made to support time-based timelines in the future.
 * 
 * It is recommended to use tween.to() to animate and set properties (use no duration to have it set immediately),
 * and the tween.wait()method to create delays between animations. Note that using the tween.set() method to
 * affect properties will likely not provide the desired result.
 * 
 * EVENTS
 * Event.ADDED				Dispatched when the display object is added to a parent container.
 * 
 * Event.REMOVED			Dispatched when the display object is removed from its parent container.
 * 
 * MouseEvent.CLICK			Dispatched when the user presses their left mouse button and then releases it while over the display object.
 * 							See the MouseEvent class for a listing of event properties.
 * 
 * MouseEvent.DBL_CLICK		Dispatched when the user double clicks their left mouse button over this display object.
 * 							See the MouseEvent class for a listing of event properties.
 * 
 * MouseEvent.MOUSE_DOWN	Dispatched when the user presses their left mouse button over the display object.
 * 							See the MouseEvent class for a listing of event properties.
 * 	
 * MouseEvent.MOUSE_OUT		Dispatched when the user's mouse leaves this display object. This event must be enabled using enableMouseOver.
 * 							See also rollout. See the MouseEvent class for a listing of event properties.
 * 
 * MouseEvent.MOUSE_OVER	Dispatched when the user's mouse enters this display object. This event must be enabled using enableMouseOver.
 * 							See also rollover. See the MouseEvent class for a listing of event properties.
 * 
 * MouseEvent.PRESS_MOVE	After a mousedown occurs on a display object, a pressmove event will be generated on that object whenever the
 * 							mouse moves until the mouse press is released. This can be useful for dragging and similar operations.
 * 							Please note that if the initial mouse target from a mousedown event is removed from the stage after being
 * 							pressed (e.g. during a pressmove event), a pressmove event is still generated. However since it is no longer
 * 							in the display list, the event can not bubble. This means that previous ancestors (parent containers) will
 * 							not receive the event, and therefore can not re-dispatch it. If you intend to listen for pressup or pressmove
 * 							on a dynamic object (such as a MovieClip or Container), then ensure you set mouseChildren to false.
 * 	
 * MouseEvent.PRESS_UP		After a mousedown occurs on a display object, a pressup event will be generated on that object when that mouse
 * 							press is released. This can be useful for dragging and similar operations.
 * 							Please note that if the initial mouse target from a mousedown event is removed from the stage after being
 * 							pressed (e.g. during a pressmove event), a pressup event is still generated. However since it is no longer in
 * 							the display list, the event can not bubble. This means that previous ancestors (parent containers) will not
 * 							receive the event, and therefore can not re-dispatch it. If you intend to listen for pressmove or pressup on
 * 							a dynamic object (such as a MovieClip or Container), then ensure you set mouseChildren to false.
 * 	
 * MouseEvent.ROLL_OVER		This event is similar to mouseover, with the following differences: it does not bubble, and it considers
 * 							Container instances as an aggregate of their content. This event must be enabled using enableMouseOver. See
 * 							the MouseEvent class for a listing of event properties.
 * 	
 * MouseEvent.ROLL_OUT		This event is similar to mouseout, with the following differences: it does not bubble, and it considers Container
 * 							instances as an aggregate of their content. This event must be enabled using enableMouseOver. See the MouseEvent
 * 							class for a listing of event properties.
 * 	
 * TickEvent.TICK			Dispatched on each display object on a stage whenever the stage updates. This occurs immediately before the
 * 							rendering (draw) pass. When update is called, first all display objects on the stage dispatch the tick event,
 * 							then all of the display objects are drawn to stage. Children will have their Tick:event event dispatched in
 * 							order of their depth prior to the event being dispatched on their parent.
 * 
 * 
 * Documentation: https://www.createjs.com/docs/easeljs/classes/MovieClip.html
 * @author VolkovRA
 */
@:native("createjs.MovieClip")
extern class MovieClip extends Container 
{	
	/**
	 * If true, actions in this MovieClip's tweens will be run when the playhead advances.
	 * Default: true
	 */
	public var actionsEnabled:Bool;
	
	/**
	 * If true, the MovieClip will automatically be reset to its first frame whenever the timeline adds it back onto the display list.
	 * This only applies to MovieClip instances with mode of "INDEPENDENT".
	 * 
	 * For example, if you had a character animation with a "body" child MovieClip instance with different costumes on each frame,
	 * you could set body.autoReset = false, so that you can manually change the frame it is on, without worrying that it will be
	 * reset automatically.
	 * Default: true
	 */
	public var autoReset:Bool;
	
	/**
	 * The current frame of the movieclip.
	 * Default: 0
	 */
	public var currentFrame(default, null):Float;
	
	/**
	 * Returns the name of the label on or immediately before the current frame.
	 */
	public var currentLabel(default, null):String;
	
	/**
	 * Returns the duration of this MovieClip in seconds or ticks.
	 */
	public var duration(default, null):Float;
	
	/**
	 * An array of bounds for each frame in the MovieClip.
	 * This is mainly intended for tool output.
	 * Default: null
	 */
	public var frameBounds:Array<Rectangle>;
	
	/**
	 * By default MovieClip instances advance one frame per tick.
	 * Specifying a framerate for the MovieClip will cause it to advance based on elapsed time between ticks as
	 * appropriate to maintain the target framerate.
	 * 
	 * For example, if a MovieClip with a framerate of 10 is placed on a Stage being updated at 40fps, then the
	 * MovieClip will advance roughly one frame every 4 ticks. This will not be exact, because the time between
	 * each tick will vary slightly between frames.
	 * 
	 * This feature is dependent on the tick event object (or an object with an appropriate "delta" property)
	 * being passed into update.
	 * Default: null
	 */
	public var framerate:Float;
	
	/**
	 * Returns an array of objects with label and position (aka frame) properties, sorted by position.
	 */
	public var labels:Array<String>;
	
	/**
	 * Specifies how many times this MovieClip should loop.
	 * A value of -1 indicates it should loop indefinitely.
	 * A value of 1 would cause it to loop once (ie. play a total of twice).
	 * Default: -1
	 */
	public var loop:Float;
	
	/**
	 * Controls how this MovieClip advances its time.
	 * Must be one of 0 MovieClipMode.INDEPENDENT, 1 MovieClipMode.SINGLE_FRAME, or 2 MovieClipMode.SYNCHED.
	 * See each constant for a description of the behaviour.
	 * Default: null
	 */
	public var mode:MovieClipMode;
	
	/**
	 * If true, the MovieClip's position will not advance when ticked.
	 * Default: false
	 */
	public var paused:Bool;
	
	/**
	 * Specifies what the first frame to play in this movieclip, or the only frame to display if mode is MovieClipMode.SINGLE_FRAME.
	 * Default: 0
	 */
	public var startPosition:Float;
	
	/**
	 * The TweenJS Timeline that is associated with this MovieClip.
	 * This is created automatically when the MovieClip instance is initialized.
	 * Animations are created by adding TweenJS Tween instances to the timeline.
	 * <code>
	 * var tween = Tween.get(target).to({x:0}).to({x:100}, 30);
 	 * var mc = new MovieClip();
 	 * mc.timeline.addTween(tween);
	 * </code>
	 * Elements can be added and removed from the timeline by toggling an "_off" property using the tweenInstance.to() method.
	 * Note that using Tween.set is not recommended to create MovieClip animations. The following example will toggle the target
	 * off on frame 0, and then back on for frame 1. You can use the "visible" property to achieve the same effect.
	 * <code>
	 * var tween = Tween.get(target).to({_off:false})
	 *     .wait(1).to({_off:true})
	 *     .wait(1).to({_off:false});
	 * </code>
	 * Default: null
	 */
	public var timeline:Timeline;
	
	/**
	 * Returns the duration of this MovieClip in seconds or ticks.
	 */
	public var totalFrames(default, null):Float;
	
	/**
	 * Create a new MovieClip.
	 * @param	properties	The configuration properties to apply to this instance.
	 * 						These props are set on the corresponding instance properties except where specified.
	 * 						This object will also be passed into the Timeline instance associated with this MovieClip.
	 * 						See the documentation for Timeline for a list of supported props (ex. paused, labels, loop, reversed, etc.)
	 */
	public function new(?properties:MovieClipConfig);
	
	/**
	 * Advances the playhead.
	 * This occurs automatically each tick by default.
	 * @param	time	The amount of time in ms to advance by. Only applicable if framerate is set.
	 */
	public function advance(?time:Float):Void;
	
	/**
	 * Advances this movie clip to the specified position or label and sets paused to false.
	 * @param	position	The animation name or frame number to go to.
	 */
	@:overload(function(label:String):Void{})
	public function gotoAndPlay(position:Int):Void;
	
	/**
	 * Advances this movie clip to the specified position or label and sets paused to true.
	 * @param	position	The animation or frame name to go to.
	 */
	@:overload(function(label:String):Void{})
	public function gotoAndStop(position:Int):Void;
	
	/**
	 * Sets paused to false.
	 */
	public function play():Void;
	
	/**
	 * Sets paused to true.
	 */
	public function stop():Void;
	
	
	////////////////////
	//   DEPRECATED   //
	////////////////////
	
	/**
	 * Use the currentLabel property instead.
	 */
	@:deprecated
	@:noCompletion
	public function getCurrentLabel():String;
	
	/**
	 * Use the duration property instead.
	 */
	@:deprecated
	@:noCompletion
	public function getDuration():Float;
	
	/**
	 * Use the labels property instead.
	 */
	@:deprecated
	@:noCompletion
	public function getLabels():Array<String>;
	
	
	
	//////////////////
	//   OVERRIDE   //
	//////////////////
	
	/**
	 * Draws the display object into the specified context ignoring its visible, alpha, shadow, and transform.
	 * Returns true if the draw was handled (useful for overriding functionality).
	 * NOTE: This method is mainly for internal use, though it may be useful for advanced uses.
	 * @param	context		The canvas 2D context object to draw into.
	 * @param	ignoreCache	Indicates whether the draw operation should ignore any current cache.
	 * 						For example, used for drawing the cache (to prevent it from simply drawing an existing cache back into itself).
	 * @return	Returns true if the draw was handled (useful for overriding functionality).
	 */
	override public function draw(context:CanvasRenderingContext2D, ignoreCache:Bool = false):Bool;
	
	/**
	 * Tests whether the display object intersects the specified local point (ie. draws a pixel with alpha > 0 at the specified position).
	 * This ignores the alpha, shadow and compositeOperation of the display object, and all transform properties including regX/Y.
	 * @param	x	The x position to check in the display object's local coordinates.
	 * @param	y	The y position to check in the display object's local coordinates.
	 * @return	A Boolean indicating whether there is a visible section of a DisplayObject that overlaps the specified coordinates.
	 */
	override public function hitTest(x:Float, y:Float):Bool;
	
	/**
	 * Returns true or false indicating whether the display object would be visible if drawn to a canvas.
	 * This does not account for whether it would be visible within the boundaries of the stage.
	 * 
	 * NOTE: This method is mainly for internal use, though it may be useful for advanced uses.
	 * @return	Boolean indicating whether the display object would be visible if drawn to a canvas
	 */
	override public function isVisible():Bool;
	
	/**
	 * MovieClip cannot be cloned.
	 * TODO: Add support for this? Need to clone the Timeline & retarget tweens - pretty complex.
	 */
	override public function clone(recursive:Bool = false):MovieClip;
	
	/**
	 * Returns a string representation of this MovieClip.
	 * @return A string representation of the instance.
	 */
	override public function toString():String;
}