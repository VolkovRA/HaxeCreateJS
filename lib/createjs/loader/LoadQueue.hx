package createjs.loader;

import createjs.loader.LoadItem;
import createjs.loader.LoadItemObject;
import haxe.extern.EitherType;

/**
 * The LoadQueue class is the main API for preloading content.
 * LoadQueue is a load manager, which can preload either a single file, or queue of files.
 * 
 * <b>Creating a Queue</b>
 * To use LoadQueue, create a LoadQueue instance. If you want to force tag loading where possible, set the preferXHR argument to false.
 * <code>var queue = new createjs.LoadQueue(true);</code>
 * 
 * <b>Adding files and manifests</b>
 * Add files you want to load using loadFile or add multiple files at a time using a list or a manifest definition using loadManifest.
 * Files are appended to the end of the active queue, so you can use these methods as many times as you like, whenever you like.
 * <code>
 * queue.loadFile("filePath/file.jpg");
 * queue.loadFile({id:"image", src:"filePath/file.jpg"});
 * queue.loadManifest(["filePath/file.jpg", {id:"image", src:"filePath/file.jpg"}]);
 * 
 * // Use an external manifest
 * queue.loadManifest("path/to/manifest.json");
 * queue.loadManifest({src:"manifest.json", type:"manifest"});
 * </code>
 * 
 * If you pass false as the loadNow parameter, the queue will not kick of the load of the files, but it will not stop if it has already
 * been started. Call the load method to begin a paused queue. Note that a paused queue will automatically resume when new files are
 * added to it with a loadNow argument of true.
 * 
 * <b>File Types</b>
 * The file type of a manifest item is auto-determined by the file extension.
 * The pattern matching in PreloadJS should handle the majority of standard file and url formats, and works with common file extensions.
 * If you have either a non-standard file extension, or are serving the file using a proxy script, then you can pass in a type property
 * with any manifest item.
 * <code>
 * queue.loadFile({src:"path/to/myFile.mp3x", type:createjs.Types.SOUND});
 * 
 * // Note that PreloadJS will not read a file extension from the query string
 * queue.loadFile({src:"http://server.com/proxy?file=image.jpg", type:createjs.Types.IMAGE});
 * </code>
 * 
 * Supported types are include:
 *   1. BINARY: Raw binary data via XHR
 *   2. CSS: CSS files
 *   3. IMAGE: Common image formats
 *   4. JAVASCRIPT: JavaScript files
 *   5. JSON: JSON data
 *   6. JSONP: JSON files cross-domain
 *   7. MANIFEST: A list of files to load in JSON format, see AbstractLoader/loadManifest
 *   8. SOUND: Audio file formats
 *   9. SPRITESHEET: JSON SpriteSheet definitions. This will also load sub-images, and provide a SpriteSheet instance.
 *   10.SVG: SVG files
 *   11.TEXT: Text files - XHR only
 *   12.VIDEO: Video objects
 *   13.XML: XML data
 * <i>Note: Loader types used to be defined on LoadQueue, but have been moved to the Types class.</i>
 * 
 * EVENTS
 * Event.COMPLETE				The Event that is fired when the entire queue has been loaded.
 * 
 * Event.FILE_ERROR				The Event that is fired when the loader encounters an internal file load error.
 * 								This enables loaders to maintain internal queues, and surface file load errors.
 * 
 * Event.FILE_LOAD				This event is fired when an individual file has loaded, and been processed.
 * 
 * Event.FILE_START				This event is fired when an individual file starts to load.
 * 
 * Event.LOAD_START				The Event that is fired when a load starts.
 * 
 * ErrorEvent.ERROR				The ErrorEvent that is fired when the loader encounters an error.
 * 								If the error was encountered by a file, the event will contain the item that caused the error.
 * 								Prior to version 0.6.0, this was just a regular Event.
 * 
 * ProgressEvent.FILE_PROGRESS	This ProgressEvent that is fired when an an individual file's progress changes.
 * 
 * ProgressEvent.PROGRESS		The ProgressEvent that is fired when the overall progress changes.
 * 								Prior to version 0.6.0, this was just a regular Event.
 * 
 * Documentation: https://www.createjs.com/docs/preloadjs/classes/LoadQueue.html
 * @author VolkovRA
 */
