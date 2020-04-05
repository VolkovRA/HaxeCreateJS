package easeljs.display;

import easeljs.events.EventDispatcher;
import easeljs.filters.Filter;
import easeljs.geom.Matrix2D;
import easeljs.geom.Point;
import easeljs.geom.Rectangle;
import easeljs.ui.MouseCursor;
import js.html.CanvasElement;
import js.html.CanvasRenderingContext2D;

/**
 * DisplayObject is an abstract class that should not be constructed directly.
 * Instead construct subclasses such as Container, Bitmap, and Shape. DisplayObject is the base class
 * for all display classes in the EaselJS library. It defines the core properties and methods that are
 * shared between all display objects, such as transformation properties (x, y, scaleX, scaleY, etc),
 * caching, and mouse handlers.
 * 
 * EVENTS
 * Event.TICK				Dispatched on each display object on a stage whenever the stage updates. This occurs immediately before the
 * 							rendering (draw) pass. When update is called, first all display objects on the stage dispatch the tick event,
 * 							then all of the display objects are drawn to stage. Children will have their Tick:event event dispatched in
 * 							order of their depth prior to the event being dispatched on their parent.
 * 
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
 * Documentation: https://www.createjs.com/docs/easeljs/classes/DisplayObject.html
 * @author VolkovRA
 */
