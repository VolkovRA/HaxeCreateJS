package createjs.loader;

/**
 * A loader for EaselJS SpriteSheets.
 * Images inside the spritesheet definition are loaded before the loader completes.
 * To load SpriteSheets using JSONP, specify a callback as part of the LoadItem.
 * Note that the JSONLoader and JSONPLoader are higher priority loaders, so SpriteSheets must set the LoadItem type property to SPRITESHEET.
 * 
 * The LoadItem crossOrigin as well as the LoadQueue's basePath argument and LoadQueue/_preferXHR property supplied to the LoadQueue
 * are passed on to the sub-manifest that loads the SpriteSheet images.
 * 
 * Note that the SpriteSheet JSON does not respect the LoadQueue/_preferXHR:property property, which should instead be determined by
 * the presence of a callback property on the SpriteSheet load item. This is because the JSON loaded will have a different format
 * depending on if it is loaded as JSON, so just changing preferXHR is not enough to change how it is loaded.
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
 * Documentation: https://www.createjs.com/docs/preloadjs/classes/SpriteSheetLoader.html
 * @author VolkovRA
 */
@:native("createjs.SpriteSheetLoader")
extern class SpriteSheetLoader extends AbstractLoader 
{
	/**
	 * Create a new SpriteSheetLoader.
	 * @param	item		The item to be loaded.
	 */
	@:overload(function(item:LoadItemObject):Void{})
	public function new(item:LoadItem);
	
	/**
	 * Determines if the loader can load a specific item.
	 * This loader can only load items that are of type SPRITESHEET.
	 * @param	item	The LoadItem that a LoadQueue is trying to load.
	 * @return	Whether the loader can load the item.
	 */
	@:overload(function(item:LoadItemObject):Bool{})
	static public function canLoadItem(item:LoadItem):Bool;
}