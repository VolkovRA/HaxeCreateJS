package createjs.loader;

import createjs.events.EventDispatcher;

/**
 * A base class for actual data requests, such as XHRRequest, TagRequest, and MediaRequest.
 * PreloadJS loaders will typically use a data loader under the hood to get data.
 * 
 * Documentation: https://www.createjs.com/docs/preloadjs/classes/AbstractRequest.html
 * @author VolkovRA
 */
@:native("createjs.AbstractRequest")
extern class AbstractRequest extends EventDispatcher
{
	/**
	 * Create a new AbstractRequest.
	 * @param	item Load item data.
	 */
	public function new(item:LoadItem);
	
	/**
	 * Cancel an in-progress request.
	 */
	public function cancel():Void;
	
	/**
	 * Clean up a request.
	 */
	public function destroy():Void;
	
	/**
	 * Begin a load.
	 */
	public function load():Void;
}