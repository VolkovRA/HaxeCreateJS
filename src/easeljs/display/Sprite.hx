package easeljs.display;

import easeljs.BitmapCacheConfig;
import easeljs.display.CompositeOperation;
import easeljs.geom.Rectangle;
import js.html.CanvasRenderingContext2D;

/**
 * Displays a frame or sequence of frames (ie. an animation) from a SpriteSheet instance.
 * A sprite sheet is a series of images (usually animation frames) combined into a single image. For example,
 * an animation consisting of 8 100x100 images could be combined into a 400x200 sprite sheet (4 frames across by 2 high).
 * You can display individual frames, play frames as an animation, and even sequence animations together.
 * 
 * See the SpriteSheet class for more information on setting up frames and animations.
 * <code>
 * var instance = new Sprite(spriteSheet);
 * instance.gotoAndStop("frameName");
 * </code>
 * Until gotoAndStop or gotoAndPlay is called, only the first defined frame defined in the sprite sheet will be displayed.
 * 
 * EVENTS
 * AnimationEvent.ANIMATION_END	Dispatched when an animation reaches its ends.
 * 
 * Event.ADDED					Dispatched when the display object is added to a parent container.
 * 
 * Event.REMOVED				Dispatched when the display object is removed from its parent container.
 * 
 * Event.CHANGE					Dispatched any time the current frame changes. For example, this could be due to automatic advancement
 * 								on a tick, or calling gotoAndPlay() or gotoAndStop().
 * 
 * MouseEvent.CLICK				Dispatched when the user presses their left mouse button and then releases it while over the display object.
 * 								See the MouseEvent class for a listing of event properties.
 * 
 * MouseEvent.DBL_CLICK			Dispatched when the user double clicks their left mouse button over this display object.
 * 								See the MouseEvent class for a listing of event properties.
 * 
 * MouseEvent.MOUSE_DOWN		Dispatched when the user presses their left mouse button over the display object.
 * 								See the MouseEvent class for a listing of event properties.
 * 	
 * MouseEvent.MOUSE_OUT			Dispatched when the user's mouse leaves this display object. This event must be enabled using enableMouseOver.
 * 								See also rollout. See the MouseEvent class for a listing of event properties.
 * 
 * MouseEvent.MOUSE_OVER		Dispatched when the user's mouse enters this display object. This event must be enabled using enableMouseOver.
 * 								See also rollover. See the MouseEvent class for a listing of event properties.
 * 
 * MouseEvent.PRESS_MOVE		After a mousedown occurs on a display object, a pressmove event will be generated on that object whenever the
 * 								mouse moves until the mouse press is released. This can be useful for dragging and similar operations.
 * 								Please note that if the initial mouse target from a mousedown event is removed from the stage after being
 * 								pressed (e.g. during a pressmove event), a pressmove event is still generated. However since it is no longer
 * 								in the display list, the event can not bubble. This means that previous ancestors (parent containers) will
 * 								not receive the event, and therefore can not re-dispatch it. If you intend to listen for pressup or pressmove
 * 								on a dynamic object (such as a MovieClip or Container), then ensure you set mouseChildren to false.
 * 	
 * MouseEvent.PRESS_UP			After a mousedown occurs on a display object, a pressup event will be generated on that object when that mouse
 * 								press is released. This can be useful for dragging and similar operations.
 * 								Please note that if the initial mouse target from a mousedown event is removed from the stage after being
 * 								pressed (e.g. during a pressmove event), a pressup event is still generated. However since it is no longer in
 * 								the display list, the event can not bubble. This means that previous ancestors (parent containers) will not
 * 								receive the event, and therefore can not re-dispatch it. If you intend to listen for pressmove or pressup on
 * 								a dynamic object (such as a MovieClip or Container), then ensure you set mouseChildren to false.
 * 	
 * MouseEvent.ROLL_OVER			This event is similar to mouseover, with the following differences: it does not bubble, and it considers
 * 								Container instances as an aggregate of their content. This event must be enabled using enableMouseOver. See
 * 								the MouseEvent class for a listing of event properties.
 * 	
 * MouseEvent.ROLL_OUT			This event is similar to mouseout, with the following differences: it does not bubble, and it considers Container
 * 								instances as an aggregate of their content. This event must be enabled using enableMouseOver. See the MouseEvent
 * 								class for a listing of event properties.
 * 	
 * TickEvent.TICK				Dispatched on each display object on a stage whenever the stage updates. This occurs immediately before the
 * 								rendering (draw) pass. When update is called, first all display objects on the stage dispatch the tick event,
 * 								then all of the display objects are drawn to stage. Children will have their Tick:event event dispatched in
 * 								order of their depth prior to the event being dispatched on their parent.
 * 
 * Documentation: https://www.createjs.com/docs/easeljs/classes/Sprite.html
 * @author VolkovRA
 */
