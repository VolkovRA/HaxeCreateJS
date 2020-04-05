package createjs.graphics;

import js.html.CanvasRenderingContext2D;

/**
 * Draws a circle with the specified radius at (x, y).
 * Documentation: https://www.createjs.com/docs/easeljs/classes/Graphics.Circle.html
 * Documentation: https://www.w3schools.com/tags/canvas_arc.asp
 * @author VolkovRA
 */
@:native("createjs.Graphics.Circle")
extern class Circle implements ICommand 
{
	/**
	 * Create a new Circle command.
	 * @param	x		X Coordinate center point of circle.
	 * @param	y		Y Coordinate center point of circle.
	 * @param	radius	Radius of circle.
	 */
	public function new(x:Float, y:Float, radius:Float);
	
	/**
	 * X Coordinate center point of circle.
	 */
	public var x:Float;
	
	/**
	 * Y Coordinate center point of circle.
	 */
	public var y:Float;
	
	/**
	 * Radius of circle.
	 */
	public var radius:Float;
	
	/**
	 * Execute the Graphics command in the provided Canvas context.
	 * @param	context	Provided Canvas context.
	 * @param	data	Optional data that is passed to graphics command exec methods.
	 * 					When called from a Shape instance, the shape passes itself as the data parameter.
	 * 					This can be used by custom graphic commands to insert contextual data.
	 */
	function exec(context:CanvasRenderingContext2D, data:Dynamic = null):Void;
}