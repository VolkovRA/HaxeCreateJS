package createjs.events;

import createjs.sheet.Frame;
import createjs.loader.AbstractLoader;

/**
 * Contains properties and methods shared by all events for use with EventDispatcher.
 * Note that Event objects are often reused, so you should never rely on an event object's state outside of the call stack it was received in.
 * Documentation: https://www.createjs.com/docs/easeljs/classes/Event.html
 * @author VolkovRA
 */
@:native("createjs.Event")
extern class Event 
{
	/**
	 * Create a new Event.
	 * @param	type		The event type.
	 * @param	bubbles		Indicates whether the event will bubble through the display list.
	 * @param	cancelable	Indicates whether the default behaviour of this event can be cancelled.
	 */
	public function new(type:String, bubbles:Bool = false, cancelable:Bool = false);
	
	
	
	////////////////
	//   STATIC   //
	////////////////
	
	/**
	 * The `Event.ADDED` constant defines the value of the `type` property of an `added` Event object.
	 */
	public static inline var ADDED:String = "added";
	
	/**
	 * The `Event.REMOVED` constant defines the value of the `type` property of an `removed` Event object.
	 */
	public static inline var REMOVED:String = "removed";
	
	/**
	 * The `Event.CHANGE` constant defines the value of the `type` property of an `change` Event object.
	 */
	public static inline var CHANGE:String = "change";
	
	/**
	 * The `Event.SELECT` constant defines the value of the `type` property of an `select` Event object.
	 */
	public static inline var SELECT:String = "select";
	
	/**
	 * The `Event.SELECT_ALL` constant defines the value of the `type` property of an `selectAll` Event object.
	 */
	public static inline var SELECT_ALL:String = "selectAll";
	
	/**
	 * The `Event.CANCEL` constant defines the value of the `type` property of an `cancel` Event object.
	 */
	public static inline var CANCEL:String = "cancel";
	
	/**
	 * The `Event.CLEAR` constant defines the value of the `type` property of an `clear` Event object.
	 */
	public static inline var CLEAR:String = "clear";
	
	/**
	 * The `Event.CLOSE` constant defines the value of the `type` property of an `close` Event object.
	 */
	public static inline var CLOSE:String = "close";
	
	/**
	 * The `Event.CLOSING` constant defines the value of the `type` property of an `closing` Event object.
	 */
	public static inline var CLOSING:String = "closing";
	
	/**
	 * The `Event.COPY` constant defines the value of the `type` property of an `copy` Event object.
	 */
	public static inline var COPY:String = "copy";
	
	/**
	 * The `Event.CUT` constant defines the value of the `type` property of an `cut` Event object.
	 */
	public static inline var CUT:String = "cut";
	
	/**
	 * The `Event.PASTE` constant defines the value of the `type` property of an `paste` Event object.
	 */
	public static inline var PASTE:String = "paste";
	
	/**
	 * The `Event.INIT` constant defines the value of the `type` property of an `init` Event object.
	 */
	public static inline var INIT:String = "init";
	
	/**
	 * The `Event.OPEN` constant defines the value of the `type` property of an `open` Event object.
	 */
	public static inline var OPEN:String = "open";
	
	/**
	 * The `Event.RESIZE` constant defines the value of the `type` property of an `resize` Event object.
	 */
	public static inline var RESIZE:String = "resize";
	
	/**
	 * The `Event.SCROLL` constant defines the value of the `type` property of an `scroll` Event object.
	 */
	public static inline var SCROLL:String = "scroll";
		
	/**
	 * The `Event.DRAW_START` constant defines the value of the `type` property of an `drawstart` Event object.
	 */
	public static inline var DRAW_START:String = "drawstart";
	
	/**
	 * The `Event.DRAW_END` constant defines the value of the `type` property of an `drawend` Event object.
	 */
	public static inline var DRAW_END:String = "drawend";
	
	/**
	 * The `Event.COMPLETE` constant defines the value of the `type` property of an `complete` Event object.
	 */
	public static inline var COMPLETE:String = "complete";
	
	/**
	 * The `Event.GET_FRAME` constant defines the value of the `type` property of an `getframe` Event object.
	 */
	public static inline var GET_FRAME:String = "getframe";
	
	/**
	 * The `Event.PROGRESS` constant defines the value of the `type` property of an `progress` Event object.
	 * <b>Be careful, the ProgressEvent hase same value.</b>
	 * See: https://stackoverflow.com/questions/61089271/createjs-and-two-similar-progress-event-type
	 */
	public static inline var PROGRESS:String = "progress";
	
	/**
	 * The `Event.ANIMATION_END` constant defines the value of the `type` property of an `animationend` Event object.
	 */
	public static inline var ANIMATION_END:String = "animationend";
	
	/**
	 * The `Event.TICK` constant defines the value of the `type` property of an `tick` Event object.
	 */
	public static inline var TICK:String = "tick";
	
	/**
	 * The `Event.TICK_START` constant defines the value of the `type` property of an `tickstart` Event object.
	 */
	public static inline var TICK_START:String = "tickstart";
	
	/**
	 * The `Event.TICK_END` constant defines the value of the `type` property of an `tickend` Event object.
	 */
	public static inline var TICK_END:String = "tickend";
	
	/**
	 * The `Event.UNLOAD` constant defines the value of the `type` property of an `unload` Event object.
	 */
	public static inline var UNLOAD:String = "unload";
	
	/**
	 * The `Event.FILE_START` constant defines the value of the `type` property of an `filestart` Event object.
	 */
	public static inline var FILE_START:String = "filestart";
	
	/**
	 * The `Event.FILE_ERROR` constant defines the value of the `type` property of an `fileerror` Event object.
	 */
	public static inline var FILE_ERROR:String = "fileerror";
	
	/**
	 * The `Event.FILE_LOAD` constant defines the value of the `type` property of an `fileload` Event object.
	 */
	public static inline var FILE_LOAD:String = "fileload";
	
	/**
	 * The `Event.INITIALIZE` constant defines the value of the `type` property of an `initialize` Event object.
	 */
	public static inline var INITIALIZE:String = "initialize";
	
	/**
	 * The `Event.LOAD_START` constant defines the value of the `type` property of an `loadstart` Event object.
	 */
	public static inline var LOAD_START:String = "loadstart";
	
	/**
	 * The `Event.TIMEOUT` constant defines the value of the `type` property of an `timeout` Event object.
	 */
	public static inline var TIMEOUT:String = "timeout";
	
	/**
	 * The `Event.FAILED` constant defines the value of the `type` property of an `failed` Event object.
	 */
	public static inline var FAILED:String = "failed";
	
	/**
	 * The `Event.INTERRUPTED` constant defines the value of the `type` property of an `interrupted` Event object.
	 */
	public static inline var INTERRUPTED:String = "interrupted";
		
	/**
	 * The `Event.LOOP` constant defines the value of the `type` property of an `loop` Event object.
	 */
	public static inline var LOOP:String = "loop";
	
	/**
	 * The `Event.SUCCEEDED` constant defines the value of the `type` property of an `succeeded` Event object.
	 */
	public static inline var SUCCEEDED:String = "succeeded";
	
	
	
	////////////////////
	//   PROPERTIES   //
	////////////////////
	
	/**
	 * The type of event.
	 */
	public var type:String;
	
	/**
	 * Indicates whether the event will bubble through the display list.
	 * Default: false
	 */
	public var bubbles(default, null):Bool;
	
	/**
	 * Indicates whether the default behaviour of this event can be cancelled via preventDefault.
	 * This is set via the Event constructor.
	 * Default: false
	 */
	public var cancelable(default, null):Bool;
	
	/**
	 * The object that generated an event.
	 * Default: null
	 */
	public var target(default, null):Any;
	
	/**
	 * The current target that a bubbling event is being dispatched from. For non-bubbling events, this will always be
	 * the same as target. For example, if childObj.parent = parentObj, and a bubbling event is generated from childObj,
	 * then a listener on parentObj would receive the event with target=childObj (the original target) and
	 * currentTarget=parentObj (where the listener was added).
	 * Default: null
	 */
	public var currentTarget(default, null):Any;
	
	/**
	 * Indicates if preventDefault has been called on this event.
	 * Default: false
	 */
	public var defaultPrevented(default, null):Bool;
	
	/**
	 * For bubbling events, this indicates the current event phase.
	 * Default: 0
	 */
	public var eventPhase(default, null):EventPhase;
	
	/**
	 * Indicates if stopImmediatePropagation has been called on this event.
	 * Default: false
	 */
	public var immediatePropagationStopped(default, null):Bool;
	
	/**
	 * Indicates if stopPropagation or stopImmediatePropagation has been called on this event.
	 * Default: false
	 */
	public var propagationStopped(default, null):Bool;
	
	/**
	 * Indicates if remove has been called on this event.
	 * Default: false
	 */
	public var removed(default, null):Bool;
	
	/**
	 * The epoch time at which this event was created.
	 * Default: 0
	 */
	public var timeStamp(default, null):Float;
	
	
	
	///////////////////////////
	//   EXTEND PROPERTIES   //
	///////////////////////////
	
	/**
	 * The source of data.
	 * Default: null
	 */
	public var src:String;
	
	/**
	 * The index value.
	 * Default: null
	 */
	public var index:Int;
	
	/**
	 * The Frame.
	 * Default: null
	 */
	public var frame:Frame;
	
	/**
	 * The progress value.
	 * Default: null
	 */
	public var progress:Float;
	
	/**
	 * The name value.
	 * Default: null
	 */
	public var name:String;
	
	/**
	 * The next value.
	 * Default: null
	 */
	public var next:String;
	
	/**
	 * The paused value.
	 * Default: null
	 */
	public var paused:Bool;
	
	/**
	 * The delta value.
	 * Default: null
	 */
	public var delta:Float;
	
	/**
	 * The time value.
	 * Default: null
	 */
	public var time:Float;
	
	/**
	 * The runTime value.
	 * Default: null
	 */
	public var runTime:Float;
	
	/**
	 * The params value.
	 * Default: null
	 */
	public var params:Dynamic;
	
	/**
	 * The item.
	 * Default: null
	 */
	public var item:Dynamic;
	
	/**
	 * The result data.
	 * Default: null
	 */
	public var result:Dynamic;
	
	/**
	 * The raw result data.
	 * Default: null
	 */
	public var rawResult:Dynamic;
	
	/**
	 * The loader.
	 * Default: null
	 */
	public var loader:AbstractLoader;
	
	
	
	/////////////////
	//   METHODS   //
	/////////////////
	
	/**
	 * Sets defaultPrevented to true if the event is cancelable.
	 * Mirrors the DOM level 2 event standard. In general, cancelable events that have preventDefault()
	 * called will cancel the default behaviour associated with the event.
	 */
	public function preventDefault():Void;
	
	/**
	 * Causes the active listener to be removed via removeEventListener().
	 */
	public function remove():Void;
	
	/**
	 * Provides a chainable shortcut method for setting a number of properties on the instance. (Chainable)
	 * @param	properties A generic object containing properties to copy to the instance.
	 * @return	Returns the instance the method is called on (useful for chaining calls.)
	 */
	public function set(properties:Dynamic):Event;
	
	/**
	 * Sets propagationStopped and immediatePropagationStopped to true. Mirrors the DOM event standard.
	 */
	public function stopImmediatePropagation():Void;
	
	/**
	 * Sets propagationStopped to true. Mirrors the DOM event standard.
	 */
	public function stopPropagation():Void;
	
	/**
	 * Returns a clone of the Event instance.
	 * @return	A clone of the object instance.
	 */
	public function clone():Event;
	
	/**
	 * Returns a string representation of this Event.
	 * @return	A string representation of the instance.
	 */
	public function toString():String;
}