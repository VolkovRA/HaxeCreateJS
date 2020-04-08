package createjs.loader;

import js.html.HtmlElement;

/**
 * An AbstractRequest that loads HTML tags, such as images and scripts.
 * 
 * EVENTS
 * Event.INITIALIZE			
 * Event.COMPLETE	
 * Event.TIMEOUT			
 * 
 * Documentation: https://www.createjs.com/docs/preloadjs/classes/TagRequest.html
 * @author VolkovRA
 */
@:native("createjs.TagRequest")
extern class TagRequest extends AbstractRequest 
{
	/**
	 * Create a new TagRequest.
	 * @param	item			Load item data.
	 * @param	tag				The HTML tag instance that is used to load.
	 * @param	srcAttribute	The tag attribute that specifies the source, such as "src", "href", etc.
	 */
	public function new(item:LoadItem, tag:HtmlElement, srcAttribute:String);
}