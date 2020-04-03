package easeljs.graphics;

import js.html.CanvasRenderingContext2D;

/**
 * The bezierCurveTo() method adds a point to the current path by using the specified control
 * points that represent a cubic Bézier curve.
 * 
 * A cubic bezier curve requires three points. The first two points are control points that are
 * used in the cubic Bézier calculation and the last point is the ending point for the curve.
 * The starting point for the curve is the last point in the current path. If a path does not exist,
 * use the beginPath() and moveTo() methods to define a starting point.
 * 
 * Documentation: https://www.createjs.com/docs/easeljs/classes/Graphics.BezierCurveTo.html
 * Documentation: https://www.w3schools.com/tags/canvas_BezierCurveTo.asp
 * @author VolkovRA
 */
@:native("createjs.Graphics.BezierCurveTo")
extern class BezierCurveTo implements ICommand 
{
	/**
	 * The x-coordinate of the first Bézier control point.
	 */
	public var cp1x:Float;
	
	/**
	 * The y-coordinate of the first Bézier control point.
	 */
	public var cp1y:Float;
	
	/**
	 * The x-coordinate of the second Bézier control point.
	 */
	public var cp2x:Float;
	
	/**
	 * The y-coordinate of the second Bézier control point.
	 */
	public var cp2y:Float;
	
	/**
	 * The x-coordinate of the ending point.
	 */
	public var x:Float;
	
	/**
	 * The y-coordinate of the ending point.
	 */
	public var y:Float;
	
	/**
	 * Create a new BezierCurveTo command.
	 * @param	cp1x	The x-coordinate of the first Bézier control point.
	 * @param	cp1y	The y-coordinate of the first Bézier control point.
	 * @param	cp2x	The x-coordinate of the second Bézier control point.
	 * @param	cp2y	The y-coordinate of the second Bézier control point.
	 * @param	x		The x-coordinate of the ending point.
	 * @param	y		The y-coordinate of the ending point.
	 */
	public function new(cp1x:Float, cp1y:Float, cp2x:Float, cp2y:Float, x:Float, y:Float);
	
	/**
	 * Execute the Graphics command in the provided Canvas context.
	 * @param	context	Provided Canvas context.
	 * @param	data	Optional data that is passed to graphics command exec methods.
	 * 					When called from a Shape instance, the shape passes itself as the data parameter.
	 * 					This can be used by custom graphic commands to insert contextual data.
	 */
	function exec(context:CanvasRenderingContext2D, data:Dynamic = null):Void;
}