@:native("createjs.DisplayObject")
extern class DisplayObject extends EventDispatcher
{
	/**
	 * Create a new DisplayObject.
	 */
	public function new();
	
	
	
	////////////////
	//   STATIC   //
	////////////////
	
	/**
	 * Suppresses errors generated when using features like hitTest, mouse events, and GetObjectsUnderPoint with cross domain content.
	 * Default: false
	 */
	static public var suppressCrossDomainErrors:Bool;
	
	
	
	////////////////////
	//   PROPERTIES   //
	////////////////////
	
	/**
	 * Unique ID for this display object.
	 * Makes display objects easier for some uses.
	 * Default: -1
	 */
	public var id:Float;
	
	/**
	 * An optional name for this display object.
	 * Included in toString . Useful for debugging.
	 * Default: null
	 */
	public var name:String;
	
	/**
	 * A reference to the Container or Stage object that contains this display object, or null if it has not been added to one.
	 * Default: null
	 */
	public var parent(default, null):Container;
	
	/**
	 * Returns the Stage instance that this display object will be rendered on, or null if it has not been added to one.
	 */
	public var stage(default, null):Stage;
	
	/**
	 * The x (horizontal) position of the display object, relative to its parent.
	 * Default: 0
	 */
	public var x:Float;
	
	/**
	 * The y (vertical) position of the display object, relative to its parent.
	 * Default: 0
	 */
	public var y:Float;
	
	/**
	 * Indicates whether this display object should be rendered to the canvas and included when running the Stage getObjectsUnderPoint method.
	 * Default: true
	 */
	public var visible:Bool;
	
	/**
	 * The alpha (transparency) for this display object. 0 is fully transparent, 1 is fully opaque.
	 * Default: 1
	 */
	public var alpha:Float;
	
	/**
	 * If a cache has been made, this returns the class that is managing the cacheCanvas and its properties.
	 * See BitmapCache for more information. Use this to control, inspect, and change the cache.
	 * In special circumstances this may be a modified or subclassed BitmapCache.
	 * Default: null
	 */
	public var bitmapCache(default, null):BitmapCache;
	
	/**
	 * If a cache is active, this returns the canvas that holds the image of this display object.
	 * See cache for more information. Use this to display the result of a cache.
	 * This will be a HTMLCanvasElement unless special cache rules have been deliberately enabled for this cache.
	 * Default: null
	 */
	public var cacheCanvas(default, null):CanvasElement;
	
	/**
	 * Returns an ID number that uniquely identifies the current cache for this display object.
	 * This can be used to determine if the cache has changed since a previous check. Moved to BitmapCache
	 * Default: 0
	 */
	@:deprecated
	@:noCompletion
	public var cacheID(default, null):Float;
	
	/**
	 * The composite operation indicates how the pixels of this display object will be composited with the elements behind it.
	 * If null, this property is inherited from the parent container. For more information, read the whatwg spec on compositing.
	 * For a list of supported compositeOperation value, visit the W3C draft on Compositing and Blending.
	 * Default: null
	 */
	public var compositeOperation:String;
	
	/**
	 * A CSS cursor (ex. "pointer", "help", "text", etc) that will be displayed when the user hovers over this display object.
	 * You must enable mouseover events using the enableMouseOver method to use this property.
	 * Setting a non-null cursor on a Container will override the cursor set on its descendants.
	 * Default: null
	 */
	public var cursor:MouseCursor;
	
	/**
	 * An array of Filter objects to apply to this display object.
	 * Filters are only applied / updated when Cache or UpdateCache is called on the display object, and only apply to the area that is cached.
	 * Default: null
	 */
	public var filters:Array<Filter>;
	
	/**
	 * A display object that will be tested when checking mouse interactions or testing getObjectsUnderPoint.
	 * The hit area will have its transformation applied relative to this display object's coordinate space (as though the hit
	 * test object were a child of this display object and relative to its regX/Y). The hitArea will be tested using only its
	 * own alpha value regardless of the alpha value on the target display object, or the target's ancestors (parents).
	 * 
	 * If set on a Container, children of the Container will not receive mouse events. This is similar to setting MouseChildren to false.
	 * 
	 * Note that hitArea is NOT currently used by the hitTest() method, nor is it supported for Stage.
	 * Default: null
	 */
	public var hitArea:DisplayObject;
	
	/**
	 * A Shape instance that defines a vector mask (clipping path) for this display object.
	 * The shape's transformation will be applied relative to the display object's parent coordinates (as if it were a child of the parent).
	 * Default: null
	 */
	public var mask:Shape;
	
	/**
	 * Indicates whether to include this object when running mouse interactions.
	 * Setting this to false for children of a Container will cause events on the Container to not fire when that child is clicked.
	 * Setting this property to false does not prevent the getObjectsUnderPoint method from returning the child.
	 * 
	 * Note: In EaselJS 0.7.0, the mouseEnabled property will not work properly with nested Containers. Please check out the latest
	 * NEXT version in GitHub for an updated version with this issue resolved. The fix will be provided in the next release of EaselJS.
	 * Default: true
	 */
	public var mouseEnabled:Bool;
	
	/**
	 * The left offset for this display object's registration point.
	 * For example, to make a 100x100px Bitmap rotate around its center, you would set regX and regY to 50. Cached object's registration
	 * points should be set based on pre-cache conditions, not cached size.
	 * Default: 0
	 */
	public var regX:Float;
	
	/**
	 * The y offset for this display object's registration point.
	 * For example, to make a 100x100px Bitmap rotate around its center, you would set regX and regY to 50. Cached object's registration
	 * points should be set based on pre-cache conditions, not cached size.
	 * Default: 0
	 */
	public var regY:Float;
	
	/**
	 * The rotation in degrees for this display object.
	 * Default: 0
	 */
	public var rotation:Float;
	
	/**
	 * Set both the scaleX and the scaleY property to the same value.
	 * Note that when you get the value, if the scaleX and scaleY are different values, it will return only the scaleX.
	 * Default: 1
	 */
	public var scale:Float;
	
	/**
	 * The factor to stretch this display object horizontally.
	 * For example, setting scaleX to 2 will stretch the display object to twice its nominal width. To horizontally flip
	 * an object, set the scale to a negative number.
	 * Default: 1
	 */
	public var scaleX:Float;
	
	/**
	 * The factor to stretch this display object vertically.
	 * For example, setting scaleY to 0.5 will stretch the display object to half its nominal height. To vertically flip
	 * an object, set the scale to a negative number.
	 * Default: 1
	 */
	public var scaleY:Float;
	
	/**
	 * A shadow object that defines the shadow to render on this display object.
	 * Set to null to remove a shadow. If null, this property is inherited from the parent container.
	 * Default: null
	 */
	public var shadow:Shadow;
	
	/**
	 * The factor to skew this display object horizontally.
	 * Default: 0
	 */
	public var skewX:Float;
	
	/**
	 * The factor to skew this display object vertically.
	 * Default: 0
	 */
	public var skewY:Float;
	
	/**
	 * Indicates whether the display object should be drawn to a whole pixel when snapToPixelEnabled is true.
	 * To enable/disable snapping on whole categories of display objects, set this value on the prototype (Ex. Text.prototype.snapToPixel = true).
	 * Default: true
	 */
	public var snapToPixel:Bool;
	
	/**
	 * If false, the tick will not run on this display object (or its children).
	 * This can provide some performance benefits. In addition to preventing the "tick" event from being dispatched,
	 * it will also prevent tick related updates on some display objects (ex. Sprite & MovieClip frame advancing,
	 * and DOMElement display properties).
	 * Default: true
	 */
	public var tickEnabled:Bool;
	
	/**
	 * If set, defines the transformation for this display object, overriding all other transformation properties (x, y, rotation, scale, skew).
	 * Default: null
	 */
	public var transformMatrix:Matrix2D;
	
	
	
	/////////////////
	//   METHODS   //
	/////////////////
	
	/**
	 * Draws the display object into a new element, which is then used for subsequent draws.
	 * Intended for complex content that does not change frequently (ex. a Container with many children that do not move, or a complex vector
	 * Shape), this can provide for much faster rendering because the content does not need to be re-rendered each tick. The cached display
	 * object can be moved, rotated, faded, etc freely, however if its content changes, you must manually update the cache by calling
	 * updateCache() again. You must specify the cached area via the x, y, w, and h parameters. This defines the rectangle that will be
	 * rendered and cached using this display object's coordinates.
	 * @param	x		The x coordinate origin for the cache region.
	 * @param	y		The y coordinate origin for the cache region.
	 * @param	width	The width of the cache region.
	 * @param	height	The height of the cache region.
	 * @param	scale	The scale at which the cache will be created. For example, if you cache a vector shape using myShape.cache(0,0,100,100,2)
	 * 					then the resulting cacheCanvas will be 200x200 px. This lets you scale and rotate cached elements with greater fidelity.
	 * 					Default is 1.
	 * @param	options	Specify additional parameters for the cache logic.
	 */
	public function cache(x:Float, y:Float, width:Float, height:Float, scale:Float = 1, options:CacheConfig = null):Void;
	
	/**
	 * Returns a clone of this DisplayObject.
	 * Some properties that are specific to this instance's current context are reverted to their defaults (for example .parent).
	 * Caches are not maintained across clones, and some elements are copied by reference (masks, individual filter instances, hit area)
	 * @param	recursive Copying internal objects. (Not used in DisplayObject, but can be useful for overriding functionality)
	 * @return	A clone of the current DisplayObject instance.
	 */
	public function clone(recursive:Bool = false):DisplayObject;
	
	/**
	 * Draws the display object into the specified context ignoring its visible, alpha, shadow, and transform.
	 * Returns true if the draw was handled (useful for overriding functionality).
	 * NOTE: This method is mainly for internal use, though it may be useful for advanced uses.
	 * @param	context		The canvas 2D context object to draw into.
	 * @param	ignoreCache	Indicates whether the draw operation should ignore any current cache.
	 * 						For example, used for drawing the cache (to prevent it from simply drawing an existing cache back into itself).
	 * @return	Returns true if the draw was handled (useful for overriding functionality).
	 */
	public function draw(context:CanvasRenderingContext2D, ignoreCache:Bool = false):Bool;
	
	/**
	 * Returns a rectangle representing this object's bounds in its local coordinate system (ie. with no transformation).
	 * Objects that have been cached will return the bounds of the cache.
	 * 
	 * Not all display objects can calculate their own bounds (ex. Shape).
	 * For these objects, you can use setBounds so that they are included when calculating Container bounds.
	 * 
	 * Bounds can be expensive to calculate for some objects (ex. text, or containers with many children), and are
	 * recalculated each time you call getBounds(). You can prevent recalculation on static objects by setting the bounds explicitly.
	 * 
	 * See more info: https://www.createjs.com/docs/easeljs/classes/DisplayObject.html
	 * @return A Rectangle instance representing the bounds, or null if bounds are not available for this object.
	 */
	public function getBounds():Rectangle;
	
	/**
	 * Returns a data URL for the cache, or null if this display object is not cached.
	 * Only generated if the cache has changed, otherwise returns last result.
	 * @return The image data url for the cache.
	 */
	public function getCacheDataURL():String;
	
	/**
	 * Generates a DisplayProps object representing the combined display properties of the object and all of
	 * its parent Containers up to the highest level ancestor (usually the Stage).
	 * @param	properties A DisplayProps object to populate with the calculated values. If null, a new DisplayProps object is returned.
	 * @return	The combined display properties.
	 */
	public function getConcatenatedDisplayProps(properties:DisplayProps):DisplayProps;
	
	/**
	 * Generates a Matrix2D object representing the combined transform of the display object and all of its
	 * parent Containers up to the highest level ancestor (usually the Stage). This can be used to transform
	 * positions between coordinate spaces, such as with localToGlobal and globalToLocal.
	 * @param	matrix A Matrix2D object to populate with the calculated values. If null, a new Matrix2D object is returned.
	 * @return	The combined matrix.
	 */
	public function getConcatenatedMatrix(matrix:Matrix2D = null):Matrix2D;
	
	/**
	 * Returns a matrix based on this object's current transform.
	 * @param	matrix A Matrix2D object to populate with the calculated values. If null, a new Matrix object is returned.
	 * @return	A matrix representing this display object's transform.
	 */
	public function getMatrix(matrix:Matrix2D = null):Matrix2D;
	
	/**
	 * Use the stage property instead.
	 */
	@:deprecated
	@:noCompletion
	public function getStage():Stage;
	
	/**
	 * Returns a rectangle representing this object's bounds in its parent's coordinate system (ie. with transformations applied).
	 * Objects that have been cached will return the transformed bounds of the cache.
	 * 
	 * Not all display objects can calculate their own bounds (ex. Shape).
	 * For these objects, you can use setBounds so that they are included when calculating Container bounds.
	 * 
	 * To reduce memory impact, the returned Rectangle instance may be reused internally;
	 * clone the instance or copy its values if you need to retain it.
	 * 
	 * Container instances calculate aggregate bounds for all children that return bounds via getBounds.
	 * @return A Rectangle instance representing the bounds, or null if bounds are not available for this object.
	 */
	public function getTransformedBounds():Rectangle;
	
	/**
	 * Transforms the specified x and y position from the global (stage) coordinate space to the coordinate space of the display object.
	 * For example, this could be used to determine the current mouse position within the display object. Returns a Point instance with
	 * x and y properties correlating to the transformed position in the display object's coordinate space.
	 * @param	x		The x position on the stage to transform.
	 * @param	y		The y position on the stage to transform.
	 * @param	point	An object to copy the result into. If omitted a new Point object with x/y properties will be returned.
	 * @return	A Point instance with x and y properties correlating to the transformed position in the display object's coordinate space.
	 */
	public function globalToLocal(x:Float, y:Float, point:Point = null):Point;
	
	/**
	 * Transforms the specified x and y position from the coordinate space of the display object to the global (stage) coordinate space.
	 * For example, this could be used to position an HTML label over a specific point on a nested display object. Returns a Point instance
	 * with x and y properties correlating to the transformed coordinates on the stage.
	 * @param	x		The x position in the source display object to transform.
	 * @param	y		The y position in the source display object to transform.
	 * @param	point	An object to copy the result into. If omitted a new Point object with x/y properties will be returned.
	 * @return	A Point instance with x and y properties correlating to the transformed coordinates on the stage.
	 */
	public function localToGlobal(x:Float, y:Float, point:Point):Point;
	
	/**
	 * Transforms the specified x and y position from the coordinate space of this display object to the coordinate space of the target
	 * display object. Returns a Point instance with x and y properties correlating to the transformed position in the target's coordinate space.
	 * Effectively the same as using the following code with localToGlobal and globalToLocal.
	 * @param	x		The x position in the source display object to transform.
	 * @param	y		The y position on the source display object to transform.
	 * @param	target	The target display object to which the coordinates will be transformed.
	 * @param	point	An object to copy the result into. If omitted a new Point object with x/y properties will be returned.
	 * @return	Returns a Point instance with x and y properties correlating to the transformed position in the target's coordinate space.
	 */
	public function localToLocal(x:Float, y:Float, target:DisplayObject, point:Point = null):Point;
	
	/**
	 * Tests whether the display object intersects the specified point in local coordinates (ie. draws a pixel with alpha > 0 at the
	 * specified position). This ignores the alpha, shadow, hitArea, mask, and compositeOperation of the display object.
	 * @param	x	The x position to check in the display object's local coordinates.
	 * @param	y	The y position to check in the display object's local coordinates.
	 * @return	A Boolean indicating whether a visible portion of the DisplayObject intersect the specified local Point.
	 */
	public function hitTest(x:Float, y:Float):Bool;
	
	/**
	 * Returns true or false indicating whether the display object would be visible if drawn to a canvas.
	 * This does not account for whether it would be visible within the boundaries of the stage.
	 * NOTE: This method is mainly for internal use, though it may be useful for advanced uses.
	 * @return Boolean indicating whether the display object would be visible if drawn to a canvas
	 */
	public function isVisible():Bool;
	
	/**
	 * Provides a chainable shortcut method for setting a number of properties on the instance. (Chainable)
	 * @param	properties A generic object containing properties to copy to the DisplayObject instance.
	 * @return	Returns the instance the method is called on (useful for chaining calls.)
	 */
	public function set(properties:Dynamic):DisplayObject;
	
	/**
	 * Allows you to manually specify the bounds of an object that either cannot calculate their own bounds (ex. Shape & Text)
	 * for future reference, or so the object can be included in Container bounds. Manually set bounds will always override calculated bounds.
	 * 
	 * The bounds should be specified in the object's local (untransformed) coordinates. For example, a Shape instance with a 25px radius
	 * circle centered at 0,0 would have bounds of (-25, -25, 50, 50).
	 * @param	x		The x origin of the bounds. Pass null to remove the manual bounds.
	 * @param	y		The y origin of the bounds.
	 * @param	width	The width of the bounds.
	 * @param	height	The height of the bounds.
	 */
	public function setBounds(x:Float, y:Float, width:Float, height:Float):Void;
	
	/**
	 * Shortcut method to quickly set the transform properties on the display object.
	 * All parameters are optional. Omitted parameters will have the default value set.
	 * @param	x			The horizontal translation (x position) in pixels
	 * @param	y			The vertical translation (y position) in pixels
	 * @param	scaleX		The horizontal scale, as a percentage of 1
	 * @param	scaleY		The vertical scale, as a percentage of 1
	 * @param	rotation	The rotation, in degrees
	 * @param	skewX		The horizontal skew factor
	 * @param	skewY		The vertical skew factor
	 * @param	regX		The horizontal registration point in pixels
	 * @param	regY		The vertical registration point in pixels
	 * @return	Returns this instance. Useful for chaining commands.
	 */
	public function setTransform(x:Float = 0, y:Float = 0, scaleX:Float = 1, scaleY:Float = 1, rotation:Float = 0, skewX:Float = 0, skewY:Float = 0, regX:Float = 0, regY:Float = 0):DisplayObject;
	
	/**
	 * Clears the current cache.
	 * See cache for more information.
	 */
	public function uncache():Void;
	
	/**
	 * Redraws the display object to its cache.
	 * Calling updateCache without an active cache will throw an error. If compositeOperation is null
	 * the current cache will be cleared prior to drawing. Otherwise the display object will be drawn
	 * over the existing cache using the specified compositeOperation.
	 * 
	 * In previous versions caching was handled on DisplayObject but has since been moved to BitmapCache.
	 * This allows for easier interaction and alternate cache methods like WebGL and StageGL.
	 * @param	operation The compositeOperation to use, or null to clear the cache and redraw it.
	 */
	public function updateCache(?operation:CompositeOperation):Void;
	
	/**
	 * Applies this display object's transformation, alpha, globalCompositeOperation, clipping path (mask),
	 * and shadow to the specified context. This is typically called prior to draw.
	 * @param	context The canvas 2D to update.
	 */
	public function updateContext(context:CanvasRenderingContext2D):Void;
	
	
	
	//////////////////
	//   OVERRIDE   //
	//////////////////
	
	/**
	 * Returns a string representation of this DisplayObject.
	 * @return A string representation of the instance.
	 */
	override public function toString():String;
}