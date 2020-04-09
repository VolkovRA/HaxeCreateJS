package createjs.loader;

import js.html.HtmlElement;

/**
 * An TagRequest that loads HTML tags for video and audio.
 * 
 * EVENTS
 * Event.INITIALIZE			
 * Event.COMPLETE	
 * Event.TIMEOUT			
 * 
 * Documentation: https://www.createjs.com/docs/preloadjs/classes/MediaTagRequest.html
 * @author VolkovRA
 */
@:native("createjs.MediaTagRequest")
extern class MediaTagRequest extends TagRequest 
{
	/**
	 * Create a new MediaTagRequest.
	 * @param	item			Load item data.
	 * @param	tag				The HTML tag instance that is used to load.
	 * @param	srcAttribute	The tag attribute that specifies the source, such as "src", "href", etc.
	 */
	public function new(item:LoadItem, tag:HtmlElement, srcAttribute:String);
}