package easeljs.filters;

/**
 * Applies a box blur to DisplayObjects in context 2D and a Gaussian blur in webgl.
 * Note that this filter is fairly intensive, particularly if the quality is set higher than 1.
 * 
 * Documentation: https://www.createjs.com/docs/easeljs/classes/BlurFilter.html
 * @author VolkovRA
 */
@:native("createjs.BlurFilter")
extern class BlurFilter extends Filter 
{
	/**
	 * Create a new BlurFilter.
	 * @param	blurX	The horizontal blur radius in pixels.
	 * @param	blurY	The vertical blur radius in pixels.
	 * @param	quality	The number of blur iterations.
	 */
	public function new(blurX:Float = 0, blurY:Float = 0, quality:Float = 1);
	
	/**
	 * The horizontal blur radius in pixels.
	 * Default: 0
	 */
	public var blurX:Float;
	
	/**
	 * The vertical blur radius in pixels.
	 * Default: 0
	 */
	public var blurY:Float;
	
	/**
	 * The number of blur iterations.
	 * Default: 1
	 */
	public var quality:Float;
}