package createjs.utils;

import createjs.loader.Type;

/**
 * Utilities that assist with parsing load items, and determining file types, etc.
 * Documentation: https://www.createjs.com/docs/preloadjs/classes/RequestUtils.html
 * @author VolkovRA
 */
@:native("createjs.RequestUtils")
extern class RequestUtils 
{
	/**
	 * Determine the type of the object using common extensions.
	 * Note that the type can be passed in with the load item if it is an unusual extension.
	 * @param	extension	The file extension to use to determine the load type.
	 * @return	The determined load type (for example, Type.IMAGE). Will return null if the type can not be determined by the extension.
	 */
	static public function getTypeByExtension(extension:String):Type;
	
	/**
	 * Determine if a specific type should be loaded as a binary file.
	 * Currently, only images and items marked specifically as "binary" are loaded as binary.
	 * Note that audio is not a binary type, as we can not play back using an audio tag if it is loaded as binary.
	 * Plugins can change the item type to binary to ensure they get a binary result to work with.
	 * Binary files are loaded using XHR2.
	 * @param	type	The item type.
	 * @return	If the specified type is binary.
	 */
	static public function isBinary(type:Type):Bool;
	
	/**
	 * Determine if a specific type is a text-based asset, and should be loaded as UTF-8.
	 * @param	type	The item type.
	 * @return	If the specified type is text.
	 */
	static public function isText(type:Type):Bool;
}