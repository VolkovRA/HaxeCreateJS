package createjs.filters;

import haxe.extern.EitherType;
import js.html.CanvasElement;
import js.html.ImageElement;

/**
 * Applies a greyscale alpha map image (or canvas) to the target, such that the alpha channel of the result will be
 * copied from the red channel of the map, and the RGB channels will be copied from the target.
 * 
 * Generally, it is recommended that you use AlphaMaskFilter, because it has much better performance.
 * Documentation: https://www.createjs.com/docs/easeljs/classes/AlphaMapFilter.html
 * @author VolkovRA
 */
@:native("createjs.AlphaMapFilter")
extern class AlphaMapFilter extends Filter
{
	/**
	 * Create a new AlphaMapFilter.
	 * @param	alphaMap	The greyscale image (or canvas) to use as the alpha value for the result.
	 * 						This should be exactly the same dimensions as the target.
	 */
	public function new(alphaMap:EitherType<ImageElement, CanvasElement>);
	
	/**
	 * The greyscale image (or canvas) to use as the alpha value for the result.
	 * This should be exactly the same dimensions as the target.
	 */
	public var alphaMap:EitherType<ImageElement, CanvasElement>;
}
