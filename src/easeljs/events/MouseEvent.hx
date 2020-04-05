package easeljs.events;

import easeljs.display.DisplayObject;

/**
 * Passed as the parameter to all mouse/pointer/touch related events.
 * For a listing of mouse events and their properties, see the DisplayObject and Stage event listings.
 * Documentation: https://www.createjs.com/docs/easeljs/classes/MouseEvent.html
 * @author VolkovRA
 */
@:native("createjs.MouseEvent")
extern class MouseEvent extends Event 
{
	/**
	 * Create a new MouseEvent.
	 * @param	type			The event type.
	 * @param	bubbles			Indicates whether the event will bubble through the display list.
	 * @param	cancelable		Indicates whether the default behaviour of this event can be cancelled.
	 * @param	stageX			The normalized x position relative to the stage.
	 * @param	stageY			The normalized y position relative to the stage.
	 * @param	nativeEvent		The native DOM event related to this mouse event.
	 * @param	pointerID		The unique id for the pointer.
	 * @param	primary			Indicates whether this is the primary pointer in a multitouch environment.
	 * @param	rawX			The raw x position relative to the stage.
	 * @param	rawY			The raw y position relative to the stage.
	 * @param	relatedTarget	The secondary target for the event.
	 */
	public function new(	type:String,
							bubbles:Bool,
							cancelable:Bool,
							stageX:Float,
							stageY:Float,
							nativeEvent:js.html.MouseEvent,
							pointerID:Float,
							primary:Bool,
							rawX:Float,
							rawY:Float,
							relatedTarget:DisplayObject
	);
	
	
	
	////////////////
	//   STATIC   //
	////////////////
	
	/**
	 * The `MouseEvent.CLICK` constant defines the value of the `type` property of an `click` Event object.
	 */
	public static inline var CLICK:String = "click";
	
	/**
	 * The `MouseEvent.DBLCLICK` constant defines the value of the `type` property of an `dblclick` Event object.
	 */
	public static inline var DBL_CLICK:String = "dblclick";
	
	/**
	 * The `MouseEvent.DBLCLICK` constant defines the value of the `type` property of an `dblClick` Event object.
	 */
	public static inline var DBL_CLICK_HTML:String = "dblClick";
	
	/**
	 * The `MouseEvent.MOUSE_DOWN` constant defines the value of the `type` property of an `mousedown` Event object.
	 */
	public static inline var MOUSE_DOWN:String = "mousedown";
	
	/**
	 * The `MouseEvent.MOUSE_OUT` constant defines the value of the `type` property of an `mouseout` Event object.
	 */
	public static inline var MOUSE_OUT:String = "mouseout";
	
	/**
	 * The `MouseEvent.MOUSE_OVER` constant defines the value of the `type` property of an `mouseover` Event object.
	 */
	public static inline var MOUSE_OVER:String = "mouseover";
	
	/**
	 * The `MouseEvent.MOUSE_LEAVE` constant defines the value of the `type` property of an `mouseleave` Event object.
	 */
	public static inline var MOUSE_LEAVE:String = "mouseleave";
	
	/**
	 * The `MouseEvent.MOUSE_ENTER` constant defines the value of the `type` property of an `mouseenter` Event object.
	 */
	public static inline var MOUSE_ENTER:String = "mouseenter";
	
	/**
	 * The `MouseEvent.PRESS_MOVE` constant defines the value of the `type` property of an `pressmove` Event object.
	 */
	public static inline var PRESS_MOVE:String = "pressmove";
	
	/**
	 * The `MouseEvent.PRESS_UP` constant defines the value of the `type` property of an `pressup` Event object.
	 */
	public static inline var PRESS_UP:String = "pressup";
	
	/**
	 * The `MouseEvent.ROLL_OVER` constant defines the value of the `type` property of an `rollover` Event object.
	 */
	public static inline var ROLL_OVER:String = "rollover";
	
	/**
	 * The `MouseEvent.ROLL_OUT` constant defines the value of the `type` property of an `rollout` Event object.
	 */
	public static inline var ROLL_OUT:String = "rollout";
	
	/**
	 * The `MouseEvent.STAGE_MOUSE_UP` constant defines the value of the `type` property of an `stagemouseup` Event object.
	 */
	public static inline var STAGE_MOUSE_UP:String = "stagemouseup";
	
	/**
	 * The `MouseEvent.STAGE_MOUSE_MOVE` constant defines the value of the `type` property of an `stagemousemove` Event object.
	 */
	public static inline var STAGE_MOUSE_MOVE:String = "stagemousemove";
	
	/**
	 * The `MouseEvent.STAGE_MOUSE_DOWN` constant defines the value of the `type` property of an `stagemousedown` Event object.
	 */
	public static inline var STAGE_MOUSE_DOWN:String = "stagemousedown";
	
	
	
	////////////////////
	//   PROPERTIES   //
	////////////////////
	
	/**
	 * Indicates whether the event was generated by a touch input (versus a mouse input).
	 */
	public var isTouch(default, null):Bool;
	
	/**
	 * Returns the x position of the mouse in the local coordinate system of the current target (ie. the dispatcher).
	 */
	public var localX(default, null):Float;
	
	/**
	 * Returns the x position of the mouse in the local coordinate system of the current target (ie. the dispatcher).
	 */
	public var localY(default, null):Float;
	
	/**
	 * The native MouseEvent generated by the browser.
	 * The properties and API for this event may differ between browsers.
	 * This property will be null if the EaselJS property was not directly generated from a native MouseEvent.
	 * Default: null
	 */
	public var nativeEvent:js.html.MouseEvent;
	
	/**
	 * The unique id for the pointer (touch point or cursor).
	 * This will be either -1 for the mouse, or the system supplied id value.
	 */
	public var pointerID:Float;
	
	/**
	 * Indicates whether this is the primary pointer in a multitouch environment.
	 * This will always be true for the mouse. For touch pointers, the first pointer in the current stack will be considered the primary pointer.
	 */
	public var primary:Bool;
	
	/**
	 * The raw x position relative to the stage.
	 * Normally this will be the same as the stageX value, unless stage.mouseMoveOutside is true and the pointer is outside of the stage bounds.
	 */
	public var rawX:Float;
	
	/**
	 * The raw y position relative to the stage.
	 * Normally this will be the same as the stageY value, unless stage.mouseMoveOutside is true and the pointer is outside of the stage bounds.
	 */
	public var rawY:Float;
	
	/**
	 * The secondary target for the event, if applicable.
	 * This is used for mouseout/ rollout events to indicate the object that the mouse entered from, rollover/ rollover for the
	 * object the mouse exited, and stagemousedown/stagemouseup events for the object that was the under the cursor, if any.
	 * 
	 * Only valid interaction targets will be returned (ie. objects with mouse listeners or a cursor set).
	 */
	public var relatedTarget:DisplayObject;
	
	/**
	 * The normalized x position on the stage.
	 * This will always be within the range 0 to stage width.
	 */
	public var stageX:Float;
	
	/**
	 * The normalized y position on the stage.
	 * This will always be within the range 0 to stage height.
	 */
	public var stageY:Float;
	
	
	
	//////////////////
	//   OVERRIDE   //
	//////////////////
	
	
	/**
	 * Returns a clone of the MouseEvent instance.
	 * @return	A clone of the object instance.
	 */
	override public function clone():MouseEvent;
	
	/**
	 * Returns a string representation of this MouseEvent.
	 * @return A string representation of the instance.
	 */
	override public function toString():String;
}