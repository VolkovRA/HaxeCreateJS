package createjs.events;

/**
 * A general error Event, that describes an error that occurred, as well as any details.
 * Documentation: https://www.createjs.com/docs/preloadjs/classes/ErrorEvent.html
 * @author VolkovRA
 */
@:native("createjs.ErrorEvent")
extern class ErrorEvent extends Event 
{
	/**
	 * Create a new ErrorEvent.
	 * @param	title	The error title.
	 * @param	message	The error description.
	 * @param	data	Additional error data.
	 */
	public function new(title:String = null, message:String = null, data:Dynamic = null);
	
	
	
	////////////////
	//   STATIC   //
	////////////////
	
	/**
	 * The `Event.ERROR` constant defines the value of the `type` property of an `error` Event object.
	 */
	public static inline var ERROR:String = "error";
	
	
	
	////////////////////
	//   PROPERTIES   //
	////////////////////
	
	/**
	 * Additional data attached to an error.
	 */
	public var data:Dynamic;
	
	/**
	 * The verbose error message, containing details about the error.
	 */
	public var message:String;
	
	/**
	 * The short error title, which indicates the type of error that occurred.
	 */
	public var title:String;
	
	
	
	/////////////////
	//   METHODS   //
	/////////////////
	
	/**
	 * Returns a clone of the ErrorEvent instance.
	 * @return	A clone of the object instance.
	 */
	override public function clone():ErrorEvent;
}