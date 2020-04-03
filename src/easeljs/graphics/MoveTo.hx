package easeljs.graphics;

import js.html.CanvasRenderingContext2D;

/**
 * Moves the drawing point to the specified position.
 * The moveTo() method moves the path to the specified point in the canvas, without creating a line.
 * 
 * Tip: Use the stroke() method to actually draw the path on the canvas.
 * 
 * Documentation: https://www.createjs.com/docs/easeljs/classes/Graphics.MoveTo.html
 * Documentation: https://www.w3schools.com/tags/canvas_moveto.asp
 * @author VolkovRA
 */
@:native("createjs.Graphics.MoveTo")
extern class MoveTo implements ICommand 
{
	/**
	 * The x-coordinate of where to move the path to.
	 */
	public var x:Float;
	
	/**
	 * The y-coordinate of where to move the path to.
	 */
	public var y:Float;
	
	/**
	 * Create a new MoveTo command.
	 * @param	x The x-coordinate of where to move the path to.
	 * @param	y The y-coordinate of where to move the path to.
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