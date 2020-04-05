package easeljs.display;

import easeljs.geom.Point;
import js.html.CanvasRenderingContext2D;
import js.html.Element;

/**
 * A DOMElement allows you to associate a HTMLElement with the display list.
 * It will be transformed within the DOM as though it is child of the Container it is added to. However, it is not rendered to canvas,
 * and as such will retain whatever z-index it has relative to the canvas (ie. it will be drawn in front of or behind the canvas).
 * 
 * The position of a DOMElement is relative to their parent node in the DOM. It is recommended that the DOM Object be added to a div
 * that also contains the canvas so that they share the same position on the page.
 * 
 * DOMElement is useful for positioning HTML elements over top of canvas content, and for elements that you want to display outside
 * the bounds of the canvas. For example, a tooltip with rich HTML content.
 * 
 * Mouse Interaction
 * DOMElement instances are not full EaselJS display objects, and do not participate in EaselJS mouse events or support methods
 * like hitTest. To get mouse events from a DOMElement, you must instead add handlers to the htmlElement (note, this does not support
 * EventDispatcher)
 * <code>
 * var domElement = new createjs.DOMElement(htmlElement);
 * domElement.htmlElement.onclick = function() {
 *     console.log("clicked");
 * }
 * </code>
 * Important: This class needs to be notified it is about to be drawn, this will happen automatically if you call stage.update, calling
 * stage.draw or disabling tickEnabled will miss important steps and it will render stale information.
 * 
 * EVENTS
 * Event.ADDED					Dispatched when the display object is added to a parent container.
 * 
 * Event.REMOVED				Dispatched when the display object is removed from its parent container.
 * 
 * MouseEvent.CLICK				Interaction events should be added to htmlElement, and not the DOMElement instance, since DOMElement instances
 * 								are not full EaselJS display objects and do not participate in EaselJS mouse events.
 * 
 * MouseEvent.DBL_CLICK_HTML	Interaction events should be added to htmlElement, and not the DOMElement instance, since DOMElement instances
 * 								are not full EaselJS display objects and do not participate in EaselJS mouse events.
 * 
 * MouseEvent.DBL_CLICK			Dispatched when the user double clicks their left mouse button over this display object.
 * 								See the MouseEvent class for a listing of event properties.
 * 
 * MouseEvent.MOUSE_DOWN		Interaction events should be added to htmlElement, and not the DOMElement instance, since DOMElement instances
 * 								are not full EaselJS display objects and do not participate in EaselJS mouse events.
 * 	
 * MouseEvent.MOUSE_OUT			Dispatched when the user's mouse leaves this display object. This event must be enabled using enableMouseOver.
 * 								See also rollout. See the MouseEvent class for a listing of event properties.
 * 
 * MouseEvent.MOUSE_OVER		The HTMLElement can listen for the mouseover event, not the DOMElement instance. Since DOMElement instances
 * 								are not full EaselJS display objects and do not participate in EaselJS mouse events.
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
 * Documentation: https://www.createjs.com/docs/easeljs/classes/DOMElement.html
 * @author VolkovRA
 */
@:native("createjs.DisplayObject")
extern class DOMElement<T:Element> extends DisplayObject 
{
	/**
	 * Create a new DOMElement.
	 * @param	element	A reference or id for the DOM element to manage.
	 */
	@:overload(function(id:String){})
	public function new(element:T);
	
	/**
	 * The DOM object to manage.
	 */
	public var htmlElement:T;
	
	
	
	//////////////////
	//   OVERRIDE   //
	//////////////////
	
	/**
	 * Not applicable to DOMElement.
	 */
	override public function cache(x:Float, y:Float, width:Float, height:Float, scale:Float = 1, options:CacheConfig = null):Void;
	
	/**
	 * Not applicable to DOMElement.
	 */
	override public function uncache():Void;
	
	/**
	 * Not applicable to DOMElement.
	 */
	override public function updateCache(?operation:CompositeOperation):Void;
	
	/**
	 * DOMElement cannot be cloned.
	 * Throws an error.
	 */
	override public function clone(recursive:Bool = false):DOMElement;
	
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
	 * Not applicable to DOMElement.
	 */
	override public function globalToLocal(x:Float, y:Float, point:Point = null):Point;
	
	/**
	 * Not applicable to DOMElement.
	 */
	override public function localToGlobal(x:Float, y:Float, point:Point):Point;
	
	/**
	 * Not applicable to DOMElement.
	 */
	override public function localToLocal(x:Float, y:Float, target:DisplayObject, point:Point = null):Point;
	
	/**
	 * Not applicable to DOMElement.
	 */
	override public function hitTest(x:Float, y:Float):Bool;
	
	/**
	 * Returns true or false indicating whether the display object would be visible if drawn to a canvas.
	 * This does not account for whether it would be visible within the boundaries of the stage.
	 * NOTE: This method is mainly for internal use, though it may be useful for advanced uses.
	 * @return	Boolean indicating whether the display object would be visible if drawn to a canvas
	 */
	override public function isVisible():Bool;
	
	/**
	 * Returns a string representation of this DOMElement.
	 * @return A string representation of the instance.
	 */
	override public function toString():String;
}