package createjs.loader;

import haxe.DynamicAccess;
import haxe.extern.EitherType;
import js.lib.RegExp;

/**
 * A loader that handles font files, CSS definitions, and CSS paths.
 * FontLoader doesn't actually preload fonts themselves, but rather generates CSS definitions,
 * and then tests the size changes on an HTML5 Canvas element.
 * 
 * Note that FontLoader does not support tag-based loading due to the requirement that CSS be
 * read to determine the font definitions to test for.
 * 
 * EVENTS
 * Event.COMPLETE			The Event that is fired when the entire queue has been loaded.
 * 
 * Event.FILE_ERROR			The Event that is fired when the loader encounters an internal file load error.
 * 							This enables loaders to maintain internal queues, and surface file load errors.
 * 
 * Event.FILE_LOAD			The Event that is fired when a loader internally loads a file.
 * 							This enables loaders such as ManifestLoader to maintain internal LoadQueues and notify when they have loaded a file.
 * 							The LoadQueue class dispatches a slightly different fileload event.
 * 
 * Event.INITIALIZE			The Event that is fired after the internal request is created, but before a load.
 * 							This allows updates to the loader for specific loading needs, such as binary or XHR image loading.
 * 
 * Event.LOADSTART			The Event that is fired when a load starts.
 * 
 * ProgressEvent.PROGRESS	The ProgressEvent that is fired when the overall progress changes.
 * 							Prior to version 0.6.0, this was just a regular Event.
 * 
 * ErrorEvent.ERROR			The ErrorEvent that is fired when the loader encounters an error.
 * 							If the error was encountered by a file, the event will contain the item that caused the error.
 * 							Prior to version 0.6.0, this was just a regular Event.
 * 
 * Documentation: https://www.createjs.com/docs/preloadjs/classes/CSSLoader.html
 * @author VolkovRA
 */
@:native("createjs.FontLoader")
extern class FontLoader extends AbstractLoader 
{
	/**
	 * Create a new FontLoader.
	 * @param	item		The item to be loaded.
	 * @param	preferXHR	Whether the loader will try and load content using XHR (true) or HTML tags (false).
	 */
	@:overload(function(item:LoadItemObject):Void{})
	public function new(item:LoadItem);
	
	/**
	 * A lookup of font types for generating a CSS definition.
	 * For example, TTF fonts requires a "truetype" type.
	 */
	static public var FONT_FORMAT:DynamicAccess<String>;
	
	/**
	 * A lookup of font weights based on a name.
	 * These values are from http://www.w3.org/TR/css3-fonts/#font-weight-numeric-values.
	 */
	static public var FONT_WEIGHT:DynamicAccess<EitherType<Float, String>>;
	
	/**
	 * A regular expression that pulls out possible style values from the font name.
	 * These include "italic" and "oblique".
	 */
	static public var STYLE_REGEX:RegExp;
	
	/**
	 * The frequency in milliseconds to check for loaded fonts.
	 * Default: 10
	 */
	static public var WATCH_DURATION:Float;
	
	/**
	 * A regular expression that pulls out possible style values from the font name.
	 * 
	 * This includes font names that include thin, normal, book, regular, medium, black, and heavy (such as "Arial Black")
	 * Weight modifiers including extra, ultra, semi, demi, light, and bold (such as "WorkSans SemiBold")
	 * Weight descriptions map to font weight values by default using the following
	 * (from http://www.w3.org/TR/css3-fonts/#font-weight-numeric-values):
	 *   1. 100 - Thin
	 *   2. 200 - Extra Light, Ultra Light
	 *   3. 300 - Light, Semi Light, Demi Light
	 *   4. 400 - Normal, Book, Regular
	 *   5. 500 - Medium
	 *   6. 600 - Semi Bold, Demi Bold
	 *   7. 700 - Bold
	 *   8. 800 - Extra Bold, Ultra Bold
	 *   9. 900 - Black, Heavy
	 */
	static public var WEIGHT_REGEX:RegExp;
	
	/**
	 * Determines if the loader can load a specific item.
	 * This loader can only load items that are of type FONT.
	 * @param	item	The LoadItem that a LoadQueue is trying to load.
	 * @return	Whether the loader can load the item.
	 */
	@:overload(function(item:LoadItemObject):Bool{})
	static public function canLoadItem(item:LoadItem):Bool;
}