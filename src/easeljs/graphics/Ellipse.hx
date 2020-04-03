package easeljs.graphics;

import js.html.CanvasRenderingContext2D;

/**
 * Draws an ellipse (oval) with a specified width (w) and height (h).
 * Similar to drawCircle, except the width and height can be different.
 * 
 * Documentation: https://www.createjs.com/docs/easeljs/classes/Graphics.Ellipse.html
 * @author VolkovRA
 */
@:native("createjs.Graphics.Ellipse")
extern class Ellipse implements ICommand 
{
	/**
	 * The left coordinate point of the ellipse.
	 * Note that this is different from drawCircle which draws from center.
	 */
	public var x:Float;
	
	/**
	 * The top coordinate point of the ellipse.
	 * Note that this is different from drawCircle which draws from the center.
	 */
	public var y:Float;
	
	/**
	 * The height (horizontal diameter) of the ellipse.
	 * The horizontal radius will be half of this number.
	 */
	public var w:Float;
	
	/**
	 * The width (vertical diameter) of the ellipse.
	 * The vertical radius will be half of this number.
	 */
	public var h:Float;
	
	/**
	 * Create a new Ellipse command.
	 * @param	x The left coordinate point of the ellipse. Note that this is different from drawCircle which draws from center.
	 * @param	y The top coordinate point of the ellipse. Note that this is different from drawCircle which draws from the center.
	 * @param	w The height (horizontal diameter) of the ellipse. The horizontal radius will be half of this number.
	 * @param	h The width (vertical diameter) of the ellipse. The vertical radius will be half of this number.
	 */
	public function new(x:Float, y:Float, w:Float, h:Float);
	
	/**
	 * Execute the Graphics command in the provided Canvas context.
	 * @param	context	Provided Canvas context.
	 * @param	data	Optional data that is passed to graphics command exec methods.
	 * 					When called from a Shape instance, the shape passes itself as the data parameter.
	 * 					This can be used by custom graphic commands to insert contextual data.
	 */
	function exec(context:CanvasRenderingContext2D, data:Dynamic = null):Void;
}