@:native("createjs.LoadQueue")
extern class LoadQueue extends AbstractLoader 
{
	/**
	 * Create a new LoadQueue.
	 * @param	preferXHR	Determines whether the preload instance will favor loading with XHR (XML HTTP Requests), or HTML tags.
	 * 						When this is false, the queue will use tag loading when possible, and fall back on XHR when necessary.
	 * @param	basePath	A path that will be prepended on to the source parameter of all items in the queue before they are loaded.
	 * 						Sources beginning with a protocol such as http:// or a relative path such as ../ will not receive a base path.
	 * @param	crossOrigin	An optional flag to support images loaded from a CORS-enabled server.
	 * 						To use it, set this value to true, which will default the crossOrigin property on images to "Anonymous".
	 * 						Any string value will be passed through, but only "" and "Anonymous" are recommended.
	 * 						<b>Note: The crossOrigin parameter is deprecated. Use LoadItem.crossOrigin instead.</b>
	 */
	@:overload(function(preferXHR:Bool, basePath:String, crossOrigin:Bool):Void {})
	public function new(preferXHR:Bool = true, basePath:String = "", crossOrigin:String = "");
	
	
	
	////////////////////
	//   PROPERTIES   //
	////////////////////
	
	/**
	 * Ensure loaded scripts "complete" in the order they are specified.
	 * Loaded scripts are added to the document head once they are loaded. Scripts loaded via tags will load one-at-a-time when this
	 * property is true, whereas scripts loaded using XHR can load in any order, but will "finish" and be added to the document in
	 * the order specified.
	 * 
	 * Any items can be set to load in order by setting the MaintainOrder:property property on the load item, or by ensuring that
	 * only one connection can be open at a time using setMaxConnections. Note that when the maintainScriptOrder property is set to true,
	 * scripts items are automatically set to maintainOrder=true, and changing the maintainScriptOrder to false during a load will not
	 * change items already in a queue.
	 * 
	 * <b>Example</b>
	 * <code>
	 * var queue = new createjs.LoadQueue();
	 * queue.setMaxConnections(3); // Set a higher number to load multiple items at once
	 * queue.maintainScriptOrder = true; // Ensure scripts are loaded in order
	 * queue.loadManifest([
	 *     "script1.js",
	 *     "script2.js",
	 *     "image.png", // Load any time
	 *     {src: "image2.png", maintainOrder: true} // Will wait for script2.js
	 *     "image3.png",
	 *     "script3.js" // Will wait for image2.png before loading (or completing when loading with XHR)
	 * ]);
	 * </code>
	 * 
	 * Default: true
	 */
	public var maintainScriptOrder:Bool;
	
	/**
	 * The next preload queue to process when this one is complete.
	 * If an error is thrown in the current queue, and stopOnError is true, the next queue will not be processed.
	 * Default: null
	 */
	public var next:LoadQueue;
	
	/**
	 * Determines if the LoadQueue will stop processing the current queue when an error is encountered.
	 * Default: false
	 */
	public var stopOnError:Bool;
	
	
	
	/////////////////
	//   METHODS   //
	/////////////////
	
	/**
	 * Close the active queue.
	 * Closing a queue completely empties the queue, and prevents any remaining items from starting to download.
	 * Note that currently any active loads will remain open, and events may be processed.
	 * 
	 * To stop and restart a queue, use the setPaused method instead.
	 */
	public function close():Void;
	
	/**
	 * Look up a LoadItem using either the "id" or "src" that was specified when loading it.
	 * Note that if no "id" was supplied with the load item, the ID will be the "src", including a path property defined by a manifest.
	 * The basePath will not be part of the ID.
	 * @param	value	The id or src of the load item.
	 * @return	The load item that was initially requested using loadFile or loadManifest. This object is also returned via the fileload event as the item parameter.
	 */
	override public function getItem(value:String):EitherType<LoadItem, LoadItemObject>;
	
	/**
	 * Generate an list of items loaded by this queue.
	 * @param	loaded	Determines if only items that have been loaded should be returned. If false, in-progress and failed load items will also be included.
	 * @return	A list of objects that have been loaded. Each item includes the LoadItem, result, and rawResult.
	 */
	public function getItems(loaded:Bool):Array<EitherType<LoadItem, LoadItemObject>>;
	
	/**
	 * Register a plugin.
	 * Plugins can map to load types (sound, image, etc), or specific extensions (png, mp3, etc).
	 * Currently, only one plugin can exist per type/extension.
	 * 
	 * When a plugin is installed, a getPreloadHandlers() method will be called on it.
	 * For more information on this method, check out the getPreloadHandlers method in the SamplePlugin class.
	 * 
	 * Before a file is loaded, a matching plugin has an opportunity to modify the load.
	 * If a callback is returned from the getPreloadHandlers method, it will be invoked first, and its result may cancel or modify the item.
	 * The callback method can also return a completeHandler to be fired when the file is loaded, or a tag object, which will manage the
	 * actual download. For more information on these methods, check out the preloadHandler and fileLoadHandler methods on the SamplePlugin.
	 * @param	plugin	The plugin class to install.
	 */
	public function installPlugin(plugin:Dynamic):Void;
	
	/**
	 * Load a single file.
	 * To add multiple files at once, use the loadManifest method.
	 * 
	 * Files are always appended to the current queue, so this method can be used multiple times to add files.
	 * To clear the queue first, use the AbstractLoader/close method.
	 * @param	file		The file object or path to load. A file can be either:
	 * 						  1. A LoadItem instance.
							  2. An object containing properties defined by LoadItem.
							  3. OR A string path to a resource. Note that this kind of load item will be converted to a LoadItem in the background.
	 * @param	loadNow		Kick off an immediate load (true) or wait for a load call (false). The default value is true.
	 * 						If the queue is paused using setPaused, and the value is true, the queue will resume automatically.
	 * @param	basePath	A base path that will be prepended to each file.
	 * 						The basePath argument overrides the path specified in the constructor. Note that if you load a manifest
	 * 						using a file of type MANIFEST, its files will NOT use the basePath parameter.
	 * 						<b>The basePath parameter is deprecated.</b> This parameter will be removed in a future version.
	 * 						Please either use the basePath parameter in the LoadQueue constructor, or a path property in a manifest definition.
	 */
	@:overload(function(file:String, loadNow:Bool = true, basePath:String = null):Void {})
	@:overload(function(file:LoadItemObject, loadNow:Bool = true, basePath:String = null):Void {})
	public function loadFile(file:LoadItem, loadNow:Bool = true, basePath:String = null):Void;
	
	/**
	 * Load an array of files. To load a single file, use the loadFile method.
	 * The files in the manifest are requested in the same order, but may complete in a different order if the max
	 * connections are set above 1 using setMaxConnections.
	 * Scripts will load in the right order as long as LoadQueue/maintainScriptOrder is true (which is default).
	 * 
	 * Files are always appended to the current queue, so this method can be used multiple times to add files.
	 * To clear the queue first, use the AbstractLoader/close method.
	 * 
	 * 
	 * @param	manifest	An list of files to load.
	 * @param	loadNow		Kick off an immediate load (true) or wait for a load call (false).
	 * 						If the queue is paused using setPaused and this value is true, the queue will resume automatically.
	 * @param	basePath	A base path that will be prepended to each file.
	 * 						The basePath argument overrides the path specified in the constructor.
	 * 						Note that if you load a manifest using a file of type LoadQueue/MANIFEST:property, its files will NOT use the basePath parameter.
	 * 						<b>The basePath parameter is deprecated.</b>
	 * 						This parameter will be removed in a future version. Please either use the basePath parameter in the LoadQueue constructor, or a path property in a manifest definition.
	 */
	public function loadManifest(manifest:Manifest, loadNow:Bool = true, basePath:String = null):Void;
	
	/**
	 * Register a custom loaders class.
	 * New loaders are given precedence over loaders added earlier and default loaders.
	 * It is recommended that loaders extend AbstractLoader.
	 * Loaders can only be added once, and will be prepended to the list of available loaders.
	 * @param	loader	The AbstractLoader class to add.
	 */
	@:overload(function(loader:Dynamic):Void {})
	public function registerLoader(loader:AbstractLoader):Void;
	
	/**
	 * Stops an item from being loaded, and removes it from the queue.
	 * If nothing is passed, all items are removed. This also removes internal references to loaded item(s).
	 * <code>
	 * queue.loadManifest([
	 *     {src:"test.png", id:"png"},
	 *     {src:"test.jpg", id:"jpg"},
	 *     {src:"test.mp3", id:"mp3"}
	 * ]);
	 * queue.remove("png"); // Single item by ID
	 * queue.remove("png", "test.jpg"); // Items as arguments. Mixed id and src.
	 * queue.remove(["test.png", "jpg"]); // Items in an Array. Mixed id and src.
	 * </code>
	 * @param	idsOrUrls	The id or ids to remove from this queue. You can pass an item, an array of items, or multiple items as arguments.
	 */
	@:overload(function(idsOrUrls:Array<String>):Void {})
	public function remove(idsOrUrls:String):Void;
	
	/**
	 * Stops all queued and loading items, and clears the queue.
	 * This also removes all internal references to loaded content, and allows the queue to be used again.
	 */
	public function removeAll():Void;
	
	/**
	 * Stops all open loads, destroys any loaded items, and resets the queue, so all items can be reloaded again by calling load.
	 * Items are not removed from the queue. To remove items use the remove or removeAll method.
	 */
	public function reset():Void;
	
	/**
	 * Set the maximum number of concurrent connections.
	 * Note that browsers and servers may have a built-in maximum number of open connections, so any additional
	 * connections may remain in a pending state until the browser opens the connection.
	 * When loading scripts using tags, and when maintainScriptOrder is true, only one script is loaded at a time due to browser limitations.
	 * <code>
	 * var queue = new LoadQueue();
	 * queue.setMaxConnections(10); // Allow 10 concurrent loads
	 * </code>
	 * @param	value	The number of concurrent loads to allow. By default, only a single connection per LoadQueue is open at any time.
	 */
	public function setMaxConnections(value:Int):Void;
	
	/**
	 * Pause or resume the current load.
	 * Active loads will not be cancelled, but the next items in the queue will not be processed when active loads complete.
	 * LoadQueues are not paused by default.
	 * 
	 * Note that if new items are added to the queue using loadFile or loadManifest, a paused queue will be resumed,
	 * unless the loadNow argument is false.
	 * @param	value	Whether the queue should be paused or not.
	 */
	public function setPaused(value:Bool):Void;
	
	/**
	 * Change the PreferXHR:property value.
	 * Note that if this is set to true, it may fail, or be ignored depending on the browser's capabilities and the load type.
	 * @param	value Property value
	 * @return	The value of PreferXHR that was successfully set.
	 */
	public function setPreferXHR(value:Bool):Bool;
	
	/**
	 * Remove a custom loader added using RegisterLoader.
	 * Only custom loaders can be unregistered, the default loaders will always be available.
	 * @param	loader	The AbstractLoader class to remove.
	 */
	@:overload(function(loader:Dynamic):Void {})
	public function unregisterLoader(loader:AbstractLoader):Void;
	
	
	
	//////////////////
	//   OVERRIDE   //
	//////////////////
	
	/**
	 * Look up a loaded result using either the "id" or "src" that was specified when loading it.
	 * Note that if no "id" was supplied with the load item, the ID will be the "src", including a path property defined by a manifest.
	 * The basePath will not be part of the ID.
	 * @param	value		The id or src of the load item.
	 * @param	rawResult	Return a raw result instead of a formatted result. This applies to content loaded via XHR such as scripts, XML, CSS, and Images.
	 * 						If there is no raw result, the formatted result will be returned instead.
	 * @return	A result object containing the content that was loaded.
	 */
	override public function getResult(value:String, rawResult:Bool = false):Dynamic;
	
	/**
	 * Start a LoadQueue that was created, but not automatically started.
	 */
	override public function load():Void;
	
	/**
	 * Returns a string representation of this LoadQueue.
	 * @return A string representation of the instance.
	 */
	override public function toString():String;
}