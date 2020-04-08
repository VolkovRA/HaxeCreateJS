package createjs.loader;

/**
 * A preloader that loads items using XHR requests, usually XMLHttpRequest.
 * However XDomainRequests will be used for cross-domain requests if possible, and older versions of IE fall back on to ActiveX
 * objects when necessary. XHR requests load the content as text or binary data, provide progress and consistent completion events,
 * and can be canceled during load. Note that XHR is not supported in IE 6 or earlier, and is not recommended for cross-domain loading.
 * 
 * Note: The official documentation have a bug: XHRRequest extends AbstractRequest, <b>not</b> an AbstractLoader.
 * 
 * Documentation: https://www.createjs.com/docs/preloadjs/classes/XHRRequest.html
 * @author VolkovRA
 */
@:native("createjs.XHRRequest")
extern class XHRRequest extends AbstractRequest 
{
	/**
	 * Create a new XHRRequest.
	 * @param	item	The object that defines the file to load.
	 * 					Please see the loadFile for an overview of supported file properties.
	 */
	@:overload(function(item:LoadItemObject):Void{})
	public function new(item:LoadItem);
	
	/**
	 * Get all the response headers from the XmlHttpRequest.
	 * From the docs: Return all the HTTP headers, excluding headers that are a case-insensitive match for Set-Cookie or Set-Cookie2,
	 * as a single string, with each header line separated by a U+000D CR U+000A LF pair, excluding the status line, and with each
	 * header name and header value separated by a U+003A COLON U+0020 SPACE pair.
	 * @return	Response headers.
	 */
	public function getAllResponseHeaders():String;
	
	/**
	 * Get a specific response header from the XmlHttpRequest.
	 * 
	 * <b>From the docs:</b> Returns the header field value from the response of which the field name matches header,
	 * unless the field name is Set-Cookie or Set-Cookie2.
	 * @param	header	The header name to retrieve.
	 * @return	Response header.
	 */
	public function getResponseHeader(header:String):String;
	
	/**
	 * Look up the loaded result.
	 * @param	raw	Return a raw result instead of a formatted result.
	 * 				This applies to content loaded via XHR such as scripts, XML, CSS, and Images.
	 * 				If there is no raw result, the formatted result will be returned instead.
	 * @return	A result object containing the content that was loaded.
	 */
	public function getResult(raw:Bool = false):Dynamic;
	
	/**
	 * Returns a string representation of this XHRRequest.
	 * @return A string representation of the instance.
	 */
	override public function toString():String;
}