package createjs.graphics;

import createjs.geom.Matrix2D;
import js.html.CanvasElement;
import js.html.CanvasRenderingContext2D;
import js.html.ImageElement;
import js.html.VideoElement;

/**
 * Begins a fill with the specified color.
 * This ends the current sub-path.
 * 
 * Tip: Use the fillStyle property to fill with another color/gradient.
 * Note: If the path is not closed, the fill() method will add a line from the last point to the startpoint
 * of the path to close the path (like closePath()), and then fill the path.
 * 
 * Documentation: https://www.w3schools.com/tags/canvas_fill.asp
 * Documentation: https://www.createjs.com/docs/easeljs/classes/Graphics.Fill.html
 * @author VolkovRA
 */
@:native("createjs.Graphics.Fill")
extern class Fill implements ICommand 
{
	/**
	 * Create a new Fill command.
	 * @param	style	A valid Context2D fillStyle.
	 * @param	matrix	Transform matrix.
	 */
	public function new(style:FillStyle, matrix:Matrix2D);
	
	/**
	 * A valid Context2D fillStyle.
	 * Default: "#000"
	 */
	public var style:FillStyle;
	
	/**
	 * Transform matrix.
	 */
	public var matrix:Matrix2D;
	
	/**
	 * Execute the Graphics command in the provided Canvas context.
	 * @param	context	Provided Canvas context.
	 * @param	data	Optional data that is passed to graphics command exec methods.
	 * 					When called from a Shape instance, the shape passes itself as the data parameter.
	 * 					This can be used by custom graphic commands to insert contextual data.
	 */
	function exec(context:CanvasRenderingContext2D, data:Dynamic = null):Void;
	
	/**
	 * Creates a bitmap fill style and assigns it to the Fill/style:property.
	 * See Graphics.beginBitmapFill() for more information.
	 * @param	image		Must be loaded prior to creating a bitmap fill, or the fill will be empty.
	 * @param	repetition	Options of repeat image.
	 * @return	Returns this Fill object for chaining or assignment.
	 */
	@:overload(function(image:VideoElement, ?repetition:RepeatType):Fill{})
	@:overload(function(image:CanvasElement, ?repetition:RepeatType):Fill{})
	public function bitmap(image:ImageElement, ?repetition:RepeatType):Fill;
	
	/**
	 * Creates a linear gradient style and assigns it to Fill/style:property.
	 * See Graphics.beginLinearGradientFill() for more information.
	 * @param	colors	An array of CSS compatible color values. For example, ["#F00","#00F"] would define a gradient drawing from red to blue.
	 * @param	ratios	An array of gradient positions which correspond to the colors. For example, [0.1, 0.9] would draw the first color to 10% then interpolating to the second color at 90%.
	 * @param	x0		The position of the first point defining the line that defines the gradient direction and size.
	 * @param	y0		The position of the first point defining the line that defines the gradient direction and size.
	 * @param	x1		The position of the second point defining the line that defines the gradient direction and size.
	 * @param	y1		The position of the second point defining the line that defines the gradient direction and size.
	 * @return	Returns this Fill object for chaining or assignment.
	 */
	public function linearGradient(colors:Array<String>, ratios:Array<Float>, x0:Float, y0:Float, x1:Float, y1:Float):Fill;
	
	/**
	 * Creates a radial gradient style and assigns it to Fill/style:property.
	 * See Graphics.beginRadialGradientFill() for more information.
	 * @param	colors	An array of CSS compatible color values. For example, ["#F00","#00F"] would define a gradient drawing from red to blue.
	 * @param	ratios	An array of gradient positions which correspond to the colors. For example, [0.1, 0.9] would draw the first color to 10% then interpolating to the second color at 90%.
	 * @param	x0		Center position of the inner circle that defines the gradient.
	 * @param	y0		Center position of the inner circle that defines the gradient.
	 * @param	r0		Radius of the inner circle that defines the gradient.
	 * @param	x1		Center position of the outer circle that defines the gradient.
	 * @param	y1		Center position of the outer circle that defines the gradient.
	 * @param	r1		Radius of the outer circle that defines the gradient.
	 * @return	Returns this Fill object for chaining or assignment.
	 */
	public function radialGradient(colors:Array<String>, ratios:Array<Float>, x0:Float, y0:Float, r0:Float, x1:Float, y1:Float, r1:Float):Fill;
}