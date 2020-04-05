package createjs.filters;

import haxe.extern.EitherType;

/**
 * Allows you to carry out complex color operations such as modifying saturation, brightness, or inverting.
 * See the ColorMatrix for more information on changing colors. For an easier color transform, consider the ColorFilter.
 * 
 * Documentation: https://www.createjs.com/docs/easeljs/classes/ColorMatrixFilter.html
 * @author VolkovRA
 */
@:native("createjs.ColorMatrixFilter")
extern class ColorMatrixFilter extends Filter 
{
	/**
	 * Create a new ColorMatrixFilter.
	 * @param	matrix A 4x5 matrix describing the color operation to perform. See also the ColorMatrix.
	 */
	public function new(matrix:ColorMatrix);
	
	/**
	 * A 4x5 matrix describing the color operation to perform.
	 * See also the ColorMatrix.
	 */
	public var matrix:EitherType<ColorMatrix, Array<Float>>;
}