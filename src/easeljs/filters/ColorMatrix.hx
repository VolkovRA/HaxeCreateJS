package easeljs.filters;

/**
 * Provides helper functions for assembling a matrix for use with the ColorMatrixFilter.
 * Most methods return the instance to facilitate chained calls.
 * 
 * Example:
 * <code>
 * myColorMatrix.adjustHue(20).adjustBrightness(50);
 * </code>
 * See Filter for an example of how to apply filters, or ColorMatrixFilter for an example of how
 * to use ColorMatrix to change a DisplayObject's color.
 * 
 * Documentation: https://www.createjs.com/docs/easeljs/classes/ColorMatrix.html
 * @author VolkovRA
 */
@:native("createjs.ColorMatrix")
extern class ColorMatrix 
{
	/**
	 * Create a new ColorMatrix.
	 * @param	brightness	Adjusts the brightness of pixel color by adding the specified value to the red, green and blue channels.
	 * 						Positive values will make the image brighter, negative values will make it darker.
	 * 						A value between -255 & 255 that will be added to the RGB channels.
	 * 
	 * @param	contrast	Adjusts the contrast of pixel color. Positive values will increase contrast, negative values will decrease contrast.
	 * 						A value between -100 & 100.
	 * 
	 * @param	saturation	Adjusts the color saturation of the pixel.
	 * 						Positive values will increase saturation, negative values will decrease saturation (trend towards greyscale).
	 * 						A value between -100 & 100.
	 * 
	 * @param	hue			Adjusts the hue of the pixel color.
	 * 						A value between -180 & 180.
	 */
	public function new(brightness:Float, contrast:Float, saturation:Float, hue:Float);
	
	/**
	 * Adjusts the brightness of pixel color by adding the specified value to the red, green and blue channels.
	 * Positive values will make the image brighter, negative values will make it darker.
	 * @param	value A value between -255 & 255 that will be added to the RGB channels.
	 * @return	The ColorMatrix instance the method is called on (useful for chaining calls.)
	 */
	public function adjustBrightness(value:Float):ColorMatrix;
	
	/**
	 * Shortcut method to adjust brightness, contrast, saturation and hue.
	 * Equivalent to calling adjustHue(hue), adjustContrast(contrast), adjustBrightness(brightness), adjustSaturation(saturation), in that order.
	 * @param	brightness	Adjusts the brightness of pixel color by adding the specified value to the red, green and blue channels.
	 * 						Positive values will make the image brighter, negative values will make it darker.
	 * 						A value between -255 & 255 that will be added to the RGB channels.
	 * 
	 * @param	contrast	Adjusts the contrast of pixel color. Positive values will increase contrast, negative values will decrease contrast.
	 * 						A value between -100 & 100.
	 * 
	 * @param	saturation	Adjusts the color saturation of the pixel.
	 * 						Positive values will increase saturation, negative values will decrease saturation (trend towards greyscale).
	 * 						A value between -100 & 100.
	 * 
	 * @param	hue			Adjusts the hue of the pixel color.
	 * 						A value between -180 & 180.
	 * 
	 * @return	The ColorMatrix instance the method is called on (useful for chaining calls.)
	 */
	public function adjustColor(brightness:Float, contrast:Float, saturation:Float, hue:Float):ColorMatrix;
	
	/**
	 * Adjusts the contrast of pixel color.
	 * Positive values will increase contrast, negative values will decrease contrast.
	 * @param	value A value between -100 & 100.
	 * @return	The The ColorMatrix instance the method is called on (useful for chaining calls.)
	 */
	public function adjustContrast(value:Float):ColorMatrix;
	
	/**
	 * Adjusts the hue of the pixel color.
	 * @param	value A value between -180 & 180.
	 * @return	The ColorMatrix instance the method is called on (useful for chaining calls.)
	 */
	public function adjustHue(value:Float):ColorMatrix;
	
	/**
	 * Adjusts the color saturation of the pixel.
	 * Positive values will increase saturation, negative values will decrease saturation (trend towards greyscale).
	 * @param	value A value between -100 & 100.
	 * @return	The ColorMatrix instance the method is called on (useful for chaining calls.)
	 */
	public function adjustSaturation(value:Float):ColorMatrix;
	
	/**
	 * Returns a clone of this ColorMatrix.
	 * @return	A clone of this ColorMatrix.
	 */
	public function clone():ColorMatrix;
	
	/**
	 * Concatenates (multiplies) the specified matrix with this one.
	 * @param	matrix An array or ColorMatrix instance.
	 * @return	The ColorMatrix instance the method is called on (useful for chaining calls.)
	 */
	@:overload(function(matrix:Array<Float>):ColorMatrix{})
	public function concat(matrix:ColorMatrix):ColorMatrix;
	
	/**
	 * Copy the specified matrix's values to this matrix.
	 * @param	matrix An array or ColorMatrix instance.
	 * @return	The ColorMatrix instance the method is called on (useful for chaining calls.)
	 */
	@:overload(function(matrix:Array<Float>):ColorMatrix{})
	public function copy(matrix:ColorMatrix):ColorMatrix;
	
	/**
	 * Resets the matrix to identity values.
	 * @return	The ColorMatrix instance the method is called on (useful for chaining calls.)
	 */
	public function reset(matrix:ColorMatrix):ColorMatrix;
	
	/**
	 * Resets the instance with the specified values.
	 * @param	brightness	Adjusts the brightness of pixel color by adding the specified value to the red, green and blue channels.
	 * 						Positive values will make the image brighter, negative values will make it darker.
	 * 						A value between -255 & 255 that will be added to the RGB channels.
	 * 
	 * @param	contrast	Adjusts the contrast of pixel color. Positive values will increase contrast, negative values will decrease contrast.
	 * 						A value between -100 & 100.
	 * 
	 * @param	saturation	Adjusts the color saturation of the pixel.
	 * 						Positive values will increase saturation, negative values will decrease saturation (trend towards greyscale).
	 * 						A value between -100 & 100.
	 * 
	 * @param	hue			Adjusts the hue of the pixel color.
	 * 						A value between -180 & 180.
	 * 
	 * @return	The ColorMatrix instance the method is called on (useful for chaining calls.)
	 */
	public function setColor(brightness:Float, contrast:Float, saturation:Float, hue:Float):ColorMatrix;
	
	/**
	 * Return a length 25 (5x5) array instance containing this matrix's values.
	 * @return An array holding this matrix's values.
	 */
	public function toArray():Array<Float>;
	
	/**
	 * Returns a string representation of this object.
	 * @return A string representation of the instance.
	 */
	public function toString():String;
}