package createjs.loader;

/**
 * Defines the method types for XHR requests.
 * Currently, PreloadJS only supports "POST" and "GET", however any HTML method can be used with PreloadJS utilities.
 * 
 * Documentation: https://www.createjs.com/docs/preloadjs/classes/Methods.html
 * @author VolkovRA
 */
@:enum abstract Method(String) to String
{
	/**
	 * Defines a GET request, use for a method value when loading data.
	 */
	var GET = "GET";
	
	/**
	 * Defines a POST request, use for a method value when loading data.
	 */
	var POST = "POST";
}