package easeljs;

/**
 * The Ticker provides a centralized tick or heartbeat broadcast at a set interval.
 * Listeners can subscribe to the tick event to be notified when a set time interval has elapsed.
 * 
 * Note that the interval that the tick event is called is a target interval, and may be broadcast
 * at a slower interval when under high CPU load. The Ticker class uses a static interface
 * (ex. Ticker.framerate = 30;) and can not be instantiated.
 * 
 * EVENTS
 * TickEvent.TICK		Dispatched each tick. 
 * 						The event will be dispatched to each listener even when the Ticker has been paused using paused.
 * 
 * Documentation: https://www.createjs.com/docs/easeljs/classes/Ticker.html
 * @author VolkovRA
 */
@:native("createjs.Ticker")
extern class Ticker 
{
	/**
	 * Indicates the target frame rate in frames per second (FPS).
	 * Effectively just a shortcut to interval, where framerate == 1000/interval.
	 */
	static public var framerate:Float;
	
	/**
	 * Indicates the target time (in milliseconds) between ticks.
	 * Default is 50 (20 FPS). Note that actual time between ticks may be more than
	 * specified depending on CPU load. This property is ignored if the ticker is using the RAF timing mode.
	 */
	static public var interval:Float;
	
	/**
	 * Specifies a maximum value for the delta property in the tick event object.
	 * This is useful when building time based animations and systems to prevent issues caused by large
	 * time gaps caused by background tabs, system sleep, alert dialogs, or other blocking routines.
	 * Double the expected frame duration is often an effective value (ex. maxDelta=50 when running at 40fps).
	 * 
	 * This does not impact any other values (ex. time, runTime, etc), so you may experience issues if you
	 * enable maxDelta when using both delta and other values.
	 * 
	 * If 0, there is no maximum.
	 * Default: 0
	 */
	static public var maxDelta:Float;
	
	/**
	 * When the ticker is paused, all listeners will still receive a tick event, but the paused property of the event will be true.
	 * Also, while paused the runTime will not increase. See tick, getTime, and getEventTime for more info.
	 * Default: false
	 */
	static public var paused:Bool;
	
	/**
	 * Specifies the timing api (setTimeout or requestAnimationFrame) and mode to use.
	 * See TimingMode.TIMEOUT, TimingMode.RAF, and TimingMode.RAF_SYNCHED for mode details.
	 * Default: TimingMode.TIMEOUT
	 */
	static public var timingMode:TimingMode;
	
	/**
	 * Similar to the getTime method, but returns the time on the most recent tick event object.
	 * @param	runTime If true, the runTime property will be returned instead of time.
	 * @return	The time or runTime property from the most recent tick event or -1.
	 */
	static public function getEventTime(runTime:Bool = false):Float;
	
	/**
	 * Returns the actual frames / ticks per second.
	 * @param	ticks The number of previous ticks over which to measure the actual frames / ticks per second. Defaults to the number of ticks per second.
	 * @return	The actual frames / ticks per second. Depending on performance, this may differ from the target frames per second.
	 */
	static public function getMeasuredFPS(?ticks:Float):Float;
	
	/**
	 * Returns the average time spent within a tick.
	 * This can vary significantly from the value provided by getMeasuredFPS because it only measures
	 * the time spent within the tick execution stack.
	 * 
	 * Example 1: With a target FPS of 20, getMeasuredFPS() returns 20fps, which indicates an average
	 * of 50ms between the end of one tick and the end of the next. However, getMeasuredTickTime() returns 15ms.
	 * This indicates that there may be up to 35ms of "idle" time between the end of one tick and the start of the next.
	 * 
	 * Example 2: With a target FPS of 30, framerate returns 10fps, which indicates an average of 100ms between the
	 * end of one tick and the end of the next. However, getMeasuredTickTime returns 20ms. This would indicate that
	 * something other than the tick is using ~80ms (another script, DOM rendering, etc).
	 * @param	ticks The number of previous ticks over which to measure the average time spent in a tick. Defaults to the number of ticks per second. To get only the last tick's time, pass in 1.
	 * @return	The average time spent in a tick in milliseconds.
	 */
	static public function getMeasuredTickTime(?ticks:Float):Float;
	
	/**
	 * Returns the number of ticks that have been broadcast by Ticker.
	 * @param	pauseable	Indicates whether to include ticks that would have been broadcast while Ticker was paused.
	 * 						If true only tick events broadcast while Ticker is not paused will be returned. If false, tick events
	 * 						that would have been broadcast while Ticker was paused will be included in the return value.
	 * 						The default value is false.
	 * @return	Number of ticks that have been broadcast.
	 */
	static public function getTicks(pauseable:Bool):Float;
	
	/**
	 * Returns the number of milliseconds that have elapsed since Ticker was initialized via {{#crossLink "Ticker/init"}}.
	 * Returns -1 if Ticker has not been initialized. For example, you could use this in a time synchronized animation to
	 * determine the exact amount of time that has elapsed.
	 * @param	runTime 	If true only time elapsed while Ticker was not paused will be returned.
	 * 						If false, the value returned will be total time elapsed since the first tick event listener was added.
	 * @return	Number of milliseconds that have elapsed since Ticker was initialized or -1.
	 */
	static public function getTime(runTime:Bool = false):Float;
	
	/**
	 * Starts the tick.
	 * This is called automatically when the first listener is added.
	 */
	static public function init():Void;
	
	/**
	 * Stops the Ticker and removes all listeners.
	 * Use init() to restart the Ticker.
	 */
	static public function reset():Void;
	
	
	
	////////////////////////////////////////
	//   INCLUDED FROM EVENT DISPATCHER   //
	////////////////////////////////////////
	
	/**
	 * Adds the specified event listener.
	 * Note that adding multiple listeners to the same function will result in multiple callbacks getting fired.
	 * @param	type		The string type of the event.
	 * @param	listener	An object with a handleEvent method, or a function that will be called when the event is dispatched.
	 * @param	useCapture	For events that bubble, indicates whether to listen for the event in the capture or bubbling/target phase.
	 * @return	Returns the listener for chaining or assignment.
	 */
	static public function addEventListener(type:String, listener:Listener, useCapture:Bool = false):Listener;
	
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
	static public function on(type:String, listener:Listener, scope:Dynamic = null, once:Bool = false, data:Dynamic = null, useCapture:Bool = false):ListenerCallback;
	
	/**
	 * Removes the specified event listener.
	 * Important Note: that you must pass the exact function reference used when the event was added.
	 * If a proxy function, or function closure is used as the callback, the proxy/closure reference must be
	 * used - a new proxy or closure will not work.
	 * @param	type		The string type of the event.
	 * @param	listener	The listener function or object.
	 * @param	useCapture	For events that bubble, indicates whether to listen for the event in the capture or bubbling/target phase.
	 */
	static public function removeEventListener(type:String, listener:Listener, useCapture:Bool = false):Void;
	
	/**
	 * Removes all listeners for the specified type, or all listeners of all types.
	 * @param	type The string type of the event. If omitted, all listeners for all types will be removed.
	 */
	static public function removeAllEventListeners(type:String = null):Void;
	
	/**
	 * Indicates whether there is at least one listener for the specified event type.
	 * @param	The string type of the event.
	 * @return	Returns true if there is at least one listener for the specified event.
	 */
	static public function hasEventListener(type:String):Bool;
	
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
	static public function dispatchEvent(event:Event, bubbles:Bool = false, cancelable:Bool = false):Bool;
	
	/**
	 * Indicates whether there is at least one listener for the specified event type on this object or any of
	 * its ancestors (parent, parent's parent, etc). A return value of true indicates that if a bubbling event of
	 * the specified type is dispatched from this object, it will trigger at least one listener.
	 * 
	 * This is similar to hasEventListener, but it searches the entire event flow for a listener, not just this object.
	 * @param	type The string type of the event.
	 * @return	Returns true if there is at least one listener for the specified event.
	 */
	static public function willTrigger(type:String):Bool;
	
	
	
	////////////////////
	//   DEPRECATED   //  
	////////////////////
	
	/**
	 * Use the framerate property instead.
	 */
	@:deprecated
	static public function getFPS():Float;
	
	/**
	 * Use the interval property instead.
	 */
	@:deprecated
	static public function getInterval():Float;
	
	/**
	 * Use the framerate property instead.
	 * @param	value Frames per second. (FPS)
	 */
	@:deprecated
	static public function setFPS(value:Float):Void;
	
	/**
	 * Use the interval property instead.
	 * @param	value Indicates the target time (in milliseconds) between ticks.
	 */
	@:deprecated
	static public function setInterval(value:Float):Void;
}