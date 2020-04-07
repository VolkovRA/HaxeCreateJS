package createjs.utils;

/**
 * Convenience methods for creating various elements used by PrelaodJS.
 * Documentation: https://www.createjs.com/docs/preloadjs/classes/DomUtils.html
 * @author VolkovRA
 */
@:native("createjs.DomUtils")
extern class DomUtils 
{
	/**
	 * Check if item is a valid HTMLAudioElement
	 * @param	item	Element.
	 * @return	True, if element is a valid.
	 */
	static public function isAudioTag(item:Dynamic):Bool;
	
	/**
	 * Check if item is a valid HTMLImageElement
	 * @param	item	Element.
	 * @return	True, if element is a valid.
	 */
	static public function isImageTag(item:Dynamic):Bool;
	
	/**
	 * Check if item is a valid HTMLVideoElement
	 * @param	item	Element.
	 * @return	True, if element is a valid.
	 */
	static public function isVideoTag(item:Dynamic):Bool;
}