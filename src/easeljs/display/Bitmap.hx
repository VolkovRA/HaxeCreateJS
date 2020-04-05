package easeljs.display;

import easeljs.geom.Rectangle;
import haxe.extern.EitherType;
import js.html.CanvasRenderingContext2D;

/**
 * A Bitmap represents an Image, Canvas, or Video in the display list.
 * A Bitmap can be instantiated using an existing HTML element, or a string.
 * <code>var bitmap = new Bitmap("imagePath.jpg");</code>
 * Notes:
 *   1. When using a video source that may loop or seek, use a VideoBuffer object to prevent blinking / flashing.
 *   2. When a string path or image tag that is not yet loaded is used, the stage may need to be redrawn before it
 * 		will be displayed.
 *   3. Bitmaps with an SVG source currently will not respect an alpha value other than 0 or 1. To get around this,
 * 		the Bitmap can be cached.
 *   4. Bitmaps with an SVG source will taint the canvas with cross-origin data, which prevents interactivity. This
 * 		happens in all browsers except recent Firefox builds.
 *   5. Images loaded cross-origin will throw cross-origin security errors when interacted with using a mouse, using
 * 		methods such as getObjectUnderPoint, or using filters, or caching. You can get around this by setting crossOrigin
 * 		flags on your images before passing them to EaselJS, eg: img.crossOrigin="Anonymous";
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
 * Documentation: https://www.createjs.com/docs/easeljs/classes/Bitmap.html
 * @author VolkovRA
 */
@:native("createjs.MovieClip")
extern class Bitmap extends DisplayObject 
{
	/**
	 * Create a new Bitmap.
	 * @param	source	The source image to display.
	 * 					This can be a CanvasImageSource (image, video, canvas), an object with a getImage method that
	 * 					returns a CanvasImageSource, or a string URL to an image. If the latter, a new Image instance
	 * 					with the URL as its src will be used.
	 */
	@:overload(function(url:String){})
	@:overload(function(config:BitmapConfig){})
	public function new(source:CanvasImageSource);
	
	/**
	 * The source image to display.
	 * This can be a CanvasImageSource (image, video, canvas), an object with a getImage method that returns a
	 * CanvasImageSource, or a string URL to an image. If the latter, a new Image instance with the URL as its src will be used.
	 */
	public var image:EitherType<CanvasImageSource, BitmapConfig>;
	
	/**
	 * Specifies an area of the source image to draw.
	 * If omitted, the whole image will be drawn.
	 * Notes:
	 *   1. That video sources must have a width / height set to work correctly with sourceRect.
	 *   2. Cached objects will ignore the sourceRect property.
	 * Default: null
	 */
	public var sourceRect:Rectangle;
	
	
	
	//////////////////
	//   OVERRIDE   //
	//////////////////
	
	/**
	 * Because the content of a Bitmap is already in a simple format, cache is unnecessary for Bitmap instances.
	 * You should not cache Bitmap instances as it can degrade performance.
	 * 
	 * <b>However: If you want to use a filter on a Bitmap, you MUST cache it, or it will not work.</b>
	 * To see the API for caching, please visit the DisplayObject cache method.
	 * @param	x		The x coordinate origin for the cache region.
	 * @param	y		The y coordinate origin for the cache region.
	 * @param	width	The width of the cache region.
	 * @param	height	The height of the cache region.
	 * @param	scale	The scale at which the cache will be created. For example, if you cache a vector shape using myShape.cache(0,0,100,100,2)
	 * 					then the resulting cacheCanvas will be 200x200 px. This lets you scale and rotate cached elements with greater fidelity.
	 * 					Default is 1.
	 * @param	options	Specify additional parameters for the cache logic.
	 */
	override public function cache(x:Float, y:Float, width:Float, height:Float, scale:Float = 1, options:CacheConfig = null):Void;
	
	/**
	 * Because the content of a Bitmap is already in a simple format, cache is unnecessary for Bitmap instances.
	 * You should not cache Bitmap instances as it can degrade performance.
	 * 
	 * <b>However: If you want to use a filter on a Bitmap, you MUST cache it, or it will not work.</b>
	 * To see the API for caching, please visit the DisplayObject cache method.
	 */
	override public function uncache():Void;
	
	/**
	 * Because the content of a Bitmap is already in a simple format, cache is unnecessary for Bitmap instances.
	 * You should not cache Bitmap instances as it can degrade performance.
	 * 
	 * <b>However: If you want to use a filter on a Bitmap, you MUST cache it, or it will not work.</b>
	 * To see the API for caching, please visit the DisplayObject cache method.
	 * @param	operation The compositeOperation to use, or null to clear the cache and redraw it.
	 */
	override public function updateCache(?operation:CompositeOperation):Void;
	
	/**
	 * Returns a clone of the Bitmap instance.
	 * @param	node	Whether the underlying dom element should be cloned as well.
	 * @return	A clone of the Bitmap instance.
	 */
	override public function clone(node:Bool = false):Bitmap;
	
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
	 * Returns true or false indicating whether the display object would be visible if drawn to a canvas.
	 * This does not account for whether it would be visible within the boundaries of the stage.
	 * 
	 * NOTE: This method is mainly for internal use, though it may be useful for advanced uses.
	 * @return	Boolean indicating whether the display object would be visible if drawn to a canvas
	 */
	override public function isVisible():Bool;
	
	/**
	 * Returns a string representation of this Bitmap.
	 * @return A string representation of the instance.
	 */
	override public function toString():String;
}