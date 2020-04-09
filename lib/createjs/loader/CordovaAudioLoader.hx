package createjs.loader;

/**
 * Loader provides a mechanism to preload Cordova audio content via PreloadJS or internally.
 * Instances are returned to the preloader, and the load method is called when the asset needs to be requested.
 * Currently files are assumed to be local and no loading actually takes place.
 * This class exists to more easily support the existing architecture.
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
 * Documentation: https://www.createjs.com/docs/soundjs/classes/CordovaAudioLoader.html
 * @author VolkovRA
 */
@:native("createjs.CordovaAudioLoader")
extern class CordovaAudioLoader extends AbstractLoader 
{
	/**
	 * Create a new CordovaAudioLoader.
	 * @param	item The item to be loaded.
	 */
	@:overload(function(item:LoadItemObject):Void{})
	public function new(item:LoadItem);
	
	/**
	 * Returns a string representation of this CordovaAudioLoader.
	 * @return A string representation of the instance.
	 */
	override public function toString():String;
}