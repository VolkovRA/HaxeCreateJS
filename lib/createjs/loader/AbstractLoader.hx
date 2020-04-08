package createjs.loader;

import createjs.events.EventDispatcher;
import haxe.extern.EitherType;
import js.html.Element;
import js.lib.Function;

/**
 * The base loader, which defines all the generic methods, properties, and events.
 * All loaders extend this class, including the LoadQueue.
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
 * Documentation: https://www.createjs.com/docs/preloadjs/classes/AbstractLoader.html
 * @author VolkovRA
 */
@:native("createjs.AbstractLoader")
extern class AbstractLoader extends EventDispatcher 
{
	/**
	 * Create a new AbstractLoader.
	 * @param	item		The item to be loaded.
	 * @param	preferXHR	Whether the loader will try and load content using XHR (true) or HTML tags (false).
	 * @param	type		The type of item this loader will load.
	 */
	@:overload(function(item:LoadItemObject, preferXHR:Bool, type:Type):Void{})
	public function new(item:LoadItem, preferXHR:Bool, type:Type);
	
	
	
	////////////////////
	//   PROPERTIES   //
	////////////////////
	
	/**
	 * Determine if the loader was canceled.
	 * Canceled loads will not fire complete events.
	 * Note that this property is readonly, so LoadQueue queues should be closed using close instead.
	 * Default: false
	 */
	public var canceled(default, null):Bool;
	
	/**
	 * If the loader has completed loading.
	 * This provides a quick check, but also ensures that the different approaches used for loading do
	 * not pile up resulting in more than one complete Event.
	 * Default: false
	 */
	public var loaded:Bool;
	
	/**
	 * The current load progress (percentage) for this item. This will be a number between 0 and 1.
	 * <code>
	 * var queue = new LoadQueue();
	 * queue.loadFile("largeImage.png");
	 * queue.on("progress", function() {
	 *     console.log("Progress:", queue.progress, event.progress);
	 * });
	 * </code>
	 * Default: 0
	 */
	public var progress:Float;
	
	/**
	 * A formatter function that converts the loaded raw result into the final result.
	 * For example, the JSONLoader converts a string of text into a JavaScript object. Not all loaders have a resultFormatter,
	 * and this property can be overridden to provide custom formatting.
	 * 
	 * Optionally, a resultFormatter can return a callback function in cases where the formatting needs to be asynchronous,
	 * such as creating a new image. The callback function is passed 2 parameters, which are callbacks to handle success and
	 * error conditions in the resultFormatter. Note that the resultFormatter method is called in the current scope, as well
	 * as the success and error callbacks.
	 * 
	 * <code>
	 * function _formatResult(loader) {
	 *     return function(success, error) {
	 *         if (errorCondition) { error(errorDetailEvent); }
	 *         success(result);
	 *     }
	 * }
	 * </code>
	 * 
	 * A custom result formatter function, which is called just before a request dispatches its complete event.
	 * Most loader types already have an internal formatter, but this can be user-overridden for custom formatting.
	 * The formatted result will be available on Loaders using GetResult, and passing true.
	 * 
	 * Default: null
	 */
	public var resultFormatter:AbstractLoader->EitherType<Dynamic, Function>;
	
	/**
	 * The type of item this loader will load.
	 */
	public var type:Type;
	
	
	
	/////////////////
	//   METHODS   //
	/////////////////
	
	/**
	 * Close the the item.
	 * This will stop any open requests (although downloads using HTML tags may still continue in the background),
	 * but events will not longer be dispatched.
	 */
	public function cancel():Void;
	
	/**
	 * Clean up the loader.
	 */
	public function destroy():Void;
	
	/**
	 * Get a reference to the manifest item that is loaded by this loader.
	 * In some cases this will be the value that was passed into LoadQueue using loadFile or loadManifest.
	 * However if only a String path was passed in, then it will be a LoadItem.
	 * @return	The manifest item that this loader is responsible for loading.
	 */
	public function getItem():Dynamic;
	
	/**
	 * Get any items loaded internally by the loader.
	 * The enables loaders such as ManifestLoader to expose items it loads internally.
	 * @return	A list of the items loaded by the loader.
	 */
	public function getLoadedItems():Array<Dynamic>;
	
	/**
	 * Get a reference to the content that was loaded by the loader (only available after the Complete:event event is dispatched.
	 * @param	raw	Determines if the returned result will be the formatted content, or the raw loaded data (if it exists).
	 * @return	A reference to the content that was loaded by the loader.
	 */
	public function getResult(raw:Bool = false):Dynamic;
	
	/**
	 * Return the tag this object creates or uses for loading.
	 * @return	The tag instance
	 */
	public function getTag():Element;
	
	/**
	 * Begin loading the item.
	 * This method is required when using a loader by itself.
	 * <code>
	 * var queue = new LoadQueue();
	 * queue.on("complete", handleComplete);
	 * queue.loadManifest(fileArray, false); // Note the 2nd argument that tells the queue not to start loading yet
	 * queue.load();
	 * </code>
	 */
	public function load():Void;
	
	/**
	 * Set the tag this item uses for loading.
	 * @param	tag	The tag instance
	 */
	public function setTag(tag:Element):Void;
	
	
	
	//////////////////
	//   OVERRIDE   //
	//////////////////
	
	/**
	 * Returns a string representation of this AbstractLoader.
	 * @return A string representation of the instance.
	 */
	override public function toString():String;
}