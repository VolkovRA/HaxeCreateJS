package createjs.loader;

/**
 * A loader for JSON manifests.
 * Items inside the manifest are loaded before the loader completes.
 * To load manifests using JSONP, specify a callback as part of the LoadItem.
 * 
 * The list of files in the manifest must be defined on the top-level JSON object in a manifest property.
 * This example shows a sample manifest definition, as well as how to to include a sub-manifest.
 * <code>
 * {
 *     "path": "assets/",
 *     "manifest": [
 *         "image.png",
 *         {"src": "image2.png", "id":"image2"},
 *         {"src": "sub-manifest.json", "type":"manifest", "callback":"jsonCallback"}
 *     ]
 * }
 * </code>
 * 
 * When a ManifestLoader has completed loading, the parent loader (usually a LoadQueue, but could also be
 * another ManifestLoader) will inherit all the loaded items, so you can access them directly.
 * 
 * Note that the JSONLoader and JSONPLoader are higher priority loaders, so manifests <b>must</b> set the LoadItem type property to MANIFEST.
 * Additionally, some browsers require the server to serve a JavaScript mime-type for JSONP, so it may not work in some conditions.
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
 * Documentation: https://www.createjs.com/docs/preloadjs/classes/ManifestLoader.html
 * @author VolkovRA
 */
@:native("createjs.ManifestLoader")
extern class ManifestLoader extends AbstractLoader 
{
	/**
	 * Create a new ManifestLoader.
	 * @param	item		The item to be loaded.
	 */
	@:overload(function(item:LoadItemObject):Void{})
	public function new(item:LoadItem);
	
	/**
	 * Determines if the loader can load a specific item.
	 * This loader can only load items that are of type MANIFEST.
	 * @param	item	The LoadItem that a LoadQueue is trying to load.
	 * @return	Whether the loader can load the item.
	 */
	@:overload(function(item:LoadItemObject):Bool{})
	static public function canLoadItem(item:LoadItem):Bool;
}