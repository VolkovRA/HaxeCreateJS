package createjs.events;

/**
 * A CreateJS Event that is dispatched when progress changes.
 * Documentation: https://www.createjs.com/docs/preloadjs/classes/ProgressEvent.html
 * @author VolkovRA
 */
@:native("createjs.ProgressEvent")
extern class ProgressEvent extends Event 
{
	/**
	 * Create a new ProgressEvent.
	 * @param	loaded	The amount that has been loaded. This can be any number relative to the total.
	 * @param	total	The total amount that will load. This will default to 1, so if the loaded value is a percentage (between 0 and 1), it can be omitted.
	 */
	public function new(loaded:Float, total:Float = 1);
	
	
	
	////////////////
	//   STATIC   //
	////////////////
	
	/**
	 * The `ProgressEvent.PROGRESS` constant defines the value of the `type` property of an `progress` Event object.
	 */
	public static inline var PROGRESS:String = "progress";
	
	/**
	 * The `ProgressEvent.FILE_PROGRESS` constant defines the value of the `type` property of an `fileprogress` Event object.
	 */
	public static inline var FILE_PROGRESS:String = "fileprogress";
	
	
	////////////////////
	//   PROPERTIES   //
	////////////////////
	
	/**
	 * The amount that has been loaded (out of a total amount)
	 */
	public var loaded:Float;
	
	/**
	 * The percentage (out of 1) that the load has been completed.
	 * This is calculated using loaded/total.
	 * Default: 0
	 */
	//public var progress:Float; // <-- This base Event already has this property, because SpriteSheetBuilder fire simple Event.PROGRESS. See: https://stackoverflow.com/questions/61089271/createjs-and-two-similar-progress-event-type
	
	/**
	 * The total "size" of the load.
	 * Default: 1
	 */
	public var total:Float;
	
	
	
	/////////////////
	//   METHODS   //
	/////////////////
	
	/**
	 * Returns a clone of the ProgressEvent instance.
	 * @return	A clone of the Event instance.
	 */
	override public function clone():ProgressEvent;
}