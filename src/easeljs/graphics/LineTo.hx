package easeljs.graphics;

import js.html.CanvasRenderingContext2D;

/**
 * Draws a line from the current drawing point to the specified position, which become the new current drawing point.
 * Note that you must call moveTo before the first lineTo().
 * 
 * Tip: Use the stroke() method to actually draw the path on the canvas.
 * 
 * Documentation: https://www.createjs.com/docs/easeljs/classes/Graphics.LineTo.html
 * Documentation: https://www.w3schools.com/tags/canvas_lineto.asp
 * @author VolkovRA
 */
@:native("createjs.Graphics.LineTo")
extern class LineTo implements ICommand 
{
	/**
	 * The x coordinate the drawing point should draw to.
	 */
	public var x:Float;
	
	/**
	 * The y coordinate the drawing point should draw to.
	 */
	public var y:Float;
	
	/**
	 * Create a new LineTo command.
	 * @param	x The x coordinate the drawing point should draw to.
	 * @param	y The y coordinate the drawing point should draw to.
	 */
	public function new(x:Float, y:Float);
	
	/**
	 * Execute the Graphics command in the provided Canvas context.
	 * @param	context	Provided Canvas context.
	 * @param	data	Optional data that is passed to graphics command exec methods.
	 * 					When called from a Shape instance, the shape passes itself as the data parameter.
	 * 					This can be used by custom graphic commands to insert contextual data.
	 */
	function exec(context:CanvasRenderingContext2D, data:Dynamic = null):Void;
}