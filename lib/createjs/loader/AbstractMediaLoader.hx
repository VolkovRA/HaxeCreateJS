package createjs.loader;

/**
 * The AbstractMediaLoader is a base class that handles some of the shared methods and properties of
 * loaders that handle HTML media elements, such as Video and Audio.
 * 
 * EVENTS
 * Event.COMPLETE			The Event that is fired when the entire queue has been loaded.
 * 
 * Event.FILE_ERROR			The Event that is fired when the loader encounters an internal file load error.
 * 							This enables loaders to maintain internal queues, and surface file load errors.
 * 
 * Event.FILE_LOAD			The Event that is fired when a loader internally loads a file.
 * 							This enables loaders such as ManifestLoader to maintain internal LoadQueues and notify when they have loaded a file.
 * 							The LoadQueue class dispatches a slightly different fileload event.
 * 
 * Event.INITIALIZE			The Event that is fired after the internal request is created, but before a load.
 * 							This allows updates to the loader for specific loading needs, such as binary or XHR image loading.
 * 
 * Event.LOAD_START			The Event that is fired when a load starts.
 * 
 * ProgressEvent.PROGRESS	The ProgressEvent that is fired when the overall progress changes.
 * 							Prior to version 0.6.0, this was just a regular Event.
 * 
 * ErrorEvent.ERROR			The ErrorEvent that is fired when the loader encounters an error.
 * 							If the error was encountered by a file, the event will contain the item that caused the error.
 * 							Prior to version 0.6.0, this was just a regular Event.
 * 
 * Documentation: https://www.createjs.com/docs/preloadjs/classes/AbstractMediaLoader.html
 * @author VolkovRA
 */
@:native("createjs.AbstractMediaLoader")
extern class AbstractMediaLoader extends AbstractLoader 
{
	/**
	 * Create a new AbstractMediaLoader.
	 * @param	item		The item to be loaded.
	 * @param	preferXHR	Whether the loader will try and load content using XHR (true) or HTML tags (false).
	 * @param	type		The type of item this loader will load.
	 */
	@:overload(function(item:LoadItemObject, preferXHR:Bool, type:Type):Void{})
	public function new(item:LoadItem, preferXHR:Bool, type:Type);
	
	/**
	 * Returns a string representation of this AbstractMediaLoader.
	 * @return A string representation of the instance.
	 */
	override public function toString():String;
}