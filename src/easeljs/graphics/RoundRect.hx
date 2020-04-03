package easeljs.graphics;

import js.html.CanvasRenderingContext2D;

/**
 * Draws a rounded rectangle with different corner radii.
 * Supports positive and negative corner radii.
 * 
 * Documentation: https://www.createjs.com/docs/easeljs/classes/Graphics.RoundRect.html
 * @author VolkovRA
 */
@:native("createjs.Graphics.RoundRect")
extern class RoundRect implements ICommand 
{
	/**
	 * The x-coordinate of the upper-left corner of the rectangle.
	 */
	public var x:Float;
	
	/**
	 * The y-coordinate of the upper-left corner of the rectangle.
	 */
	public var y:Float;
	
	/**
	 * The width of the rectangle, in pixels.
	 */
	public var w:Float;
	
	/**
	 * The height of the rectangle, in pixels.
	 */
	public var h:Float;
	
	/**
	 * Top left corner radius.
	 */
	public var radiusTL:Float;
	
	/**
	 * Top right corner radius.
	 */
	public var radiusTR:Float;
	
	/**
	 * Bottom right corner radius.
	 */
	public var radiusBR:Float;
	
	/**
	 * Bottom left corner radius.
	 */
	public var radiusBL:Float;
	
	/**
	 * Create a new RoundRect command.
	 * @param	x			The x-coordinate of the upper-left corner of the rectangle.
	 * @param	y			The y-coordinate of the upper-left corner of the rectangle.
	 * @param	w			The width of the rectangle, in pixels.
	 * @param	h			The height of the rectangle, in pixels.
	 * @param	radiusTL	Top left corner radius.
	 * @param	radiusTR	Top right corner radius.
	 * @param	radiusBR	Bottom right corner radius.
	 * @param	radiusBL	Bottom left corner radius.
	 */
	public function new(x:Float, y:Float, w:Float, h:Float, radiusTL:Float, radiusTR:Float, radiusBR:Float, radiusBL:Float);
	
	/**
	 * Execute the Graphics command in the provided Canvas context.
	 * @param	context Provided Canvas context.
	 */
	public function exec(context:CanvasRenderingContext2D):Void;
}