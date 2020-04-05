package createjs.display;

import haxe.extern.EitherType;

/**
 * Object with a getImage method that returns a CanvasImageSource, or a string URL to an image.
 * @author VolkovRA
 */
typedef BitmapConfig =
{
	/**
	 * Returns a CanvasImageSource, or a string URL to an image.
	 */
	var getImage():EitherType<CanvasImageSource, String>;
}