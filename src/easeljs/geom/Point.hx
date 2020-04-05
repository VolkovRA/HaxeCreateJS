package easeljs.geom;

import haxe.extern.EitherType;

/**
 * Represents a point on a 2 dimensional x / y coordinate system.
 * Documentation: https://www.createjs.com/docs/easeljs/classes/Point.html
 * @author VolkovRA
 */
@:native("createjs.Point")
extern class Point 
{
	/**
	 * Create a new Point.
	 * @param	x X position.
	 * @param	y Y position.
	 */
	public function new(x:Float = 0, y:Float = 0);
	
	
	
	////////////////
	//   STATIC   //
	////////////////
	
	/**
	 * Determine a point between two specified points.
	 * The parameter f determines where the new interpolated point is located relative to the two end points specified by parameters pt1 and pt2:
	 *   1. The closer the value of the parameter f is to 1.0, the closer the interpolated point is to the first point (parameter pt1).
	 *   2. The closer the value of the parameter f is to 0, the closer the interpolated point is to the second point (parameter pt2).
	 * @param	point1	The first point as a Point or generic object.
	 * @param	point2	The second point as a Point or generic object.
	 * @param	f		The level of interpolation between the two points. Indicates where the new point will be, along the line between pt1 and pt2. If f=1, pt1 is returned; if f=0, pt2 is returned.
	 * @param	point	An object to copy the result into. If omitted, a new Point will be returned.
	 * @return	A new interpolated Point, or the pt passed in the 4th parameter with the interpolated values.
	 */
	static public function interpolate(point1:EitherType<Point, Dynamic>, point2:EitherType<Point, Dynamic>, f:Float, point:EitherType<Point, Dynamic> = null):Point;
	
	/**
	 * Converts a pair of polar coordinates to a Cartesian point coordinate.
	 * @param	len		The length coordinate of the polar pair.
	 * @param	angle	The angle, in radians, of the polar pair.
	 * @param	point	An object to copy the result into. If omitted a new Point will be returned.
	 * @return	The new, interpolated point.
	 */
	static public function polar(len:Float, angle:Float, point:EitherType<Point, Dynamic> = null):Point;
	
	
	
	////////////////////
	//   PROPERTIES   //
	////////////////////
	
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
	
	
	
	/////////////////
	//   METHODS   //
	/////////////////
	
	/**
	 * Returns a clone of the Point instance.
	 * @return	A clone of the Point instance.
	 */
	public function clone():Point;
	
	/**
	 * Copies all properties from the specified point to this point. (Chainable)
	 * @param	point The point to copy properties from.
	 * @return	This point. Useful for chaining method calls.
	 */
	public function copy(point:Point):Point;
	
	/**
	 * Offsets the Point object by the specified amount. (Chainable)
	 *   1. The value of dx is added to the original value of x to create the new x value.
	 *   2. The value of dy is added to the original value of y to create the new y value.
	 * @param	dx The amount by which to offset the horizontal coordinate, x.
	 * @param	dy The amount by which to offset the vertical coordinate, y.
	 * @return	This instance. Useful for chaining method calls.
	 */
	public function offset(dx:Float, dy:Float):Point;
	
	/**
	 * Sets the specified values on this instance. (Chainable)
	 * @param	x X position.
	 * @param	y Y position.
	 * @return	This instance. Useful for chaining method calls.
	 */
	public function setValues(x:Float = 0, y:Float = 0):Point;
	
	/**
	 * Returns a string representation of this Point.
	 * @return	A string representation of the instance.
	 */
	public function toString():String;
}