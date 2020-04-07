package createjs.loader;

import haxe.DynamicAccess;
import haxe.extern.EitherType;

/**
 * A valid analog object of the LoadItem.
 * For set params or use as constructor properties.
 * @author VolkovRA
 */
typedef LoadItemObject =
{
	/**
	 * A string identifier which can be used to reference the loaded object.
	 * If none is provided, this will be automatically set to the Src:property.
	 * Default: null
	 */
	@:optional var id:String;
	
	/**
	 * A callback used by JSONP requests that defines what global method to call when the JSONP content is loaded.
	 * Default: null
	 */
	@:optional var callback:String;
	
	/**
	 * An arbitrary data object, which is included with the loaded object.
	 * Default: null
	 */
	@:optional var data:Dynamic;
	
	/**
	 * An object hash of headers to attach to an XHR request.
	 * PreloadJS will automatically attach some default headers when required, including "Origin", "Content-Type", and "X-Requested-With".
	 * You may override the default headers by including them in your headers object.
	 * Default: null
	 */
	@:optional var headers:DynamicAccess<String>;
	
	/**
	 * Sets the crossOrigin attribute for CORS-enabled images loading cross-domain.
	 * Default: Anonymous
	 */
	@:optional var crossOrigin:EitherType<Bool, String>;
	
	/**
	 * The duration in milliseconds to wait before a request times out.
	 * This only applies to tag-based and and XHR (level one) loading, as XHR (level 2) provides its own timeout event.
	 * Default: 8000 (8 seconds)
	 */
	@:optional var loadTimeout:Float;
	
	/**
	 * Determines if a manifest will maintain the order of this item, in relation to other items in the manifest that have also set
	 * the maintainOrder property to true. This only applies when the max connections has been set above 1 (using setMaxConnections).
	 * Everything with this property set to false will finish as it is loaded. Ordered items are combined with script tags loading in
	 * order when maintainScriptOrder is set to true.
	 * Default: false
	 */
	@:optional var maintainOrder:Bool;
	
	/**
	 * The request method used for HTTP calls.
	 * Both GET or POST request types are supported, and are defined as constants on AbstractLoader.
	 * Default: Method.GET
	 */
	@:optional var method:Method;
	
	/**
	 * Set the mime type of XHR-based requests.
	 * This is automatically set to "text/plain; charset=utf-8" for text based files (json, xml, text, css, js).
	 * Default: null
	 */
	@:optional var mimeType:String;
	
	/**
	 * The source of the file that is being loaded. This property is <b>required</b>.
	 * The source can either be a string (recommended), or an HTML tag.
	 * This can also be an object, but in that case it has to include a type and be handled by a plugin.
	 * Default: null
	 */
	@:optional var src:Dynamic;
	
	/**
	 * The type file that is being loaded.
	 * The type of the file is usually inferred by the extension, but can also be set manually.
	 * This is helpful in cases where a file does not have an extension.
	 * Default: null
	 */
	@:optional var type:Type;
	
	/**
	 * An object hash of name/value pairs to send to the server.
	 * Default: null
	 */
	@:optional var values:DynamicAccess<String>;
	
	/**
	 * Enable credentials for XHR requests.
	 * Default: false
	 */
	@:optional var withCredentials:Bool;
}