package createjs.filters;

import haxe.extern.EitherType;
import js.html.CanvasElement;
import js.html.ImageElement;

/**
 * Applies the alpha from the mask image (or canvas) to the target, such that the alpha channel of the result
 * will be derived from the mask, and the RGB channels will be copied from the target. This can be used, for
 * example, to apply an alpha mask to a display object. This can also be used to combine a JPG compressed RGB
 * image with a PNG32 alpha mask, which can result in a much smaller file size than a single PNG32 containing ARGB.
 * 
 * IMPORTANT NOTE: This filter currently does not support the targetCtx, or targetX/Y parameters correctly.
 * Documentation: https://www.createjs.com/docs/easeljs/classes/AlphaMaskFilter.html
 * @author VolkovRA
 */
@:native("createjs.AlphaMaskFilter")
extern class AlphaMaskFilter extends Filter
{
	/**
	 * Create a new AlphaMaskFilter.
	 * @param	mask The image (or canvas) to use as the mask.
	 */
	public function new(mask:EitherType<ImageElement, CanvasElement>);
	
	/**
	 * The image (or canvas) to use as the mask.
	 */
	public var mask:EitherType<ImageElement, CanvasElement>;
}
