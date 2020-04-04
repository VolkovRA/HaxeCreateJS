package easeljs.geom;

/**
 * Represents a rectangle as defined by the points (x, y) and (x+width, y+height).
 * Documentation: https://www.createjs.com/docs/easeljs/classes/Rectangle.html
 * @author VolkovRA
 */
@:native("createjs.Rectangle")
extern class Rectangle 
{
	/**
	 * X position.
	 * Default: 0
	 */
	public var x:Float;
	
	/**
	 * Y position.
	 * Default: 0
	 */
	public var y:Float;
	
	/**
	 * The width of the Rectangle.
	 * Default: 0
	 */
	public var width:Float;
	
	/**
	 * The height of the Rectangle.
	 * Default: 0
	 */
	public var height:Float;
	
	/**
	 * Create a new Rectangle.
	 * @param	x		X position.
	 * @param	y		Y position.
	 * @param	width	The width of the Rectangle.
	 * @param	height	The height of the Rectangle.
	 */
	public function new(x:Float = 0, y:Float = 0, width:Float = 0, height:Float = 0);
	
	/**
	 * Returns a clone of the Rectangle instance.
	 * @return	A clone of the Rectangle instance.
	 */
	public function clone():Rectangle;
	
	/**
	 * Returns true if this rectangle fully encloses the described point or rectangle.
	 * @param	x		X position of the point or rectangle.
	 * @param	y		Y position of the point or rectangle.
	 * @param	width	The width of the rectangle.
	 * @param	height	The height of the rectangle.
	 * @return	True if the described point or rectangle is contained within this rectangle.
	 */
	public function contains(x:Float, y:Float, width:Float = 0, height:Float = 0):Bool;
	
	/**
	 * Copies all properties from the specified rectangle to this rectangle. (Chainable)
	 * @param	rectangle The rectangle to copy properties from.
	 * @return	This rectangle. Useful for chaining method calls.
	 */
	public function copy(rectangle:Rectangle):Rectangle;
	
	/**
	 * Extends the rectangle's bounds to include the described point or rectangle. (Chainable)
	 * @param	x		X position of the point or rectangle.
	 * @param	y		Y position of the point or rectangle.
	 * @param	width	The width of the rectangle.
	 * @param	height	The height of the rectangle.
	 * @return	This instance. Useful for chaining method calls.
	 */
	public function extend(x:Float, y:Float, width:Float = 0, height:Float = 0):Rectangle;
	
	/**
	 * Returns a new rectangle which describes the intersection (overlap) of this rectangle andthe specified rectangle, or null if they do not intersect.
	 * @param	rectangle The rectangle to calculate an intersection with.
	 * @return	A new rectangle describing the intersection or null.
	 */
	public function intersection(rectangle:Rectangle):Rectangle;
	
	/**
	 * Returns true if the specified rectangle intersects (has any overlap) with this rectangle.
	 * @param	rectangle The rectangle to compare.
	 * @return	True if the rectangles intersect.
	 */
	public function intersects(rectangle:Rectangle):Bool;
	
	/**
	 * Returns true if the width or height are equal or less than 0.
	 * @return	True if the rectangle is empty.
	 */
	public function isEmpty():Bool;
	
	/**
	 * Adds the specified padding to the rectangle's bounds. (Chainable)
	 * @param	top		Padding top.
	 * @param	left	Padding left.
	 * @param	bottom	Padding bottom.
	 * @param	right	Padding right.
	 * @return	This instance. Useful for chaining method calls.
	 */
	public function pad(top:Float, left:Float, bottom:Float, right:Float):Rectangle;
	
	/**
	 * Sets the specified values on this instance. (Chainable)
	 * @param	x		X position.
	 * @param	y		Y position.
	 * @param	width	The width of the Rectangle.
	 * @param	height	The height of the Rectangle.
	 * @return	This instance. Useful for chaining method calls.
	 */
	public function setValues(x:Float = 0, y:Float = 0, width:Float = 0, height:Float = 0):Rectangle;
	
	/**
	 * Returns a new rectangle which contains this rectangle and the specified rectangle.
	 * @param	rectangle The rectangle to calculate a union with.
	 * @return	A new rectangle describing the union.
	 */
	public function union(rectangle:Rectangle):Rectangle;
	
	/**
	 * Returns a string representation of this Rectangle.
	 * @return	A string representation of the instance.
	 */
	public function toString():String;
}