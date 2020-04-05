package createjs.graphics;

import js.html.CanvasRenderingContext2D;

/**
 * Draws a star if pointSize is greater than 0, or a regular polygon if pointSize is 0 with the specified number of points.
 * For example, the following code will draw a familiar 5 pointed star shape centered at 100, 100 and with a radius of 50:
 * <code>
 * myGraphics.beginFill("#FF0").drawPolyStar(100, 100, 50, 5, 0.6, -90);
 * // Note: -90 makes the first point vertical
 * </code>
 * 
 * Documentation: https://www.createjs.com/docs/easeljs/classes/Graphics.PolyStar.html
 * @author VolkovRA
 */
@:native("createjs.Graphics.PolyStar")
extern class PolyStar implements ICommand 
{
	/**
	 * Create a new PolyStar command.
	 * @param	x			Position of the center of the shape.
	 * @param	y			Position of the center of the shape.
	 * @param	radius		The outer radius of the shape.
	 * @param	sides		The number of points on the star or sides on the polygon.
	 * @param	pointSize	The depth or "pointy-ness" of the star points. A pointSize of 0 will draw a regular polygon (no points), a pointSize of 1 will draw nothing because the points are infinitely pointy.
	 * @param	angle		The angle of the first point / corner. For example a value of 0 will draw the first point directly to the right of the center.
	 */
	public function new(x:Float, y:Float, radius:Float, sides:Float, pointSize:Float, angle:Float);
	
	/**
	 * Position of the center of the shape.
	 */
	public var x:Float;
	
	/**
	 * Position of the center of the shape.
	 */
	public var y:Float;
	
	/**
	 * The outer radius of the shape.
	 */
	public var radius:Float;
	
	/**
	 * The number of points on the star or sides on the polygon.
	 */
	public var sides:Float;
	
	/**
	 * The depth or "pointy-ness" of the star points.
	 * A pointSize of 0 will draw a regular polygon (no points), a pointSize of 1 will draw nothing because the points are infinitely pointy.
	 */
	public var pointSize:Float;
	
	/**
	 * The angle of the first point / corner.
	 * For example a value of 0 will draw the first point directly to the right of the center.
	 */
	public var angle:Float;
	
	/**
	 * Execute the Graphics command in the provided Canvas context.
	 * @param	context	Provided Canvas context.
	 * @param	data	Optional data that is passed to graphics command exec methods.
	 * 					When called from a Shape instance, the shape passes itself as the data parameter.
	 * 					This can be used by custom graphic commands to insert contextual data.
	 */
	function exec(context:CanvasRenderingContext2D, data:Dynamic = null):Void;
}