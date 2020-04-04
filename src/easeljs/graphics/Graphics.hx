package easeljs.graphics;

import easeljs.geom.Matrix2D;
import haxe.DynamicAccess;
import haxe.extern.EitherType;
import js.html.CanvasElement;
import js.html.CanvasRenderingContext2D;
import js.html.ImageElement;
import js.html.VideoElement;

/**
 * The Graphics class exposes an easy to use API for generating vector drawing instructions and drawing them
 * to a specified context. Note that you can use Graphics without any dependency on the EaselJS framework by
 * calling draw directly, or it can be used with the Shape object to draw vector graphics within the context
 * of an EaselJS display list.
 * 
 * There are two approaches to working with Graphics object: calling methods on a Graphics instance
 * (the "Graphics API"), or instantiating Graphics command objects and adding them to the graphics queue via
 * append. The former abstracts the latter, simplifying beginning and ending paths, fills, and strokes.
 * 
 * All drawing methods in Graphics return the Graphics instance, so they can be chained together. For example,
 * the following line of code would generate the instructions to draw a rectangle with a red stroke and blue fill.
 * 
 * Documentation: https://www.createjs.com/docs/easeljs/classes/Graphics.html
 * @author VolkovRA
 */
@:native("createjs.Graphics")
extern class Graphics 
{
	////////////////
	//   STATIC   //
	////////////////
	
	/**
	 * Map of Base64 characters to values.
	 * Used by decodePath.
	 */
	static public var BASE_64(default, null):DynamicAccess<Int>;
	
	/**
	 * Maps numeric values for the caps parameter of setStrokeStyle to corresponding string values.
	 * This is primarily for use with the tiny API. The mappings are as follows: 0 to "butt", 1 to
	 * "round", and 2 to "square". For example, to set the line caps to "square":
	 * <code>
	 * myGraphics.ss(16, 2);
	 * </code>
	 */
	static public var STROKE_CAPS_MAP(default, null):Array<String>;
	
	/**
	 * Maps numeric values for the joints parameter of setStrokeStyle to corresponding string values.
	 * This is primarily for use with the tiny API. The mappings are as follows: 0 to "miter", 1 to
	 * "round", and 2 to "bevel". For example, to set the line joints to "bevel":
	 * <code>
	 * myGraphics.ss(16, 0, 2);
	 * </code>
	 */
	static public var STROKE_JOINTS_MAP(default, null):Array<String>;
	
	/**
	 * Returns a CSS compatible color string based on the specified HSL numeric color values in the
	 * format "hsla(360,100,100,1.0)", or if alpha is null then in the format "hsl(360,100,100)".
	 * <code>
	 * Graphics.getHSL(150, 100, 70);
	 * // Returns "hsl(150,100,70)"
	 * </code>
	 * @param	hue			The hue component for the color, between 0 and 360.
	 * @param	saturation	The saturation component for the color, between 0 and 100.
	 * @param	lightness	The lightness component for the color, between 0 and 100.
	 * @param	alpha		The alpha component for the color where 0 is fully transparent and 1 is fully opaque.
	 * @return	A CSS compatible color string based on the specified HSL numeric color values in the format "hsla(360,100,100,1.0)",
	 * 			or if alpha is null then in the format "hsl(360,100,100)".
	 */
	static public function getHSL(hue:Float, saturation:Float, lightness:Float, ?alpha:Float):String;
	
	/**
	 * Returns a CSS compatible color string based on the specified RGB numeric color values in
	 * the format "rgba(255,255,255,1.0)", or if alpha is null then in the format "rgb(255,255,255)". For example,
	 * <code>
	 * Graphics.getRGB(50, 100, 150, 0.5);
	 * // Returns "rgba(50,100,150,0.5)"
	 * </code>
	 * It also supports passing a single hex color value as the first param, and an optional alpha value as the second param. For example,
	 * <code>
	 * Graphics.getRGB(0xFF00FF, 0.2);
 	 * // Returns "rgba(255,0,255,0.2)"
	 * </code>
	 * @param	r		The red component for the color, between 0 and 0xFF (255).
	 * @param	g		The green component for the color, between 0 and 0xFF (255).
	 * @param	b		The blue component for the color, between 0 and 0xFF (255).
	 * @param	alpha	The alpha component for the color where 0 is fully transparent and 1 is fully opaque.
	 * @return	A CSS compatible color string based on the specified RGB numeric color values in the format "rgba(255,255,255,1.0)",
	 * 			or if alpha is null then in the format "rgb(255,255,255)".
	 */
	static public function getRGB(r:Float, g:Float, b:Float, ?alpha:Float):String;
	
	/**
	 * A reusable instance of BeginPath to avoid unnecessary instantiation.
	 */
	static public var beginCmd:BeginPath;
	
	
	
	////////////////
	//   PARAMS   //
	////////////////
	
	/**
	 * Holds a reference to the last command that was created or appended.
	 * For example, you could retain a reference to a Fill command in order to dynamically update the color later by using:
	 * <code>
	 * var myFill = myGraphics.beginFill("red").command;
	 * // update color later:
	 * myFill.style = "yellow";
	 * </code>
	 */
	public var command:ICommand;
	
	/**
	 * Returns the graphics instructions array.
	 * Each entry is a graphics command object (ex. Fill, Rect) Modifying the returned array directly
	 * is not recommended, and is likely to result in unexpected behaviour.
	 * 
	 * This property is mainly intended for introspection of the instructions (ex. for graphics export).
	 */
	public var instructions(default, null):Array<ICommand>;
	
	
	
	/////////////////
	//   METHODS   //
	/////////////////
	
	/**
	 * Create a new Graphics.
	 */
	public function new();
	
	/**
	 * Appends a graphics command object to the graphics queue.
	 * Command objects expose an "exec" method that accepts two parameters: the Context2D to operate on,
	 * and an arbitrary data object passed into draw. The latter will usually be the Shape instance that called draw.
	 * 
	 * This method is used internally by Graphics methods, such as drawCircle, but can also be used directly
	 * to insert built-in or custom graphics commands.
	 * @param	command	A graphics command object exposing an "exec" method.
	 * @param	clean	The clean param is primarily for internal use. A value of true indicates that a command does not generate a path that should be stroked or filled.
	 * @return
	 */
	public function append(command:ICommand, clean:Bool):Graphics;
	
	/**
	 * Draws an arc defined by the radius, startAngle and endAngle arguments, centered at the position (x, y).
	 * For example, to draw a full circle with a radius of 20 centered at (100, 100):
	 * <code>
	 * arc(100, 100, 20, 0, Math.PI*2);
	 * </code>
	 * For detailed information, read the whatwg spec. A tiny API method "a" also exists.
	 * @param	x				The x-coordinate of the center of the circle.
	 * @param	y				The y-coordinate of the center of the circle.
	 * @param	radius			The radius of the circle.
	 * @param	startAngle		The starting angle, in radians (0 is at the 3 o'clock position of the arc's circle).
	 * @param	endAngle		The ending angle, in radians.
	 * @param	anticlockwise	Specifies whether the drawing should be counterclockwise or clockwise.
	 * 							False is default, and indicates clockwise, while true indicates counter-clockwise.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function arc(x:Float, y:Float, radius:Float, startAngle:Float, endAngle:Float, anticlockwise:Bool):Graphics;
	
	/**
	 * Draws an arc with the specified control points and radius.
	 * For detailed information, read the whatwg spec. A tiny API method "at" also exists.
	 * @param	x1		The x-coordinate of the first tangent.
	 * @param	y1		The y-coordinate of the first tangent.
	 * @param	x2		The x-coordinate of the second tangent.
	 * @param	y2		The y-coordinate of the second tangent.
	 * @param	radius	The radius of the arc.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function arcTo(x1:Float, y1:Float, x2:Float, y2:Float, radius:Float):Graphics;
	
	/**
	 * Begins a pattern fill using the specified image.
	 * This ends the current sub-path. A tiny API method "bf" also exists.
	 * @param	image		The Image, Canvas, or Video object to use as the pattern.
	 * 						Must be loaded prior to creating a bitmap fill, or the fill will be empty.
	 * @param	repetition	Optional. Indicates whether to repeat the image in the fill area.
	 * 						One of RepeatType.REPEAT, RepeatType.REPEAT_X, RepeatType.REPEAT_Y, or RepeatType.NO_REPEAT.
	 * 						Defaults to RepeatType.REPEAT. Note that Firefox does not support RepeatType.REPEAT_X or
	 * 						RepeatType.REPEAT_Y (latest tests were in FF 20.0), and will default to RepeatType.REPEAT.
	 * @param	matrix		Optional. Specifies a transformation matrix for the bitmap fill.
	 * 						This transformation will be applied relative to the parent transform.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	@:overload(function(image:VideoElement, ?repetition:RepeatType, ?matrix:Matrix2D):Graphics{})
	@:overload(function(image:CanvasElement, ?repetition:RepeatType, ?matrix:Matrix2D):Graphics{})
	public function beginBitmapFill(image:ImageElement, ?repetition:RepeatType, ?matrix:Matrix2D):Graphics;
	
	/**
	 * Begins a pattern fill using the specified image. This ends the current sub-path.
	 * Note that unlike bitmap fills, strokes do not currently support a matrix parameter due to limitations in the canvas API.
	 * A tiny API method "bs" also exists.
	 * @param	image		The Image, Canvas, or Video object to use as the pattern.
	 * 						Must be loaded prior to creating a bitmap fill, or the fill will be empty.
	 * @param	repetition	Optional. Indicates whether to repeat the image in the fill area.
	 * 						One of RepeatType.REPEAT, RepeatType.REPEAT_X, RepeatType.REPEAT_Y, or RepeatType.NO_REPEAT.
	 * 						Defaults to RepeatType.REPEAT.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	@:overload(function(image:VideoElement, ?repetition:RepeatType):Graphics{})
	@:overload(function(image:CanvasElement, ?repetition:RepeatType):Fill{})
	public function beginBitmapStroke(image:ImageElement, ?repetition:RepeatType):Graphics;
	
	/**
	 * Begins a fill with the specified color.
	 * This ends the current sub-path. A tiny API method "f" also exists.
	 * @param	color A CSS compatible color value (ex. "red", "#FF0000", or "rgba(255,0,0,0.5)"). Setting to null will result in no fill.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function beginFill(color:String):Graphics;
	
	/**
	 * Begins a linear gradient fill defined by the line (x0, y0) to (x1, y1).
	 * This ends the current sub-path. For example, the following code defines a black to white vertical gradient ranging
	 * from 20px to 120px, and draws a square to display it:
	 * <code>
	 * myGraphics.beginLinearGradientFill(["#000","#FFF"], [0, 1], 0, 20, 0, 120).drawRect(20, 20, 120, 120);
	 * </code>
	 * A tiny API method "lf" also exists.
	 * @param	colors	An array of CSS compatible color values. For example, ["#F00","#00F"] would define a gradient drawing from red to blue.
	 * @param	ratios	An array of gradient positions which correspond to the colors. For example, [0.1, 0.9] would draw the first color to 10% then interpolating to the second color at 90%.
	 * @param	x0		The position of the first point defining the line that defines the gradient direction and size.
	 * @param	y0		The position of the first point defining the line that defines the gradient direction and size.
	 * @param	x1		The position of the second point defining the line that defines the gradient direction and size.
	 * @param	y1		The position of the second point defining the line that defines the gradient direction and size.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function beginLinearGradientFill(colors:Array<String>, ratios:Array<Float>, x0:Float, y0:Float, x1:Float, y1:Float):Graphics;
	
	/**
	 * Begins a linear gradient stroke defined by the line (x0, y0) to (x1, y1).
	 * This ends the current sub-path. For example, the following code defines a black to white vertical gradient ranging
	 * from 20px to 120px, and draws a square to display it:
	 * <code>
	 * myGraphics.setStrokeStyle(10).
	 *     beginLinearGradientStroke(["#000","#FFF"], [0, 1], 0, 20, 0, 120).drawRect(20, 20, 120, 120);
	 * </code>
	 * A tiny API method "ls" also exists.
	 * @param	colors	An array of CSS compatible color values. For example, ["#F00","#00F"] would define a gradient drawing from red to blue.
	 * @param	ratios	An array of gradient positions which correspond to the colors. For example, [0.1, 0.9] would draw the first color to 10% then interpolating to the second color at 90%.
	 * @param	x0		The position of the first point defining the line that defines the gradient direction and size.
	 * @param	y0		The position of the first point defining the line that defines the gradient direction and size.
	 * @param	x1		The position of the second point defining the line that defines the gradient direction and size.
	 * @param	y1		The position of the second point defining the line that defines the gradient direction and size.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function beginLinearGradientStroke(colors:Array<String>, ratios:Array<Float>, x0:Float, y0:Float, x1:Float, y1:Float):Graphics;
	
	/**
	 * Begins a radial gradient fill. This ends the current sub-path.
	 * For example, the following code defines a red to blue radial gradient centered at (100, 100),
	 * with a radius of 50, and draws a circle to display it:
	 * <code>
	 * myGraphics.beginRadialGradientFill(["#F00","#00F"], [0, 1], 100, 100, 0, 100, 100, 50).drawCircle(100, 100, 50);
	 * </code>
	 * A tiny API method "rf" also exists.
	 * @param	colors	An array of CSS compatible color values. For example, ["#F00","#00F"] would define a gradient drawing from red to blue.
	 * @param	ratios	An array of gradient positions which correspond to the colors. For example, [0.1, 0.9] would draw the first color to 10% then interpolating to the second color at 90%.
	 * @param	x0		Center position of the inner circle that defines the gradient.
	 * @param	y0		Center position of the inner circle that defines the gradient.
	 * @param	r0		Radius of the inner circle that defines the gradient.
	 * @param	x1		Center position of the outer circle that defines the gradient.
	 * @param	y1		Center position of the outer circle that defines the gradient.
	 * @param	r1		Radius of the outer circle that defines the gradient.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function beginRadialGradientFill(colors:Array<String>, ratios:Array<Float>, x0:Float, y0:Float, r0:Float, x1:Float, y1:Float, r1:Float):Graphics;
	
	/**
	 * Begins a radial gradient stroke. This ends the current sub-path.
	 * For example, the following code defines a red to blue radial gradient centered at (100, 100), with a radius of 50,
	 * and draws a rectangle to display it:
	 * <code>
	 * myGraphics.setStrokeStyle(10)
	 *     .beginRadialGradientStroke(["#F00","#00F"], [0, 1], 100, 100, 0, 100, 100, 50)
	 *     .drawRect(50, 90, 150, 110);
	 * </code>
	 * A tiny API method "rs" also exists.
	 * @param	colors	An array of CSS compatible color values. For example, ["#F00","#00F"] would define a gradient drawing from red to blue.
	 * @param	ratios	An array of gradient positions which correspond to the colors. For example, [0.1, 0.9] would draw the first color to 10% then interpolating to the second color at 90%, then draw the second color to 100%.
	 * @param	x0		Center position of the inner circle that defines the gradient.
	 * @param	y0		Center position of the inner circle that defines the gradient.
	 * @param	r0		Radius of the inner circle that defines the gradient.
	 * @param	x1		Center position of the outer circle that defines the gradient.
	 * @param	y1		Center position of the outer circle that defines the gradient.
	 * @param	r1		Radius of the outer circle that defines the gradient.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function beginRadialGradientStroke(colors:Array<String>, ratios:Array<Float>, x0:Float, y0:Float, r0:Float, x1:Float, y1:Float, r1:Float):Graphics;
	
	/**
	 * Begins a stroke with the specified color.
	 * This ends the current sub-path. A tiny API method "s" also exists.
	 * @param	color	A CSS compatible color value (ex. "#FF0000", "red", or "rgba(255,0,0,0.5)"). Setting to null will result in no stroke.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function beginStroke(color:String):Graphics;
	
	/**
	 * Draws a bezier curve from the current drawing point to (x, y) using the control points (cp1x, cp1y) and (cp2x, cp2y).
	 * For detailed information, read the whatwg spec. A tiny API method "bt" also exists.
	 * @param	cp1x	The x-coordinate of the first Bézier control point.
	 * @param	cp1y	The y-coordinate of the first Bézier control point.
	 * @param	cp2x	The x-coordinate of the second Bézier control point.
	 * @param	cp2y	The y-coordinate of the second Bézier control point.
	 * @param	x		The x-coordinate of the ending point.
	 * @param	y		The y-coordinate of the ending point.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function bezierCurveTo(cp1x:Float, cp1y:Float, cp2x:Float, cp2y:Float, x:Float, y:Float):Graphics;
	
	/**
	 * Clears all drawing instructions, effectively resetting this Graphics instance.
	 * Any line and fill styles will need to be redefined to draw shapes following a clear call. A tiny API method "c" also exists.
	 * @return The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function clear():Graphics;
	
	/**
	 * Returns a clone of this Graphics instance.
	 * Note that the individual command objects are not cloned.
	 * @return A clone of the current Graphics instance.
	 */
	public function clone():Graphics;
	
	/**
	 * Closes the current path, effectively drawing a line from the current drawing point to the first drawing
	 * point specified since the fill or stroke was last set. A tiny API method "cp" also exists.
	 * @return The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function closePath():Graphics;
	
	/**
	 * Maps the familiar ActionScript curveTo() method to the functionally similar quadraticCurveTo method.
	 * @param	cpx	The x-coordinate of the Bézier control point.
	 * @param	cpy	The y-coordinate of the Bézier control point.
	 * @param	x	The x-coordinate of the ending point.
	 * @param	y	The y-coordinate of the ending point.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function curveTo(cpx:Float, cpy:Float, x:Float, y:Float):Graphics;
	
	/**
	 * Decodes a compact encoded path string into a series of draw instructions.
	 * This format is not intended to be human readable, and is meant for use by authoring tools. The format uses
	 * a base64 character set, with each character representing 6 bits, to define a series of draw commands.
	 * 
	 * Each command is comprised of a single "header" character followed by a variable number of alternating x and
	 * y position values. Reading the header bits from left to right (most to least significant): bits 1 to 3
	 * specify the type of operation (0-moveTo, 1-lineTo, 2-quadraticCurveTo, 3-bezierCurveTo, 4-closePath, 5-7
	 * unused). Bit 4 indicates whether position values use 12 bits (2 characters) or 18 bits (3 characters), with
	 * a one indicating the latter. Bits 5 and 6 are currently unused.
	 * 
	 * Following the header is a series of 0 (closePath), 2 (moveTo, lineTo), 4 (quadraticCurveTo), or 6 (bezierCurveTo)
	 * parameters. These parameters are alternating x/y positions represented by 2 or 3 characters (as indicated by
	 * the 4th bit in the command char). These characters consist of a 1 bit sign (1 is negative, 0 is positive),
	 * followed by an 11 (2 char) or 17 (3 char) bit integer value. All position values are in tenths of a pixel.
	 * Except in the case of move operations which are absolute, this value is a delta from the previous x or y
	 * position (as appropriate).
	 * 
	 * For example, the string "A3cAAMAu4AAA" represents a line starting at -150,0 and ending at 150,0.
	 * A - bits 000000. First 3 bits (000) indicate a moveTo operation. 4th bit (0) indicates 2 chars per parameter.
	 * n0 - 110111011100. Absolute x position of -150.0px. First bit indicates a negative value, remaining bits indicate 1500 tenths of a pixel.
	 * AA - 000000000000. Absolute y position of 0.
	 * I - 001100. First 3 bits (001) indicate a lineTo operation. 4th bit (1) indicates 3 chars per parameter.
	 * Au4 - 000000101110111000. An x delta of 300.0px, which is added to the previous x value of -150.0px to provide an absolute position of +150.0px.
	 * AAA - 000000000000000000. A y delta value of 0.
	 * 
	 * A tiny API method "p" also exists.
	 * @param	str	The path string to decode.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function decodePath(str:String):Graphics;
	
	/**
	 * Draws the display object into the specified context ignoring its visible, alpha, shadow, and transform.
	 * Returns true if the draw was handled (useful for overriding functionality).
	 * 
	 * NOTE: This method is mainly for internal use, though it may be useful for advanced uses.
	 * @param	context	The canvas 2D context object to draw into.
	 * @param	data	Optional data that is passed to graphics command exec methods.
	 * 					When called from a Shape instance, the shape passes itself as the data parameter.
	 * 					This can be used by custom graphic commands to insert contextual data.
	 */
	public function draw(context:CanvasRenderingContext2D, data:Dynamic = null):Void;
	
	/**
	 * Draws only the path described for this Graphics instance, skipping any non-path instructions, including fill and stroke descriptions.
	 * Used for DisplayObject.mask to draw the clipping path, for example.
	 * 
	 * NOTE: This method is mainly for internal use, though it may be useful for advanced uses.
	 * @param	context The canvas 2D context object to draw into.
	 */
	public function drawAsPath(context:CanvasRenderingContext2D):Void;
	
	/**
	 * Draws a circle with the specified radius at (x, y).
	 * <code>
	 *  var g = new Graphics();
	 *     g.setStrokeStyle(1);
	 *     g.beginStroke(Graphics.getRGB(0,0,0));
	 *     g.beginFill(Graphics.getRGB(255,0,0));
	 *     g.drawCircle(0,0,3);
	 * 
	 *     var s = new Shape(g);
	 *     s.x = 100;
	 *     s.y = 100;
	 * 
	 *     stage.addChild(s);
	 *     stage.update();
	 * </code>
	 * A tiny API method "dc" also exists.
	 * @param	x		X coordinate center point of circle.
	 * @param	y		Y coordinate center point of circle.
	 * @param	radius	Radius of circle.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function drawCircle(x:Float, y:Float, radius:Float):Graphics;
	
	/**
	 * Draws an ellipse (oval) with a specified width (w) and height (h).
	 * Similar to drawCircle, except the width and height can be different.
	 * A tiny API method "de" also exists.
	 * @param	x The left coordinate point of the ellipse. Note that this is different from drawCircle which draws from center.
	 * @param	y The top coordinate point of the ellipse. Note that this is different from drawCircle which draws from the center.
	 * @param	w The height (horizontal diameter) of the ellipse. The horizontal radius will be half of this number.
	 * @param	h The width (vertical diameter) of the ellipse. The vertical radius will be half of this number.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function drawEllipse(x:Float, y:Float, w:Float, h:Float):Graphics;
	
	/**
	 * Draws a star if pointSize is greater than 0, or a regular polygon if pointSize is 0 with the specified number of points.
	 * For example, the following code will draw a familiar 5 pointed star shape centered at 100, 100 and with a radius of 50:
	 * <code>
	 * myGraphics.beginFill("#FF0").drawPolyStar(100, 100, 50, 5, 0.6, -90);
	 *  // Note: -90 makes the first point vertical
	 * </code>
	 * A tiny API method "dp" also exists.
	 * @param	x			Position of the center of the shape.
	 * @param	y			Position of the center of the shape.
	 * @param	radius		The outer radius of the shape.
	 * @param	sides		The number of points on the star or sides on the polygon.
	 * @param	pointSize	The depth or "pointy-ness" of the star points. A pointSize of 0 will draw a regular polygon (no points), a pointSize of 1 will draw nothing because the points are infinitely pointy.
	 * @param	angle		The angle of the first point / corner. For example a value of 0 will draw the first point directly to the right of the center.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function drawPolyStar(x:Float, y:Float, radius:Float, sides:Float, pointSize:Float, angle:Float):Graphics;
	
	/**
	 * Maps the familiar ActionScript drawRect() method to the functionally similar rect method.
	 * @param	x The x-coordinate of the upper-left corner of the rectangle.
	 * @param	y The y-coordinate of the upper-left corner of the rectangle.
	 * @param	w The width of the rectangle, in pixels.
	 * @param	h The height of the rectangle, in pixels.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function drawRect(x:Float, y:Float, w:Float, h:Float):Graphics;
	
	/**
	 * Draws a rounded rectangle with all corners with the specified radius.
	 * @param	x		The x-coordinate of the upper-left corner of the rectangle.
	 * @param	y		The y-coordinate of the upper-left corner of the rectangle.
	 * @param	w		The width of the rectangle, in pixels.
	 * @param	h		The height of the rectangle, in pixels.
	 * @param	radius	Corner radius.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function drawRoundRect(x:Float, y:Float, w:Float, h:Float, radius:Float):Graphics;
	
	/**
	 * Draws a rounded rectangle with different corner radii.
	 * Supports positive and negative corner radii.
	 * A tiny API method "rc" also exists.
	 * @param	x			The x-coordinate of the upper-left corner of the rectangle.
	 * @param	y			The y-coordinate of the upper-left corner of the rectangle.
	 * @param	w			The width of the rectangle, in pixels.
	 * @param	h			The height of the rectangle, in pixels.
	 * @param	radiusTL	Top left corner radius.
	 * @param	radiusTR	Top right corner radius.
	 * @param	radiusBR	Bottom right corner radius.
	 * @param	radiusBL	Bottom left corner radius.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function drawRoundRectComplex(x:Float, y:Float, w:Float, h:Float, radiusTL:Float, radiusTR:Float, radiusBR:Float, radiusBL:Float):Graphics;
	
	/**
	 * Ends the current sub-path, and begins a new one with no fill.
	 * Functionally identical to beginFill(null).
	 * A tiny API method "ef" also exists.
	 * @return The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function endFill():Graphics;
	
	/**
	 * Ends the current sub-path, and begins a new one with no stroke.
	 * Functionally identical to beginStroke(null).
	 * A tiny API method "es" also exists.
	 * @return The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function endStroke():Graphics;
	
	/**
	 * Use the instructions property instead.
	 */
	@:deprecated
	@:noCompletion
	public function getInstructions():Array<ICommand>;
	
	/**
	 * Returns true if this Graphics instance has no drawing commands.
	 * @return Returns true if this Graphics instance has no drawing commands.
	 */
	public function isEmpty():Bool;
	
	/**
	 * Draws a line from the current drawing point to the specified position, which become the new current drawing point.
	 * Note that you <b>must</b> call moveTo before the first lineTo().
	 * A tiny API method "lt" also exists.
	 * 
	 * For detailed information, read the whatwg spec.
	 * @param	x	The x coordinate the drawing point should draw to.
	 * @param	y	The y coordinate the drawing point should draw to.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function lineTo(x:Float, y:Float):Graphics;
	
	/**
	 * Moves the drawing point to the specified position.
	 * A tiny API method "mt" also exists.
	 * @param	x	The x coordinate the drawing point should move to.
	 * @param	y	The y coordinate the drawing point should move to.
	 * @return	The Graphics instance the method is called on (useful for chaining calls).
	 */
	public function moveTo(x:Float, y:Float):Graphics;
	
	/**
	 * Draws a quadratic curve from the current drawing point to (x, y) using the control point (cpx, cpy).
	 * For detailed information, read the whatwg spec.
	 * A tiny API method "qt" also exists.
	 * @param	cpx	The x-coordinate of the Bézier control point.
	 * @param	cpy	The y-coordinate of the Bézier control point.
	 * @param	x	The x-coordinate of the ending point.
	 * @param	y	The y-coordinate of the ending point.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function quadraticCurveTo(cpx:Float, cpy:Float, x:Float, y:Float):Graphics;
	
	/**
	 * Draws a rectangle at (x, y) with the specified width and height using the current fill and/or stroke.
	 * For detailed information, read the whatwg spec.
	 * A tiny API method "r" also exists.
	 * @param	x The x-coordinate of the upper-left corner of the rectangle.
	 * @param	y The y-coordinate of the upper-left corner of the rectangle.
	 * @param	w The width of the rectangle, in pixels.
	 * @param	h The height of the rectangle, in pixels.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function rect(x:Float, y:Float, w:Float, h:Float):Graphics;
	
	/**
	 * Sets or clears the stroke dash pattern.
	 * <code>
	 * myGraphics.setStrokeDash([20, 10], 0);
	 * </code>
	 * A tiny API method sd also exists.
	 * @param	segments	An array specifying the dash pattern, alternating between line and gap.
	 * 						For example, [20,10] would create a pattern of 20 pixel lines with 10 pixel gaps between them.
	 * 						Passing null or an empty array will clear the existing stroke dash.
	 * @param	offset		The offset of the dash pattern.
	 * 						For example, you could increment this value to create a "marching ants" effect.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function setStrokeDash(segments:Array<Float> = null, offset:Float = 0):Graphics;
	
	/**
	 * Sets the stroke style.
	 * Like all drawing methods, this can be chained, so you can define the stroke style and color in a single line of code like so:
	 * <code>
	 * myGraphics.setStrokeStyle(8,"round").beginStroke("#F00");
	 * </code>
	 * A tiny API method "ss" also exists.
	 * @param	thickness	The width of the stroke.
	 * @param	caps		Indicates the type of caps to use at the end of lines.
	 * 						One of butt, round, or square. Defaults to LineCapType.BUTT.
	 * 						Also accepts the values 0 (butt), 1 (round), and 2 (square) for use with the tiny API.
	 * @param	joints		Specifies the type of joints that should be used where two lines meet.
	 * 						One of bevel, round, or miter. Defaults to LineJoinType.MITER.
	 * 						Also accepts the values 0 (miter), 1 (round), and 2 (bevel) for use with the tiny API.
	 * @param	miterLimit	If joints is set to LineJoinType.MITER, then you can specify a miter limit ratio which controls at
	 * 						what point a mitered joint will be clipped.
	 * @param	ignoreScale	If true, the stroke will be drawn at the specified thickness regardless of active transformations.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function setStrokeStyle(	thickness:Float,
									?caps:EitherType<LineCapType, Int>,
									?joints:EitherType<LineJoinType, Int>,
									?miterLimit:Float = 10,
									?ignoreScale:Bool = false
	):Graphics;
	
	/**
	 * Stores all graphics commands so they won't be executed in future draws.
	 * Calling store() a second time adds to the existing store. This also affects drawAsPath().
	 * 
	 * This is useful in cases where you are creating vector graphics in an iterative manner (ex. generative art),
	 * so that only new graphics need to be drawn (which can provide huge performance benefits), but you wish to
	 * retain all of the vector instructions for later use (ex. scaling, modifying, or exporting).
	 * 
	 * Note that calling store() will force the active path (if any) to be ended in a manner similar to changing the fill or stroke.
	 * 
	 * For example, consider a application where the user draws lines with the mouse. As each line segment (or collection of segments)
	 * are added to a Shape, it can be rasterized using updateCache, and then stored, so that it can be redrawn at a different scale
	 * when the application is resized, or exported to SVG.
	 * <code>
	 * // set up cache:
	 * myShape.cache(0,0,500,500,scale);
	 * 
	 * // when the user drags, draw a new line:
	 * myShape.graphics.moveTo(oldX,oldY).lineTo(newX,newY);
	 * // then draw it into the existing cache:
	 * myShape.updateCache("source-over");
	 * // store the new line, so it isn't redrawn next time:
	 * myShape.store();
	 * 
	 * // then, when the window resizes, we can re-render at a different scale:
	 * // first, unstore all our lines:
	 * myShape.unstore();
	 * // then cache using the new scale:
	 * myShape.cache(0,0,500,500,newScale);
	 * // finally, store the existing commands again:
	 * myShape.store();
	 * </code>
	 * @return The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function store():Graphics;
	
	/**
	 * Unstores any graphics commands that were previously stored using store so that they will be executed in subsequent draw calls.
	 * @return The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function unstore ():Graphics;
	
	/**
	 * Returns a string representation of Graphics.
	 * @return A string representation of the instance.
	 */
	public function toString():String;
	
	
	
	//////////////////
	//   TINY API   //
	//////////////////
	
	/**
	 * Shortcut to arc.
	 * @param	x				The x-coordinate of the center of the circle.
	 * @param	y				The y-coordinate of the center of the circle.
	 * @param	radius			The radius of the circle.
	 * @param	startAngle		The starting angle, in radians (0 is at the 3 o'clock position of the arc's circle).
	 * @param	endAngle		The ending angle, in radians.
	 * @param	anticlockwise	Specifies whether the drawing should be counterclockwise or clockwise.
	 * 							False is default, and indicates clockwise, while true indicates counter-clockwise.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function a(x:Float, y:Float, radius:Float, startAngle:Float, endAngle:Float, anticlockwise:Bool):Graphics;
	
	/**
	 * Shortcut to arcTo.
	 * @param	x1		The x-coordinate of the first tangent.
	 * @param	y1		The y-coordinate of the first tangent.
	 * @param	x2		The x-coordinate of the second tangent.
	 * @param	y2		The y-coordinate of the second tangent.
	 * @param	radius	The radius of the arc.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function at(x1:Float, y1:Float, x2:Float, y2:Float, radius:Float):Graphics;
	
	/**
	 * Shortcut to beginBitmapFill.
	 * @param	image		The Image, Canvas, or Video object to use as the pattern.
	 * 						Must be loaded prior to creating a bitmap fill, or the fill will be empty.
	 * @param	repetition	Optional. Indicates whether to repeat the image in the fill area.
	 * 						One of RepeatType.REPEAT, RepeatType.REPEAT_X, RepeatType.REPEAT_Y, or RepeatType.NO_REPEAT.
	 * 						Defaults to RepeatType.REPEAT. Note that Firefox does not support RepeatType.REPEAT_X or
	 * 						RepeatType.REPEAT_Y (latest tests were in FF 20.0), and will default to RepeatType.REPEAT.
	 * @param	matrix		Optional. Specifies a transformation matrix for the bitmap fill.
	 * 						This transformation will be applied relative to the parent transform.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	@:overload(function(image:VideoElement, ?repetition:RepeatType, ?matrix:Matrix2D):Graphics{})
	@:overload(function(image:CanvasElement, ?repetition:RepeatType, ?matrix:Matrix2D):Graphics{})
	public function bf(image:ImageElement, ?repetition:RepeatType, ?matrix:Matrix2D):Graphics;
	
	/**
	 * Shortcut to beginBitmapStroke.
	 * @param	image		The Image, Canvas, or Video object to use as the pattern.
	 * 						Must be loaded prior to creating a bitmap fill, or the fill will be empty.
	 * @param	repetition	Optional. Indicates whether to repeat the image in the fill area.
	 * 						One of RepeatType.REPEAT, RepeatType.REPEAT_X, RepeatType.REPEAT_Y, or RepeatType.NO_REPEAT.
	 * 						Defaults to RepeatType.REPEAT.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	@:overload(function(image:VideoElement, ?repetition:RepeatType):Graphics{})
	@:overload(function(image:CanvasElement, ?repetition:RepeatType):Fill{})
	public function bs(image:ImageElement, ?repetition:RepeatType):Graphics;
	
	/**
	 * Shortcut to bezierCurveTo.
	 * @param	cp1x	The x-coordinate of the first Bézier control point.
	 * @param	cp1y	The y-coordinate of the first Bézier control point.
	 * @param	cp2x	The x-coordinate of the second Bézier control point.
	 * @param	cp2y	The y-coordinate of the second Bézier control point.
	 * @param	x		The x-coordinate of the ending point.
	 * @param	y		The y-coordinate of the ending point.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function bt(cp1x:Float, cp1y:Float, cp2x:Float, cp2y:Float, x:Float, y:Float):Graphics;
	
	/**
	 * Shortcut to clear.
	 * @return The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function c():Graphics;
	
	/**
	 * Shortcut to closePath.
	 * @return The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function cp():Graphics;
	
	/**
	 * Shortcut to drawCircle.
	 * @param	x		X coordinate center point of circle.
	 * @param	y		Y coordinate center point of circle.
	 * @param	radius	Radius of circle.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function dc(x:Float, y:Float, radius:Float):Graphics;
	
	/**
	 * Shortcut to drawEllipse.
	 * @param	x The left coordinate point of the ellipse. Note that this is different from drawCircle which draws from center.
	 * @param	y The top coordinate point of the ellipse. Note that this is different from drawCircle which draws from the center.
	 * @param	w The height (horizontal diameter) of the ellipse. The horizontal radius will be half of this number.
	 * @param	h The width (vertical diameter) of the ellipse. The vertical radius will be half of this number.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function de(x:Float, y:Float, w:Float, h:Float):Graphics;
	
	/**
	 * Shortcut to drawPolyStar.
	 * @param	x			Position of the center of the shape.
	 * @param	y			Position of the center of the shape.
	 * @param	radius		The outer radius of the shape.
	 * @param	sides		The number of points on the star or sides on the polygon.
	 * @param	pointSize	The depth or "pointy-ness" of the star points. A pointSize of 0 will draw a regular polygon (no points), a pointSize of 1 will draw nothing because the points are infinitely pointy.
	 * @param	angle		The angle of the first point / corner. For example a value of 0 will draw the first point directly to the right of the center.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function dp(x:Float, y:Float, radius:Float, sides:Float, pointSize:Float, angle:Float):Graphics;
	
	/**
	 * Shortcut to drawRect.
	 * @param	x The x-coordinate of the upper-left corner of the rectangle.
	 * @param	y The y-coordinate of the upper-left corner of the rectangle.
	 * @param	w The width of the rectangle, in pixels.
	 * @param	h The height of the rectangle, in pixels.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function dr(x:Float, y:Float, w:Float, h:Float):Graphics;
	
	/**
	 * Shortcut to endFill.
	 * @return The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function ef():Graphics;
	
	/**
	 * Shortcut to endStroke.
	 * @return The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function es():Graphics;
	
	/**
	 * Shortcut to beginFill.
	 * @param	color A CSS compatible color value (ex. "red", "#FF0000", or "rgba(255,0,0,0.5)"). Setting to null will result in no fill.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function f(color:String):Graphics;
	
	/**
	 * Shortcut to beginLinearGradientFill.
	 * @param	colors	An array of CSS compatible color values. For example, ["#F00","#00F"] would define a gradient drawing from red to blue.
	 * @param	ratios	An array of gradient positions which correspond to the colors. For example, [0.1, 0.9] would draw the first color to 10% then interpolating to the second color at 90%.
	 * @param	x0		The position of the first point defining the line that defines the gradient direction and size.
	 * @param	y0		The position of the first point defining the line that defines the gradient direction and size.
	 * @param	x1		The position of the second point defining the line that defines the gradient direction and size.
	 * @param	y1		The position of the second point defining the line that defines the gradient direction and size.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function lf(colors:Array<String>, ratios:Array<Float>, x0:Float, y0:Float, x1:Float, y1:Float):Graphics;
	
	/**
	 * Shortcut to beginLinearGradientStroke.
	 * @param	colors	An array of CSS compatible color values. For example, ["#F00","#00F"] would define a gradient drawing from red to blue.
	 * @param	ratios	An array of gradient positions which correspond to the colors. For example, [0.1, 0.9] would draw the first color to 10% then interpolating to the second color at 90%.
	 * @param	x0		The position of the first point defining the line that defines the gradient direction and size.
	 * @param	y0		The position of the first point defining the line that defines the gradient direction and size.
	 * @param	x1		The position of the second point defining the line that defines the gradient direction and size.
	 * @param	y1		The position of the second point defining the line that defines the gradient direction and size.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function ls(colors:Array<String>, ratios:Array<Float>, x0:Float, y0:Float, x1:Float, y1:Float):Graphics;
	
	/**
	 * Shortcut to lineTo.
	 * @param	x	The x coordinate the drawing point should draw to.
	 * @param	y	The y coordinate the drawing point should draw to.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function lt(x:Float, y:Float):Graphics;
	
	/**
	 * Shortcut to moveTo.
	 * @param	x	The x coordinate the drawing point should move to.
	 * @param	y	The y coordinate the drawing point should move to.
	 * @return	The Graphics instance the method is called on (useful for chaining calls).
	 */
	public function mt(x:Float, y:Float):Graphics;
	
	/**
	 * Shortcut to decodePath.
	 * @param	str	The path string to decode.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function p(str:String):Graphics;
	
	/**
	 * Shortcut to quadraticCurveTo / curveTo.
	 * @param	cpx	The x-coordinate of the Bézier control point.
	 * @param	cpy	The y-coordinate of the Bézier control point.
	 * @param	x	The x-coordinate of the ending point.
	 * @param	y	The y-coordinate of the ending point.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function qt(cpx:Float, cpy:Float, x:Float, y:Float):Graphics;
	
	/**
	 * Shortcut to rect.
	 * @param	x The x-coordinate of the upper-left corner of the rectangle.
	 * @param	y The y-coordinate of the upper-left corner of the rectangle.
	 * @param	w The width of the rectangle, in pixels.
	 * @param	h The height of the rectangle, in pixels.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function r(x:Float, y:Float, w:Float, h:Float):Graphics;
	
	/**
	 * Shortcut to drawRoundRectComplex.
	 * @param	x			The x-coordinate of the upper-left corner of the rectangle.
	 * @param	y			The y-coordinate of the upper-left corner of the rectangle.
	 * @param	w			The width of the rectangle, in pixels.
	 * @param	h			The height of the rectangle, in pixels.
	 * @param	radiusTL	Top left corner radius.
	 * @param	radiusTR	Top right corner radius.
	 * @param	radiusBR	Bottom right corner radius.
	 * @param	radiusBL	Bottom left corner radius.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function rc(x:Float, y:Float, w:Float, h:Float, radiusTL:Float, radiusTR:Float, radiusBR:Float, radiusBL:Float):Graphics;
	
	/**
	 * Shortcut to beginRadialGradientFill.
	 * @param	colors	An array of CSS compatible color values. For example, ["#F00","#00F"] would define a gradient drawing from red to blue.
	 * @param	ratios	An array of gradient positions which correspond to the colors. For example, [0.1, 0.9] would draw the first color to 10% then interpolating to the second color at 90%.
	 * @param	x0		Center position of the inner circle that defines the gradient.
	 * @param	y0		Center position of the inner circle that defines the gradient.
	 * @param	r0		Radius of the inner circle that defines the gradient.
	 * @param	x1		Center position of the outer circle that defines the gradient.
	 * @param	y1		Center position of the outer circle that defines the gradient.
	 * @param	r1		Radius of the outer circle that defines the gradient.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function rf(colors:Array<String>, ratios:Array<Float>, x0:Float, y0:Float, r0:Float, x1:Float, y1:Float, r1:Float):Graphics;
	
	/**
	 * Shortcut to drawRoundRect.
	 * @param	x		The x-coordinate of the upper-left corner of the rectangle.
	 * @param	y		The y-coordinate of the upper-left corner of the rectangle.
	 * @param	w		The width of the rectangle, in pixels.
	 * @param	h		The height of the rectangle, in pixels.
	 * @param	radius	Corner radius.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function rr(x:Float, y:Float, w:Float, h:Float, radius:Float):Graphics;
	
	/**
	 * Shortcut to beginRadialGradientStroke.
	 * @param	colors	An array of CSS compatible color values. For example, ["#F00","#00F"] would define a gradient drawing from red to blue.
	 * @param	ratios	An array of gradient positions which correspond to the colors. For example, [0.1, 0.9] would draw the first color to 10% then interpolating to the second color at 90%, then draw the second color to 100%.
	 * @param	x0		Center position of the inner circle that defines the gradient.
	 * @param	y0		Center position of the inner circle that defines the gradient.
	 * @param	r0		Radius of the inner circle that defines the gradient.
	 * @param	x1		Center position of the outer circle that defines the gradient.
	 * @param	y1		Center position of the outer circle that defines the gradient.
	 * @param	r1		Radius of the outer circle that defines the gradient.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function rs(colors:Array<String>, ratios:Array<Float>, x0:Float, y0:Float, r0:Float, x1:Float, y1:Float, r1:Float):Graphics;
	
	/**
	 * Shortcut to beginStroke.
	 * @param	color	A CSS compatible color value (ex. "#FF0000", "red", or "rgba(255,0,0,0.5)"). Setting to null will result in no stroke.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function s(color:String):Graphics;
	
	/**
	 * Shortcut to setStrokeDash.
	 * @param	segments	An array specifying the dash pattern, alternating between line and gap.
	 * 						For example, [20,10] would create a pattern of 20 pixel lines with 10 pixel gaps between them.
	 * 						Passing null or an empty array will clear the existing stroke dash.
	 * @param	offset		The offset of the dash pattern.
	 * 						For example, you could increment this value to create a "marching ants" effect.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function sd(segments:Array<Float> = null, offset:Float = 0):Graphics;
	
	/**
	 * Shortcut to setStrokeStyle.
	 * @param	thickness	The width of the stroke.
	 * @param	caps		Indicates the type of caps to use at the end of lines.
	 * 						One of butt, round, or square. Defaults to LineCapType.BUTT.
	 * 						Also accepts the values 0 (butt), 1 (round), and 2 (square) for use with the tiny API.
	 * @param	joints		Specifies the type of joints that should be used where two lines meet.
	 * 						One of bevel, round, or miter. Defaults to LineJoinType.MITER.
	 * 						Also accepts the values 0 (miter), 1 (round), and 2 (bevel) for use with the tiny API.
	 * @param	miterLimit	If joints is set to LineJoinType.MITER, then you can specify a miter limit ratio which controls at
	 * 						what point a mitered joint will be clipped.
	 * @param	ignoreScale	If true, the stroke will be drawn at the specified thickness regardless of active transformations.
	 * @return	The Graphics instance the method is called on (useful for chaining calls.)
	 */
	public function ss(thickness:Float, ?caps:EitherType<LineCapType, Int>, ?joints:EitherType<LineJoinType, Int>, ?miterLimit:Float = 10, ?ignoreScale:Bool = false):Graphics;
}