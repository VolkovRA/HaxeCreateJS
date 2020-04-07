package createjs.loader;

import haxe.DynamicAccess;
import haxe.extern.EitherType;

/**
 * All loaders accept an item containing the properties defined in this class.
 * If a raw object is passed instead, it will not be affected, but it must contain at least a Src:property property.
 * A string path or HTML tag is also acceptable, but it will be automatically converted to a LoadItem using the Create method by AbstractLoader.
 * 
 * Documentation: https://www.createjs.com/docs/preloadjs/classes/LoadItem.html
 * @author VolkovRA
 */
@:native("createjs.LoadItem")
extern class LoadItem 
{
	/**
	 * Create a new LoadItem.
	 */
	public function new();
	
	
	
	////////////////
	//   STATIC   //
	////////////////
	
	/**
	 * Default duration in milliseconds to wait before a request times out.
	 * This only applies to tag-based and and XHR (level one) loading, as XHR (level 2) provides its own timeout event.
	 */
	static public var LOAD_TIMEOUT_DEFAULT:Float;
	
	/**
	 * Create a LoadItem.
	 *   1. String-based items are converted to a LoadItem with a populated Src:property.
	 *   2. LoadItem instances are returned as-is.
	 *   3. Objects are returned with any needed properties added.
	 * 
	 * @param	value	The load item value.
	 * @return	A valid LoadItem.
	 */
	@:overload(function(value:LoadItem):LoadItem{})
	@:overload(function(value:LoadItemObject):LoadItemObject{})
	static public function create(value:String):LoadItem;
	
	
	
	////////////////////
	//   PROPERTIES   //
	////////////////////
	
	/**
	 * A string identifier which can be used to reference the loaded object.
	 * If none is provided, this will be automatically set to the Src:property.
	 * Default: null
	 */
	public var id:String;
	
	/**
	 * A callback used by JSONP requests that defines what global method to call when the JSONP content is loaded.
	 * Default: null
	 */
	public var callback:String;
	
	/**
	 * An arbitrary data object, which is included with the loaded object.
	 * Default: null
	 */
	public var data:Dynamic;
	
	/**
	 * An object hash of headers to attach to an XHR request.
	 * PreloadJS will automatically attach some default headers when required, including "Origin", "Content-Type", and "X-Requested-With".
	 * You may override the default headers by including them in your headers object.
	 * Default: null
	 */
	public var headers:DynamicAccess<String>;
	
	/**
	 * Sets the crossOrigin attribute for CORS-enabled images loading cross-domain.
	 * Default: Anonymous
	 */
	public var crossOrigin:EitherType<Bool, String>;
	
	/**
	 * The duration in milliseconds to wait before a request times out.
	 * This only applies to tag-based and and XHR (level one) loading, as XHR (level 2) provides its own timeout event.
	 * Default: 8000 (8 seconds)
	 */
	public var loadTimeout:Float;
	
	/**
	 * Determines if a manifest will maintain the order of this item, in relation to other items in the manifest that have also set
	 * the maintainOrder property to true. This only applies when the max connections has been set above 1 (using setMaxConnections).
	 * Everything with this property set to false will finish as it is loaded. Ordered items are combined with script tags loading in
	 * order when maintainScriptOrder is set to true.
	 * Default: false
	 */
	public var maintainOrder:Bool;
	
	/**
	 * The request method used for HTTP calls.
	 * Both GET or POST request types are supported, and are defined as constants on AbstractLoader.
	 * Default: Method.GET
	 */
	public var method:Method;
	
	/**
	 * Set the mime type of XHR-based requests.
	 * This is automatically set to "text/plain; charset=utf-8" for text based files (json, xml, text, css, js).
	 * Default: null
	 */
	public var mimeType:String;
	
	/**
	 * The source of the file that is being loaded. This property is <b>required</b>.
	 * The source can either be a string (recommended), or an HTML tag.
	 * This can also be an object, but in that case it has to include a type and be handled by a plugin.
	 * Default: null
	 */
	public var src:Dynamic;
	
	/**
	 * The type file that is being loaded.
	 * The type of the file is usually inferred by the extension, but can also be set manually.
	 * This is helpful in cases where a file does not have an extension.
	 * Default: null
	 */
	public var type:Type;
	
	/**
	 * An object hash of name/value pairs to send to the server.
	 * Default: null
	 */
	public var values:DynamicAccess<String>;
	
	/**
	 * Enable credentials for XHR requests.
	 * Default: false
	 */
	public var withCredentials:Bool;
	
	
	
	/////////////////
	//   METHODS   //
	/////////////////
	
	/**
	 * Provides a chainable shortcut method for setting a number of properties on the instance.
	 * <code>
	 * var loadItem = new createjs.LoadItem().set({src:"image.png", maintainOrder:true});
	 * </code>
	 * @param	properties	A generic object containing properties to copy to the LoadItem instance.
	 * @return	Returns the instance the method is called on (useful for chaining calls.)
	 */
	public function set(properties:LoadItemObject):LoadItem;
}