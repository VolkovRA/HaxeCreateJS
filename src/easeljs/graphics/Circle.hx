package easeljs.graphics;

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
	 * Create a new Circle command.
	 * @param	x		X Coordinate center point of circle.
	 * @param	y		Y Coordinate center point of circle.
	 * @param	radius	Radius of circle.
	 */
	public function new(x:Float, y:Float, radius:Float);
	
	/**
	 * Execute the Graphics command in the provided Canvas context.
	 * @param	context Provided Canvas context.
	 */
	public function exec(context:CanvasRenderingContext2D):Void;
}