package createjs.filters;

/**
 * Applies a color transform to DisplayObjects.
 * 
 * This example draws a red circle, and then transforms it to Blue. This is accomplished by multiplying
 * all the channels to 0 (except alpha, which is set to 1), and then adding 255 to the blue channel.
 * <code>
 * var shape = new Shape().set({x:100,y:100});
 * shape.graphics.beginFill("#ff0000").drawCircle(0,0,50);
 * 
 * shape.filters = [
 *     new ColorFilter(0,0,0,1, 0,0,255,0)
 * ];
 * shape.cache(-50, -50, 100, 100);
 * </code>
 * Documentation: https://www.createjs.com/docs/easeljs/classes/ColorFilter.html
 * @author VolkovRA
 */
@:native("createjs.ColorFilter")
extern class ColorFilter extends Filter 
{
	/**
	 * Create a new ColorFilter.
	 * @param	redMultiplier	The amount to multiply against the red channel. This is a range between 0 and 1.
	 * @param	greenMultiplier	The amount to multiply against the green channel. This is a range between 0 and 1.
	 * @param	blueMultiplier	The amount to multiply against the blue channel. This is a range between 0 and 1.
	 * @param	alphaMultiplier	The amount to multiply against the alpha channel. This is a range between 0 and 1.
	 * @param	redOffset		The amount to add to the red channel after it has been multiplied. This is a range between -255 and 255.
	 * @param	greenOffset		The amount to add to the green channel after it has been multiplied. This is a range between -255 and 255.
	 * @param	blueOffset		The amount to add to the blue channel after it has been multiplied. This is a range between -255 and 255.
	 * @param	alphaOffset		The amount to add to the alpha channel after it has been multiplied. This is a range between -255 and 255.
	 */
	public function new(	redMultiplier:Float = 1,
							greenMultiplier:Float = 1, 
							blueMultiplier:Float = 1,
							alphaMultiplier:Float = 1,
							redOffset:Float = 0,
							greenOffset:Float = 0,
							blueOffset:Float = 0,
							alphaOffset:Float = 0
	);
	
	
	
	////////////////////
	//   PROPERTIES   //
	////////////////////
	
	/**
	 * The amount to multiply against the alpha channel.
	 * This is a range between 0 and 1.
	 */
	public var alphaMultiplier:Float;
	
	/**
	 * The amount to add to the alpha channel after it has been multiplied.
	 * This is a range between -255 and 255.
	 */
	public var alphaOffset:Float;
	
	/**
	 * The amount to multiply against the blue channel.
	 * This is a range between 0 and 1.
	 */
	public var blueMultiplier:Float;
	
	/**
	 * The amount to add to the blue channel after it has been multiplied.
	 * This is a range between -255 and 255.
	 */
	public var blueOffset:Float;
	
	/**
	 * The amount to multiply against the green channel.
	 * This is a range between 0 and 1.
	 */
	public var greenMultiplier:Float;
	
	/**
	 * The amount to add to the green channel after it has been multiplied.
	 * This is a range between -255 and 255.
	 */
	public var greenOffset:Float;
	
	/**
	 * The amount to multiply against the red channel.
	 * This is a range between 0 and 1.
	 */
	public var redMultiplier:Float;
	
	/**
	 * The amount to add to the red channel after it has been multiplied.
	 * This is a range between -255 and 255.
	 */
	public var redOffset:Float;
}