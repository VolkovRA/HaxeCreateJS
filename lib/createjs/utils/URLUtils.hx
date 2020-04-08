package createjs.utils;

import createjs.loader.LoadItem;
import createjs.loader.LoadItemObject;
import js.lib.RegExp;

/**
 * Utilities that assist with parsing load items, and determining file types, etc.
 * Documentation: https://www.createjs.com/docs/preloadjs/classes/URLUtils.html
 * @author VolkovRA
 */
@:native("createjs.URLUtils")
extern class URLUtils 
{
	////////////////////
	//   PROPERTIES   //
	////////////////////
	
	/**
	 * The Regular Expression used to test file URLS for an absolute path.
	 */
	static public var ABSOLUTE_PATH:RegExp;
	
	/**
	 * The Regular Expression used to test file URLS for an extension.
	 * Note that URIs must already have the query string removed.
	 */
	static public var EXTENSION_PATT:RegExp;
	
	/**
	 * The Regular Expression used to test file URLS for a relative path.
	 */
	static public var RELATIVE_PATH:RegExp;
	
	
	
	/////////////////
	//   METHODS   //
	/////////////////
	
	/**
	 * A utility method that builds a file path using a source and a data object, and formats it into a new path.
	 * @param	src		The source path to add values to.
	 * @param	data	Object used to append values to this request as a query string. Existing parameters on the path will be preserved.
	 * @return	A formatted string that contains the path and the supplied parameters.
	 */
	static public function buildURI(src:String, data:Dynamic = null):String;
	
	/**
	 * Formats an object into a query string for either a POST or GET request.
	 * @param	data	The data to convert to a query string.
	 * @param	query	Existing name/value pairs to append on to this query.
	 * @return	Formated query string.
	 */
	static public function formatQueryString(data:Dynamic, query:Array<Dynamic> = null):String;
	
	/**
	 * Check item for cross domain content.
	 * @param	item	A load item with a src property.
	 * @return	If the load item is loading from a different domain than the current location.
	 */
	@:overload(function(item:LoadItemObject):Bool{})
	static public function isCrossDomain(item:LoadItem):Bool;
	
	/**
	 * Check item for local system content.
	 * @param	item	A load item with a src property
	 * @return	If the load item is loading from the "file:" protocol. Assume that the host must be local as well.
	 */
	@:overload(function(item:LoadItemObject):Bool{})
	static public function isLocal(item:LoadItem):Bool;
	
	/**
	 * Parse a file path to determine the information we need to work with it.
	 * Currently, PreloadJS needs to know:
	 *   1. If the path is absolute. Absolute paths start with a protocol (such as http://, file://, or //networkPath)
	 *   2. If the path is relative. Relative paths start with ../ or /path (or similar)
	 *   3. The file extension. This is determined by the filename with an extension.
	 *      Query strings are dropped, and the file path is expected to follow the format name.ext.
	 * 
	 * @param	path	File path.
	 * @return	An Object with an absolute and relative Boolean values, the pieces of the path (protocol, hostname, port, pathname,
	 * 			search, hash, host) as well as an optional 'extension` property, which is the lowercase extension.
	 */
	static public function parseURI(path:String):URIInfo;
}