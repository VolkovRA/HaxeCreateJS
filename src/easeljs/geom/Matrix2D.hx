package easeljs.geom;

/**
 * Represents an affine transformation matrix, and provides tools for constructing and concatenating matrices.
 * This matrix can be visualized as:
 * [ a  c  tx
 *   b  d  ty
 *   0  0  1  ]
 * Note the locations of b and c.
 * Documentation: https://www.createjs.com/docs/easeljs/classes/Matrix2D.html
 * @author VolkovRA
 */
@:native("createjs.Matrix2D")
extern class Matrix2D 
{
	/**
	 * Create a new DisplayObject.
	 * @param	a	Specifies the a property for the new matrix.
	 * @param	b	Specifies the b property for the new matrix.
	 * @param	c	Specifies the c property for the new matrix.
	 * @param	d	Specifies the d property for the new matrix.
	 * @param	tx	Specifies the tx property for the new matrix.
	 * @param	ty	Specifies the ty property for the new matrix.
	 */
	public function new(a:Float = 1, b:Float = 0, c:Float = 0, d:Float = 1, tx:Float = 0, ty:Float = 0);
	
	
	
	////////////////
	//   STATIC   //
	////////////////
	
	/**
	 * Multiplier for converting degrees to radians. (Math.PI/180)
	 * Used internally by Matrix2D.
	 */
	static public var DEG_TO_RAD(default, null):Float;
	
	/**
	 * An identity matrix, representing a null transformation.
	 */
	static public var identity(default, null):Matrix2D;
	
	
	
	////////////////////
	//   PROPERTIES   //
	////////////////////
	
	/**
	 * Position (0, 0) in a 3x3 affine transformation matrix.
	 */
	public var a:Float;
	
	/**
	 * Position (0, 1) in a 3x3 affine transformation matrix.
	 */
	public var b:Float;
	
	/**
	 * Position (1, 0) in a 3x3 affine transformation matrix.
	 */
	public var c:Float;
	
	/**
	 * Position (1, 1) in a 3x3 affine transformation matrix.
	 */
	public var d:Float;
	
	/**
	 * Position (2, 0) in a 3x3 affine transformation matrix.
	 */
	public var tx:Float;
	
	/**
	 * Position (2, 1) in a 3x3 affine transformation matrix.
	 */
	public var ty:Float;
	
	
	
	/////////////////
	//   METHODS   //
	/////////////////
	
	/**
	 * Appends the specified matrix properties to this matrix.
	 * All parameters are required. This is the equivalent of multiplying (this matrix) * (specified matrix).
	 * @param	a	Specifies the a property for the matrix.
	 * @param	b	Specifies the b property for the matrix.
	 * @param	c	Specifies the c property for the matrix.
	 * @param	d	Specifies the d property for the matrix.
	 * @param	tx	Specifies the ty property for the matrix.
	 * @param	ty	Specifies the ty property for the matrix.
	 * @return	This matrix. Useful for chaining method calls.
	 */
	public function append(a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):Matrix2D;
	
	/**
	 * Appends the specified matrix to this matrix.
	 * This is the equivalent of multiplying (this matrix) * (specified matrix).
	 * @param	matrix Matrix.
	 * @return	This matrix. Useful for chaining method calls.
	 */
	public function appendMatrix(matrix:Matrix2D):Matrix2D;
	
	/**
	 * Generates matrix properties from the specified display object transform properties, and appends them to this matrix.
	 * For example, you can use this to generate a matrix representing the transformations of a display object:
	 * <code>
	 * var mtx = new createjs.Matrix2D();
	 * mtx.appendTransform(o.x, o.y, o.scaleX, o.scaleY, o.rotation);
	 * </code>
	 * @param	x			Object property: x
	 * @param	y			Object property: y
	 * @param	scaleX		Object property: scaleX
	 * @param	scaleY		Object property: scaleY
	 * @param	rotation	Object property: rotation
	 * @param	skewX		Object property: skewX
	 * @param	skewY		Object property: skewY
	 * @param	regX		Object property: regX
	 * @param	regY		Object property: regY
	 * @return	This matrix. Useful for chaining method calls.
	 */
	public function appendTransform(x:Float, y:Float, scaleX:Float, scaleY:Float, rotation:Float, skewX:Float, skewY:Float, ?regX:Float, ?regY:Float):Matrix2D;
	
	/**
	 * Returns a clone of the Matrix2D instance.
	 * @return A clone of the Matrix2D instance.
	 */
	public function clone():Matrix2D;
	
	/**
	 * Copies all properties from the specified matrix to this matrix.
	 * @param	matrix The matrix to copy properties from.
	 * @return	This matrix. Useful for chaining method calls.
	 */
	public function copy(matrix:Matrix2D):Matrix2D;
	
	/**
	 * Decomposes the matrix into transform properties (x, y, scaleX, scaleY, and rotation).
	 * Note that these values may not match the transform properties you used to generate the matrix,
	 * though they will produce the same visual results.
	 * @param	target The object to apply the transform properties to. If null, then a new object will be returned.
	 * @return	The target, or a new generic object with the transform properties applied.
	 */
	public function decompose(target:Dynamic):Dynamic;
	
	/**
	 * Returns true if this matrix is equal to the specified matrix (all property values are equal).
	 * @param	matrix The matrix to compare.
	 * @return	Returns true if this matrix is equal to the specified matrix.
	 */
	public function equals(matrix:Matrix2D):Bool;
	
	/**
	 * Sets the properties of the matrix to those of an identity matrix (one that applies a null transformation).
	 * @return This matrix. Useful for chaining method calls.
	 */
	public function identity():Matrix2D;
	
	/**
	 * Inverts the matrix, causing it to perform the opposite transformation.
	 * @return This matrix. Useful for chaining method calls.
	 */
	public function invert():Matrix2D;
	
	/**
	 * Returns true if the matrix is an identity matrix.
	 */
	public function isIdentity():Bool;
	
	/**
	 * Prepends the specified matrix properties to this matrix.
	 * This is the equivalent of multiplying (specified matrix) * (this matrix). All parameters are required.
	 * @param	a	Specifies the a property for the matrix.
	 * @param	b	Specifies the b property for the matrix.
	 * @param	c	Specifies the c property for the matrix.
	 * @param	d	Specifies the d property for the matrix.
	 * @param	tx	Specifies the ty property for the matrix.
	 * @param	ty	Specifies the ty property for the matrix.
	 * @return	This matrix. Useful for chaining method calls.
	 */
	public function prepend(a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):Matrix2D;
	
	/**
	 * Prepends the specified matrix to this matrix.
	 * This is the equivalent of multiplying (specified matrix) * (this matrix).
	 * For example, you could calculate the combined transformation for a child object using:
	 * <code>
	 * var o = myDisplayObject;
	 * var mtx = o.getMatrix();
	 * while (o = o.parent) {
	 *     // prepend each parent's transformation in turn:
	 *     o.prependMatrix(o.getMatrix());
	 * }
	 * </code>
	 * @param	matrix Matrix.
	 * @return	This matrix. Useful for chaining method calls.
	 */
	public function prependMatrix(matrix:Matrix2D):Matrix2D;
	
	/**
	 * Generates matrix properties from the specified display object transform properties, and prepends them to this matrix.
	 * For example, you could calculate the combined transformation for a child object.
	 * @param	x			Object property: x
	 * @param	y			Object property: y
	 * @param	scaleX		Object property: scaleX
	 * @param	scaleY		Object property: scaleY
	 * @param	rotation	Object property: rotation
	 * @param	skewX		Object property: skewX
	 * @param	skewY		Object property: skewY
	 * @param	regX		Object property: regX
	 * @param	regY		Object property: regY
	 * @return	This matrix. Useful for chaining method calls.
	 */
	public function prependTransform(x:Float, y:Float, scaleX:Float, scaleY:Float, rotation:Float, skewX:Float, skewY:Float, ?regX:Float, ?regY:Float):Matrix2D;
	
	/**
	 * Applies a clockwise rotation transformation to the matrix.
	 * @param	angle The angle to rotate by, in degrees. To use a value in radians, multiply it by <code>180/Math.PI</code>.
	 * @return	This matrix. Useful for chaining method calls.
	 */
	public function rotate(angle:Float):Matrix2D;
	
	/**
	 * Applies a scale transformation to the matrix.
	 * @param	x The amount to scale horizontally. E.G. a value of 2 will double the size in the X direction, and 0.5 will halve it.
	 * @param	y The amount to scale vertically.
	 * @return	This matrix. Useful for chaining method calls.
	 */
	public function scale(x:Float, y:Float):Matrix2D;
	
	/**
	 * Sets the specified values on this instance.
	 * @param	a	Specifies the a property for the new matrix.
	 * @param	b	Specifies the b property for the new matrix.
	 * @param	c	Specifies the c property for the new matrix.
	 * @param	d	Specifies the d property for the new matrix.
	 * @param	tx	Specifies the tx property for the new matrix.
	 * @param	ty	Specifies the ty property for the new matrix.
	 * @return	This instance. Useful for chaining method calls.
	 */
	public function setValues(a:Float = 1, b:Float = 0, c:Float = 0, d:Float = 1, tx:Float = 0, ty:Float = 0):Matrix2D;
	
	/**
	 * Applies a skew transformation to the matrix.
	 * @param	skewX The amount to skew horizontally in degrees. To use a value in radians, multiply it by <code>180/Math.PI</code>.
	 * @param	skewY The amount to skew vertically in degrees.
	 * @return	This matrix. Useful for chaining method calls.
	 */
	public function skew(skewX:Float, skewY:Float):Matrix2D;
	
	/**
	 * Transforms a point according to this matrix.
	 * @param	x		The x component of the point to transform.
	 * @param	y		The y component of the point to transform.
	 * @param	point	An object to copy the result into. If omitted a generic object with x/y properties will be returned.
	 * @return	This matrix. Useful for chaining method calls.
	 */
	public function transformPoint(x:Float, y:Float, point:Point = null):Point;
	
	/**
	 * Translates the matrix on the x and y axes.
	 * @param	x Value x.
	 * @param	y Value y.
	 * @return	This matrix. Useful for chaining method calls.
	 */
	public function translate(x:Float, y:Float):Matrix2D;
	
	/**
	 * Returns a string representation of this Matrix2D.
	 * @return A string representation of the instance.
	 */
	public function toString():String;
}