package easeljs.events;

/**
 * EventDispatcher provides methods for managing queues of event listeners and dispatching events.
 * 
 * You can either extend EventDispatcher or mix its methods into an existing prototype or instance by
 * using the EventDispatcher initialize method.
 * 
 * Together with the CreateJS Event class, EventDispatcher provides an extended event model that is
 * based on the DOM Level 2 event model, including addEventListener, removeEventListener, and dispatchEvent.
 * It supports bubbling / capture, preventDefault, stopPropagation, stopImmediatePropagation, and handleEvent.
 * 
 * EventDispatcher also exposes a on method, which makes it easier to create scoped listeners,
 * listenersthat only run once, and listeners with associated arbitrary data. The off method is
 * merely an alias to removeEventListener.
 * 
 * Another addition to the DOM Level 2 model is the removeAllEventListeners method, which can be
 * used to listeners for all events, or listeners for a specific event. The Event object also includes
 * a remove method which removes the active listener.
 * 
 * Browser support The event model in CreateJS can be used separately from the suite in any project,
 * however the inheritance model requires modern browsers (IE9+).
 * 
 * Documentation: https://www.createjs.com/docs/easeljs/classes/EventDispatcher.html
 * @author VolkovRA
 */
@:native("createjs.EventDispatcher")
extern class EventDispatcher 
{
	/**
	 * Create a new EventDispatcher.
	 */
	public function new();
	
	/**
	 * Static initializer to mix EventDispatcher methods into a target object or prototype.
	 * @param	target The target object to inject EventDispatcher methods into. This can be an instance or a prototype.
	 */
	static public function initialize(target:Dynamic):Void;
	
	/**
	 * Adds the specified event listener.
	 * Note that adding multiple listeners to the same function will result in multiple callbacks getting fired.
	 * @param	type		The string type of the event.
	 * @param	listener	An object with a handleEvent method, or a function that will be called when the event is dispatched.
	 * @param	useCapture	For events that bubble, indicates whether to listen for the event in the capture or bubbling/target phase.
	 * @return	Returns the listener for chaining or assignment.
	 */
	public function addEventListener(type:String, listener:Listener, useCapture:Bool = false):Listener;
	
	/**
	 * Dispatches the specified event to all listeners.
	 * @param	event		An object with a "type" property, or a string type.
	 * 						While a generic object will work, it is recommended to use a CreateJS Event instance.
	 * 						If a string is used, dispatchEvent will construct an Event instance if necessary with the specified type.
	 * 						This latter approach can be used to avoid event object instantiation for non-bubbling events that may not have any listeners.
	 * @param	bubbles		Specifies the bubbles value when a string was passed to event.
	 * @param	cancelable	Specifies the cancelable value when a string was passed to event.
	 * @return	Returns false if preventDefault() was called on a cancelable event, true otherwise.
	 */
	@:overload(function(event:String, bubbles:Bool = false, cancelable:Bool = false):Bool{})
	@:overload(function(event:EventObject, bubbles:Bool = false, cancelable:Bool = false):Bool{})
	public function dispatchEvent(event:Event, bubbles:Bool = false, cancelable:Bool = false):Bool;
	
	/**
	 * Indicates whether there is at least one listener for the specified event type.
	 * @param	The string type of the event.
	 * @return	Returns true if there is at least one listener for the specified event.
	 */
	public function hasEventListener(type:String):Bool;
	
	/**
	 * A shortcut to the removeEventListener method, with the same parameters and return value.
	 * This is a companion to the .on method.
	 * IMPORTANT: To remove a listener added with on, you must pass in the returned wrapper function as the listener. See on for an example.
	 * @param	type		The string type of the event.
	 * @param	listener	The listener function or object.
	 * @param	useCapture	For events that bubble, indicates whether to listen for the event in the capture or bubbling/target phase.
	 */
	public function off(type:String, listener:Listener, useCapture:Bool = false):Void;
	
	/**
	 * A shortcut method for using addEventListener that makes it easier to specify an execution scope, have a
	 * listener only run once, associate arbitrary data with the listener, and remove the listener.
	 * 
	 * This method works by creating an anonymous wrapper function and subscribing it with addEventListener.
	 * The wrapper function is returned for use with removeEventListener (or off).
	 * 
	 * IMPORTANT: To remove a listener added with on, you must pass in the returned wrapper function as the
	 * listener, or use remove. Likewise, each time you call on a NEW wrapper function is subscribed, so
	 * multiple calls to on with the same params will create multiple listeners.
	 * @param	type		The string type of the event.
	 * @param	listener	An object with a handleEvent method, or a function that will be called when the event is dispatched.
	 * @param	scope		The scope to execute the listener in. Defaults to the dispatcher/currentTarget for function listeners,
	 * 						and to the listener itself for object listeners (ie. using handleEvent).
	 * @param	once		If true, the listener will remove itself after the first time it is triggered.
	 * @param	data		Arbitrary data that will be included as the second parameter when the listener is called.
	 * @param	useCapture	For events that bubble, indicates whether to listen for the event in the capture or bubbling/target phase.
	 * @return	Returns the anonymous function that was created and assigned as the listener.
	 * 			This is needed to remove the listener later using .removeEventListener.
	 */
	public function on(type:String, listener:Listener, scope:Dynamic = null, once:Bool = false, data:Dynamic = null, useCapture:Bool = false):ListenerCallback;
	
	/**
	 * Removes all listeners for the specified type, or all listeners of all types.
	 * @param	type The string type of the event. If omitted, all listeners for all types will be removed.
	 */
	public function removeAllEventListeners(type:String = null):Void;
	
	/**
	 * Removes the specified event listener.
	 * Important Note: that you must pass the exact function reference used when the event was added.
	 * If a proxy function, or function closure is used as the callback, the proxy/closure reference must be
	 * used - a new proxy or closure will not work.
	 * @param	type		The string type of the event.
	 * @param	listener	The listener function or object.
	 * @param	useCapture	For events that bubble, indicates whether to listen for the event in the capture or bubbling/target phase.
	 */
	public function removeEventListener(type:String, listener:Listener, useCapture:Bool = false):Void;
	
	/**
	 * Indicates whether there is at least one listener for the specified event type on this object or any of
	 * its ancestors (parent, parent's parent, etc). A return value of true indicates that if a bubbling event of
	 * the specified type is dispatched from this object, it will trigger at least one listener.
	 * 
	 * This is similar to hasEventListener, but it searches the entire event flow for a listener, not just this object.
	 * @param	type The string type of the event.
	 * @return	Returns true if there is at least one listener for the specified event.
	 */
	public function willTrigger(type:String):Bool;
	
	/**
	 * Get string representation of this EventDispatcher.
	 * @return	A string representation of the instance.
	 */
	public function toString():String;
}