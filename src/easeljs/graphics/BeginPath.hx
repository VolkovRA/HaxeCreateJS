package easeljs.graphics;

import js.html.CanvasRenderingContext2D;

/**
 * The BeginPath command begins a path, or resets the current path.
 * Documentation: https://www.createjs.com/docs/easeljs/classes/Graphics.BeginPath.html
 * Documentation: https://www.w3schools.com/tags/canvas_beginPath.asp
 * @author VolkovRA
 */
@:native("createjs.Graphics.BeginPath")
extern class BeginPath implements ICommand 
{
	/**
	 * Create a new BeginPath command.
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