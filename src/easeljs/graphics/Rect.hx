package easeljs.graphics;

import js.html.CanvasRenderingContext2D;

/**
 * Draws a rectangle at (x, y) with the specified width and height using the current fill and/or stroke.
 * For detailed information, read the whatwg spec.
 * 
 * Documentation: https://www.createjs.com/docs/easeljs/classes/Graphics.Rect.html
 * Documentation: https://www.w3schools.com/tags/canvas_rect.asp
 * @author VolkovRA
 */
@:native("createjs.Graphics.Rect")
extern class Rect implements ICommand 
{
	/**
	 * The x-coordinate of the upper-left corner of the rectangle.
	 */
	public var x:Float;
	
	/**
	 * The y-coordinate of the upper-left corner of the rectangle.
	 */
	public var y:Float;
	
	/**
	 * The width of the rectangle, in pixels.
	 */
	public var w:Float;
	
	/**
	 * The height of the rectangle, in pixels.
	 */
	public var h:Float;
	
	/**
	 * Create a new Rect command.
	 * @param	x The x-coordinate of the upper-left corner of the rectangle.
	 * @param	y The y-coordinate of the upper-left corner of the rectangle.
	 * @param	w The width of the rectangle, in pixels.
	 * @param	h The height of the rectangle, in pixels.
	 */
	public function new(x:Float, y:Float, w:Float, h:Float);
	
	/**
	 * Execute the Graphics command in the provided Canvas context.
	 * @param	context	Provided Canvas context.
	 * @param	data	Optional data that is passed to graphics command exec methods.
	 * 					When called from a Shape instance, the shape passes itself as the data parameter.
	 * 					This can be used by custom graphic commands to insert contextual data.
	 */
	function exec(context:CanvasRenderingContext2D, data:Dynamic = null):Void;
}