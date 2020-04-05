package createjs.display;

import createjs.graphics.Graphics;
import js.html.CanvasRenderingContext2D;

/**
 * A Shape allows you to display vector art in the display list. It composites a Graphics instance which
 * exposes all of the vector drawing methods. The Graphics instance can be shared between multiple Shape
 * instances to display the same vector graphics with different positions or transforms.
 * 
 * If the vector art will not change between draws, you may want to use the cache method to reduce the
 * rendering cost.
 * <code>
 * var graphics = new Graphics().beginFill("#ff0000").drawRect(0, 0, 100, 100);
 * var shape = new Shape(graphics);
 * 
 * //Alternatively use can also use the graphics property of the Shape class to renderer the same as above.
 * var shape = new Shape();
 * shape.graphics.beginFill("#ff0000").drawRect(0, 0, 100, 100);
 * </code>
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
 * Documentation: https://www.createjs.com/docs/easeljs/classes/Shape.html
 * @author VolkovRA
 */
@:native("createjs.Shape")
extern class Shape extends DisplayObject 
{
	/**
	 * Create a new Shape.
	 * @param	graphics The graphics instance to display. If null, a new Graphics instance will be created.
	 */
	public function new(?graphics:Graphics);
	
	
	
	////////////////////
	//   PROPERTIES   //
	////////////////////
	
	/**
	 * The graphics instance to display.
	 */
	public var graphics:Graphics;
	
	
	
	//////////////////
	//   OVERRIDE   //
	//////////////////
	
	/**
	 * Draws the Shape into the specified context ignoring its visible, alpha, shadow, and transform.
	 * Returns true if the draw was handled (useful for overriding functionality).
	 * 
	 * <i>NOTE: This method is mainly for internal use, though it may be useful for advanced uses.</i>
	 * @param	context		The canvas 2D context object to draw into.
	 * @param	ignoreCache	Indicates whether the draw operation should ignore any current cache.
	 * 						For example, used for drawing the cache (to prevent it from simply drawing an existing cache back into itself).
	 * @return	Returns true if the draw was handled.
	 */
	override public function draw(context:CanvasRenderingContext2D, ignoreCache:Bool = false):Bool;
	
	/**
	 * Returns true or false indicating whether the Shape would be visible if drawn to a canvas.
	 * This does not account for whether it would be visible within the boundaries of the stage.
	 * NOTE: This method is mainly for internal use, though it may be useful for advanced uses.
	 * @return	Boolean indicating whether the Shape would be visible if drawn to a canvas
	 */
	override public function isVisible():Bool;
	
	/**
	 * Returns a clone of this Shape.
	 * Some properties that are specific to this instance's current context are reverted to their defaults (for example .parent).
	 * @param	recursive	If true, this Shape's Graphics instance will also be cloned, else the Graphics instance will be shared with the new Shape.
	 * @return	New copy of Shape.
	 */
	override public function clone(?recursive:Bool):Shape;
	
	/**
	 * Returns a string representation of this Shape.
	 * @return	A string representation of the instance.
	 */
	override public function toString():String;
}