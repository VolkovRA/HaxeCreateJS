package easeljs.graphics;

import js.html.CanvasRenderingContext2D;

/**
 * Draws an arc with the specified control points and radius.
 * For detailed information, read the whatwg spec.
 * 
 * Documentation: https://www.createjs.com/docs/easeljs/classes/Graphics.ArcTo.html
 * Documentation: https://www.w3schools.com/tags/canvas_arcto.asp
 * @author VolkovRA
 */
@:native("createjs.Graphics.ArcTo")
extern class ArcTo implements ICommand 
{
	/**
	 * The x-coordinate of the first tangent.
	 */
	public var x1:Float;
	
	/**
	 * The x-coordinate of the second tangent.
	 */
	public var x2:Float;
	
	/**
	 * The y-coordinate of the first tangent.
	 */
	public var y1:Float;
	
	/**
	 * The y-coordinate of the second tangent.
	 */
	public var y2:Float;
	
	/**
	 * The radius of the arc.
	 */
	public var radius:Float;
	
	/**
	 * Create a new ArcTo command.
	 * @param	x1		The x-coordinate of the first tangent.
	 * @param	y1		The y-coordinate of the first tangent.
	 * @param	x2		The x-coordinate of the second tangent.
	 * @param	y2		The y-coordinate of the second tangent.
	 * @param	radius	The radius of the arc.
	 */
	public function new(x1:Float, y1:Float, x2:Float, y2:Float, radius:Float);
	
	/**
	 * Execute the Graphics command in the provided Canvas context.
	 * @param	context Provided Canvas context.
	 */
	public function exec(context:CanvasRenderingContext2D):Void;
}