@:native("createjs.Sprite")
extern class Sprite extends DisplayObject 
{
	/**
	 * Returns the name of the currently playing animation.
	 */
	public var currentAnimation(default, null):String;
	
	/**
	 * Specifies the current frame index within the currently playing animation.
	 * When playing normally, this will increase from 0 to n-1, where n is the number of
	 * frames in the current animation.
	 * 
	 * This could be a <b>non-integer</b> value if using time-based playback (see Sprite/framerate,
	 * or if the animation's speed is not an integer.
	 * Default: 0
	 */
	public var currentAnimationFrame:Float;
	
	/**
	 * The frame index that will be drawn when draw is called.
	 * Note that with some SpriteSheet definitions, this will advance non-sequentially.
	 * This will always be an integer value.
	 * Default: 0
	 */
	public var currentFrame(default, null):Int;
	
	/**
	 * By default Sprite instances advance one frame per tick.
	 * Specifying a framerate for the Sprite (or its related SpriteSheet) will cause it to advance
	 * based on elapsed time between ticks as appropriate to maintain the target framerate.
	 * 
	 * For example, if a Sprite with a framerate of 10 is placed on a Stage being updated at 40fps,
	 * then the Sprite will advance roughly one frame every 4 ticks. This will not be exact, because
	 * the time between each tick will vary slightly between frames.
	 * 
	 * This feature is dependent on the tick event object (or an object with an appropriate "delta"
	 * property) being passed into update.
	 * Default: 0
	 */
	public var framerate:Float;
	
	/**
	 * Prevents the animation from advancing each tick automatically.
	 * For example, you could create a sprite sheet of icons, set paused to true, and display
	 * the appropriate icon by setting currentFrame.
	 * Default: false
	 */
	public var paused:Bool;
	
	/**
	 * The SpriteSheet instance to play back.
	 * This includes the source image, frame dimensions, and frame data.
	 * See SpriteSheet for more information.
	 */
	public var spriteSheet(default, null):SpriteSheet;
	
	/**
	 * Create a new Sprite.
	 * @param	spriteSheet			The SpriteSheet instance to play back. This includes the source image(s), frame dimensions, and frame data.
	 * @param	frameOrAnimation	The frame number or animation to play initially.
	 */
	@:overload(function(spriteSheet:SpriteSheet){})
	@:overload(function(spriteSheet:SpriteSheet, frameOrAnimation:String){})
	public function new(spriteSheet:SpriteSheet, frameOrAnimation:Int);
	
	/**
	 * Advances the playhead.
	 * This occurs automatically each tick by default.
	 * @param	time	The amount of time in ms to advance by. Only applicable if framerate is set on the Sprite or its SpriteSheet.
	 */
	public function advance(?time:Float):Void;
	
	/**
	 * Sets paused to false and plays the specified animation name, named frame, or frame number.
	 * @param	frame	The frame number or animation name that the playhead should move to and begin playing.
	 */
	@:overload(function(frame:String):Void{})
	public function gotoAndPlay(frame:Int):Void;
	
	/**
	 * Sets paused to true and seeks to the specified animation name, named frame, or frame number.
	 * @param	frame	The frame number or animation name that the playhead should move to and stop.
	 */
	@:overload(function(frame:String):Void{})
	public function gotoAndStop(frame:Int):Void;
	
	/**
	 * Play (unpause) the current animation.
	 * The Sprite will be paused if either stop or gotoAndStop is called.
	 * Single frame animations will remain unchanged.
	 */
	public function play():Void;
	
	/**
	 * Stop playing a running animation.
	 * The Sprite will be playing if gotoAndPlay is called.
	 * Note that calling gotoAndPlay or play will resume playback.
	 */
	public function stop():Void;
	
	
	
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
	 * Returns a Rectangle instance defining the bounds of the current frame relative to the origin.
	 * For example, a 90 x 70 frame with regX=50 and regY=40 would return a rectangle with [x=-50, y=-40,
	 * width=90, height=70]. This ignores transformations on the display object.
	 * 
	 * Also see the SpriteSheet getFrameBounds method.
	 * @return	A Rectangle instance. Returns null if the frame does not exist, or the image is not fully loaded.
	 */
	override public function getBounds():Rectangle;
	
	/**
	 * Returns true or false indicating whether the display object would be visible if drawn to a canvas.
	 * This does not account for whether it would be visible within the boundaries of the stage.
	 * NOTE: This method is mainly for internal use, though it may be useful for advanced uses.
	 * @return	Boolean indicating whether the display object would be visible if drawn to a canvas
	 */
	override public function isVisible():Bool;
	
	/**
	 * Because the content of a Sprite is already in a raster format, cache is unnecessary for Sprite instances.
	 * You should not cache Sprite instances as it can degrade performance.
	 */
	override public function uncache():Void;
	
	/**
	 * Because the content of a Sprite is already in a raster format, cache is unnecessary for Sprite instances.
	 * You should not cache Sprite instances as it can degrade performance.
	 * @param	operation The compositeOperation to use, or null to clear the cache and redraw it.
	 */
	override public function updateCache(?operation:CompositeOperation):Void;
	
	/**
	 * Because the content of a Sprite is already in a raster format, cache is unnecessary for Sprite instances.
	 * You should not cache Sprite instances as it can degrade performance.
	 * @param	x		The x coordinate origin for the cache region.
	 * @param	y		The y coordinate origin for the cache region.
	 * @param	width	The width of the cache region.
	 * @param	height	The height of the cache region.
	 * @param	scale	The scale at which the cache will be created. For example, if you cache a vector shape using myShape.cache(0,0,100,100,2)
	 * 					then the resulting cacheCanvas will be 200x200 px. This lets you scale and rotate cached elements with greater fidelity.
	 * 					Default is 1.
	 * @param	options	Specify additional parameters for the cache logic.
	 */
	override public function cache(x:Float, y:Float, width:Float, height:Float, scale:Float = 1, options:BitmapCacheConfig = null):Void;
	
	/**
	 * Returns a clone of the Sprite instance.
	 * Note that the same SpriteSheet is shared between cloned instances.
	 * @param	recursive Copying internal objects. (Not used in Sprite, but can be useful for overriding functionality)
	 * @return	A clone of the Sprite instance.
	 */
	override public function clone(recursive:Bool = false):Sprite;
	
	/**
	 * Returns a string representation of this Sprite.
	 * @return A string representation of the instance.
	 */
	override public function toString():String;
}