package createjs.sheet;

import js.html.ImageElement;

/**
 * The SpriteSheetUtils class is a collection of static methods for working with SpriteSheets.
 * A sprite sheet is a series of images (usually animation frames) combined into a single image on a regular grid.
 * For example, an animation consisting of 8 100x100 images could be combined into a 400x200 sprite sheet (4 frames across by 2 high).
 * The SpriteSheetUtils class uses a static interface and should not be instantiated.
 * 
 * Documentation: https://www.createjs.com/docs/easeljs/classes/SpriteSheetUtils.html
 * @author VolkovRA
 */
@:native("createjs.SpriteSheetUtils")
extern class SpriteSheetUtils 
{
	/**
	 * Returns a single frame of the specified sprite sheet as a new PNG image.
	 * An example of when this may be useful is to use a spritesheet frame as the source for a bitmap fill.
	 * 
	 * <b>WARNING:</b> In almost all cases it is better to display a single frame using a Sprite with a gotoAndStop call
	 * than it is to slice out a frame using this method and display it with a Bitmap instance. You can also crop
	 * an image using the Bitmap/sourceRect property of Bitmap.
	 * 
	 * The extractFrame method may cause cross-domain warnings since it accesses pixels directly on the canvas.
	 * @param	sheet	The SpriteSheet instance to extract a frame from.
	 * @param	frame	The frame number or animation name to extract.
	 * 					If an animation name is specified, only the first frame of the animation will be extracted.
	 * @return	A single frame of the specified sprite sheet as a new PNG image.
	 */
	@:overload(function(sheet:SpriteSheet, animation:String):ImageElement{})
	static public function extractFrame(sheet:SpriteSheet, frame:Int):ImageElement;
}