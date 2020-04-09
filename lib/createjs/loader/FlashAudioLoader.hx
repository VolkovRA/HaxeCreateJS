package createjs.loader;

/**
 * Loader provides a mechanism to preload Flash content via PreloadJS or internally.
 * Instances are returned to the preloader, and the load method is called when the asset needs to be requested.
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
 * Documentation: https://www.createjs.com/docs/soundjs/classes/FlashAudioLoader.html
 * @author VolkovRA
 */
@:native("createjs.FlashAudioLoader")
extern class FlashAudioLoader extends AbstractLoader 
{
	/**
	 * Create a new FlashAudioLoader.
	 * @param	item The item to be loaded.
	 */
	@:overload(function(item:LoadItemObject):Void{})
	public function new(item:LoadItem);
	
	/**
	 * ID used to facilitate communication with flash.
	 * Not doc'd because this should not be altered externally
	 */
	public var flashId:String;
	
	/**
	 * Set the Flash instance on the class, and start loading on any instances that had load called before flash was ready.
	 * @param	flash Flash instance that handles loading and playback.
	 */
	public function setFlash(flash:Dynamic):Void;
	
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
	override public function load():Void;
	
	/**
	 * Clean up the loader.
	 */
	override public function destroy():Void;
	
	/**
	 * Returns a string representation of this FlashAudioLoader.
	 * @return A string representation of the instance.
	 */
	override public function toString():String;
}