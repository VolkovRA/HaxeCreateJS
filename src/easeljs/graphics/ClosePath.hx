package easeljs.graphics;

import js.html.CanvasRenderingContext2D;

/**
 * Closes the current path, effectively drawing a line from the current drawing point to the first
 * drawing point specified since the fill or stroke was last set.
 * 
 * Tip: Use the stroke() method to actually draw the path on the canvas.
 * Tip: Use the fill() method to fill the drawing (black is default). Use the fillStyle property to fill with another color/gradient.
 * 
 * Documentation: https://www.createjs.com/docs/easeljs/classes/Graphics.ClosePath.html
 * Documentation: https://www.w3schools.com/tags/canvas_closePath.asp
 * @author VolkovRA
 */
@:native("createjs.Graphics.ClosePath")
extern class ClosePath implements ICommand 
{
	/**
	 * Create a new ClosePath command.
	 */
	public function new();
	
	/**
	 * Execute the Graphics command in the provided Canvas context.
	 * @param	context	Provided Canvas context.
	 * @param	data	Optional data that is passed to graphics command exec methods.
	 * 					When called from a Shape instance, the shape passes itself as the data parameter.
	 * 					This can be used by custom graphic commands to insert contextual data.
	 */
	function exec(context:CanvasRenderingContext2D, data:Dynamic = null):Void;
}