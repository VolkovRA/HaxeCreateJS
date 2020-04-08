package createjs.utils;

import js.html.XMLDocument;

/**
 * A few data utilities for formatting different data types.
 * Documentation: https://www.createjs.com/docs/preloadjs/classes/DataUtils.html
 * @author VolkovRA
 */
@:native("createjs.DataUtils")
extern class DataUtils 
{
	/**
	 * Parse a string into an Object.
	 * @param	value	The loaded JSON string.
	 * @return	A JavaScript object.
	 */
	static public function parseJSON(value:String):Dynamic;
	
	/**
	 * Parse XML using the DOM.
	 * This is required when preloading XML or SVG.
	 * @param	text	The raw text or XML that is loaded by XHR.
	 * @return	 An XML document
	 */
	static public function parseXML(text:String):XMLDocument;
}