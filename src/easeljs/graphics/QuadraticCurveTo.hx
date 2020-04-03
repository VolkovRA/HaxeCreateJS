package easeljs.graphics;

import js.html.CanvasRenderingContext2D;

/**
 * Draws a quadratic curve from the current drawing point to (x, y) using the control point (cpx, cpy).
 * The quadraticCurveTo() method adds a point to the current path by using the specified control points
 * that represent a quadratic Bézier curve.
 * 
 * A quadratic Bézier curve requires two points. The first point is a control point that is used in the
 * quadratic Bézier calculation and the second point is the ending point for the curve. The starting point
 * for the curve is the last point in the current path. If a path does not exist, use the beginPath() and
 * moveTo() methods to define a starting point.
 * 
 * Tip: Check out the bezierCurveTo() method. It has two control-points instead of one.
 * 
 * Documentation: https://www.createjs.com/docs/easeljs/classes/Graphics.QuadraticCurveTo.html
 * Documentation: https://www.w3schools.com/tags/canvas_quadraticCurveTo.asp
 * @author VolkovRA
 */
@:native("createjs.Graphics.QuadraticCurveTo")
extern class QuadraticCurveTo implements ICommand 
{
	/**
	 * The x-coordinate of the ending point.
	 */
	public var x:Float;
	
	/**
	 * The y-coordinate of the ending point.
	 */
	public var y:Float;
	
	/**
	 * The x-coordinate of the Bézier control point.
	 */
	public var cpx:Float;
	
	/**
	 * The y-coordinate of the Bézier control point.
	 */
	public var cpy:Float;
	
	/**
	 * Create a new QuadraticCurveTo command.
	 * @param	cpx	The x-coordinate of the Bézier control point.
	 * @param	cpy	The y-coordinate of the Bézier control point.
	 * @param	x	The x-coordinate of the ending point.
	 * @param	y	The y-coordinate of the ending point.
	 */
	public function new(cpx:Float, cpy:Float, x:Float, y:Float);
	
	/**
	 * Execute the Graphics command in the provided Canvas context.
	 * @param	context	Provided Canvas context.
	 * @param	data	Optional data that is passed to graphics command exec methods.
	 * 					When called from a Shape instance, the shape passes itself as the data parameter.
	 * 					This can be used by custom graphic commands to insert contextual data.
	 */
	function exec(context:CanvasRenderingContext2D, data:Dynamic = null):Void;
}