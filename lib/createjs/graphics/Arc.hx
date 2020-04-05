package createjs.graphics;

import js.html.CanvasRenderingContext2D;

/**
 * Draws an arc defined by the radius, startAngle and endAngle arguments, centered at the position (x, y).
 * For example, to draw a full circle with a radius of 20 centered at (100, 100):
 * <code>
 * new Arc(100, 100, 20, 0, Math.PI*2);
 * </code>
 * For detailed information, read the whatwg spec.
 * 
 * Documentation: https://www.createjs.com/docs/easeljs/classes/Graphics.Arc.html
 * Documentation: https://www.w3schools.com/tags/canvas_arc.asp
 * @author VolkovRA
 */
@:native("createjs.Graphics.Arc")
extern class Arc implements ICommand 
{
	/**
	 * Create a new Arc command.
	 * @param	x				The x-coordinate of the center of the circle.
	 * @param	y				The y-coordinate of the center of the circle.
	 * @param	radius			The radius of the circle.
	 * @param	startAngle		The starting angle, in radians (0 is at the 3 o'clock position of the arc's circle).
	 * @param	endAngle		The ending angle, in radians.
	 * @param	anticlockwise	Specifies whether the drawing should be counterclockwise or clockwise.
	 * 							False is default, and indicates clockwise, while true indicates counter-clockwise.
	 */
	public function new(x:Float, y:Float, radius:Float, startAngle:Float, endAngle:Float, anticlockwise:Bool = false);
	
	/**
	 * The x-coordinate of the center of the circle.
	 */
	public var x:Float;
	
	/**
	 * The y-coordinate of the center of the circle.
	 */
	public var y:Float;
	
	/**
	 * The radius of the circle.
	 */
	public var radius:Float;
	
	/**
	 * The starting angle, in radians (0 is at the 3 o'clock position of the arc's circle).
	 */
	public var startAngle:Float;
	
	/**
	 * The ending angle, in radians.
	 */
	public var endAngle:Float;
	
	/**
	 * Specifies whether the drawing should be counterclockwise or clockwise.
	 * False is default, and indicates clockwise, while true indicates counter-clockwise.
	 */
	public var anticlockwise:Bool;
	
	/**
	 * Execute the Graphics command in the provided Canvas context.
	 * @param	context	Provided Canvas context.
	 * @param	data	Optional data that is passed to graphics command exec methods.
	 * 					When called from a Shape instance, the shape passes itself as the data parameter.
	 * 					This can be used by custom graphic commands to insert contextual data.
	 */
	function exec(context:CanvasRenderingContext2D, data:Dynamic = null):Void;
}