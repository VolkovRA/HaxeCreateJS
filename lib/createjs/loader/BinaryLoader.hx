package createjs.loader;

/**
 * A loader for binary files.
 * This is useful for loading web audio, or content that requires an ArrayBuffer.
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
 * Event.LOADSTART			The Event that is fired when a load starts.
 * 
 * ProgressEvent.PROGRESS	The ProgressEvent that is fired when the overall progress changes.
 * 							Prior to version 0.6.0, this was just a regular Event.
 * 
 * ErrorEvent.ERROR			The ErrorEvent that is fired when the loader encounters an error.
 * 							If the error was encountered by a file, the event will contain the item that caused the error.
 * 							Prior to version 0.6.0, this was just a regular Event.
 * 
 * Documentation: https://www.createjs.com/docs/preloadjs/classes/BinaryLoader.html
 * @author VolkovRA
 */
@:native("createjs.BinaryLoader")
extern class BinaryLoader extends AbstractLoader 
{
	/**
	 * Create a new BinaryLoader.
	 * @param	item	The item to be loaded.
	 */
	@:overload(function(item:LoadItemObject):Void{})
	public function new(item:LoadItem);
	
	/**
	 * Determines if the loader can load a specific item.
	 * This loader can only load items that are of type BINARY
	 * @param	item	The LoadItem that a LoadQueue is trying to load.
	 * @return	Whether the loader can load the item.
	 */
	@:overload(function(item:LoadItemObject):Bool{})
	static public function canLoadItem(item:LoadItem):Bool;
}