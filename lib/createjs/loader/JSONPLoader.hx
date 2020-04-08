package createjs.loader;

/**
 * A loader for JSONP files, which are JSON-formatted text files, wrapped in a callback.
 * To load regular JSON without a callback use the JSONLoader instead.
 * To load JSON-formatted manifests, use ManifestLoader, and to load EaselJS SpriteSheets, use SpriteSheetLoader.
 * 
 * JSONP is a format that provides a solution for loading JSON files cross-domain without requiring CORS.
 * JSONP files are loaded as JavaScript, and the "callback" is executed once they are loaded.
 * The callback in the JSONP must match the callback passed to the loadItem.
 * 
 * Example JSONP
 * <code>
 * callbackName({
 *     "name": "value",
 *     "num": 3,
 *     "obj": { "bool":true }
 *  });
 * </code>
 * 
 * Example
 * <code>
 * var loadItem = {id:"json", type:"jsonp", src:"http://server.com/text.json", callback:"callbackName"}
 * var queue = new LoadQueue();
 * queue.on("complete", handleComplete);
 * queue.loadItem(loadItem);
 * 
 * function handleComplete(event) {
 *     var json = queue.getResult("json");
 *     trace(json.obj.bool); // true
 * }
 * </code>
 * 
 * JSONP files loaded concurrently require a unique callback. To ensure JSONP files are loaded in order, either
 * use the setMaxConnections method (set to 1), or set maintainOrder on items with the same callback.
 * 
 * Important note: Some browsers will prevent JSONP from firing the callback if the file was loaded as JSON, and
 * not JavaScript. You may have to have your server give you a JavaScript mime-type for this to work.
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
 * Documentation: https://www.createjs.com/docs/preloadjs/classes/JSONPLoader.html
 * @author VolkovRA
 */
@:native("createjs.JSONPLoader")
extern class JSONPLoader extends AbstractLoader 
{
	/**
	 * Create a new JSONPLoader.
	 * @param	item		The item to be loaded.
	 */
	@:overload(function(item:LoadItemObject):Void{})
	public function new(item:LoadItem);
	
	/**
	 * Determines if the loader can load a specific item.
	 * This loader can only load items that are of type JSONP.
	 * @param	item	The LoadItem that a LoadQueue is trying to load.
	 * @return	Whether the loader can load the item.
	 */
	@:overload(function(item:LoadItemObject):Bool{})
	static public function canLoadItem(item:LoadItem):Bool;
}