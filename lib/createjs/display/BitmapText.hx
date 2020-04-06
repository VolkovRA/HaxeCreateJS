package createjs.display;

import createjs.display.DisplayObject;
import createjs.sheet.SpriteSheet;

/**
 * Displays text using bitmap glyphs defined in a sprite sheet.
 * Multi-line text is supported using new line characters, but automatic wrapping is not supported.
 * See the spriteSheet property for more information on defining glyphs.
 * 
 * Important: While BitmapText extends Container, it is not designed to be used as one.
 * As such, methods like addChild and removeChild are disabled.
 * 
 * Documentation: https://www.createjs.com/docs/easeljs/classes/BitmapText.html
 * @author VolkovRA
 */
@:native("createjs.BitmapText")
extern class BitmapText extends Container 
{
	/**
	 * Create a new BitmapText.
	 * @param	text	The text to display.
	 * @param	sheet	The spritesheet that defines the character glyphs.
	 */
	public function new(text:String = "", sheet:SpriteSheet = null);
	
	
	
	////////////////
	//   STATIC   //
	////////////////
	
	/**
	 * BitmapText uses Sprite instances to draw text.
	 * To reduce the creation and destruction of instances (and thus garbage collection), it maintains an
	 * internal object pool of sprite instances to reuse. Increasing this value can cause more sprites to
	 * be retained, slightly increasing memory use, but reducing instantiation.
	 * Default: 100
	 */
	static public var maxPoolSize:Float;
	
	
	
	////////////////////
	//   PROPERTIES   //
	////////////////////
	
	/**
	 * The text to display.
	 * Default: ""
	 */
	public var text:String;
	
	/**
	 * This spacing (in pixels) will be added after each character in the output.
	 * Default: 0
	 */
	public var letterSpacing:Float;
	
	/**
	 * The height of each line of text.
	 * If 0, then it will use a line height calculated by checking for the height of the "1", "T", or "L" character (in that order).
	 * If those characters are not defined, it will use the height of the first frame of the sprite sheet.
	 * Default: 0
	 */
	public var lineHeight:Float;
	
	/**
	 * If a space character is not defined in the sprite sheet, then empty pixels equal to spaceWidth will be inserted instead.
	 * If 0, then it will use a value calculated by checking for the width of the "1", "l", "E", or "A" character (in that order).
	 * If those characters are not defined, it will use the width of the first frame of the sprite sheet.
	 * Default: 0
	 */
	public var spaceWidth:Float;
	
	/**
	 * A SpriteSheet instance that defines the glyphs for this bitmap text.
	 * Each glyph/character should have a single frame animation defined in the sprite sheet named the same as corresponding character.
	 * For example, the following animation definition:
	 * <code>"A": {frames: [0]}</code>
	 * 
	 * would indicate that the frame at index 0 of the spritesheet should be drawn for the "A" character.
	 * The short form is also acceptable:
	 * <code>"A": 0</code>
	 * 
	 * Note that if a character in the text is not found in the sprite sheet, it will also try to use the alternate case (upper or lower).
	 * See SpriteSheet for more information on defining sprite sheet data.
	 * Default: null
	 */
	public var spriteSheet:SpriteSheet;
	
	
	
	////////////////////
	//   DEPRECATED   //
	////////////////////
	
	/**
	 * <b>Disabled in BitmapText.</b>
	 */
	@:deprecated
	@:noCompletion
	override public function addChild(child:DisplayObject):DisplayObject;
	
	/**
	 * <b>Disabled in BitmapText.</b>
	 */
	@:deprecated
	@:noCompletion
	override public function addChildAt(child:DisplayObject, index:Int):DisplayObject;
	
	/**
	 * <b>Disabled in BitmapText.</b>
	 */
	@:deprecated
	@:noCompletion
	override public function removeAllChildren():Void;
	
	/**
	 * <b>Disabled in BitmapText.</b>
	 */
	@:deprecated
	@:noCompletion
	override public function removeChild(child:DisplayObject):Bool;
	
	/**
	 * <b>Disabled in BitmapText.</b>
	 */
	@:deprecated
	@:noCompletion
	override public function removeChildAt(index:Int):Bool;
	
	
	
	//////////////////
	//   OVERRIDE   //
	//////////////////
	
	/**
	 * Returns true or false indicating whether the display object would be visible if drawn to a canvas.
	 * This does not account for whether it would be visible within the boundaries of the stage.
	 * NOTE: This method is mainly for internal use, though it may be useful for advanced uses.
	 * @return	Boolean indicating whether the display object would be visible if drawn to a canvas
	 */
	override public function isVisible():Bool;
	
	/**
	 * Returns a string representation of this BitmapText.
	 * @return A string representation of the instance.
	 */
	override public function toString():String;
}