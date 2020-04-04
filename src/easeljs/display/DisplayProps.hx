package easeljs.display;

import easeljs.geom.Matrix2D;

/**
 * Used for calculating and encapsulating display related properties.
 * Documentation: https://www.createjs.com/docs/easeljs/classes/DisplayProps.html
 * @author VolkovRA
 */
@:native("createjs.DisplayProps")
extern class DisplayProps 
{
	/**
	 * Property representing the alpha that will be applied to a display object.
	 */
	public var alpha:Float;
	
	/**
	 * Property representing the compositeOperation that will be applied to a display object.
	 */
	public var compositeOperation:CompositeOperation;
	
	/**
	 * The transformation matrix that will be applied to a display object.
	 */
	public var matrix:Matrix2D;
	
	/**
	 * Property representing the shadow that will be applied to a display object.
	 */
	public var shadow:Shadow;
	
	/**
	 * Property representing the value for visible that will be applied to a display object.
	 */
	public var visible:Bool;
	
	/**
	 * Create a new DisplayProps.
	 * @param	visible		Visible value.
	 * @param	alpha		Alpha value.
	 * @param	shadow		A Shadow instance or null.
	 * @param	composite	A compositeOperation value or null.
	 * @param	matrix		A transformation matrix. Defaults to a new identity matrix.
	 */
	public function new(	visible:Bool = true,
							alpha:Float = 1,
							shadow:Shadow = null,
							composite:CompositeOperation = null,
							matrix:Matrix2D = null
	);
	
	/**
	 * Appends the specified display properties.
	 * This is generally used to apply a child's properties its parent's.
	 * @param	visible		Desired visible value.
	 * @param	alpha		Desired alpha value.
	 * @param	shadow		Desired shadow value.
	 * @param	composite	Desired composite operation value.
	 * @param	matrix		A Matrix2D instance.
	 * @return	This instance. Useful for chaining method calls.
	 */
	public function append(visible:Bool, alpha:Float, shadow:Shadow, composite:CompositeOperation, ?matrix:Matrix2D):DisplayProps;
	
	/**
	 * Returns a clone of the DisplayProps instance.
	 * Clones the associated matrix.
	 * @return A clone of the DisplayProps instance.
	 */
	public function clone():DisplayProps;
	
	/**
	 * Resets this instance and its matrix to default values.
	 * @return This instance. Useful for chaining method calls.
	 */
	public function identity():DisplayProps;
	
	/**
	 * Prepends the specified display properties.
	 * This is generally used to apply a parent's properties to a child's. For example, to get the combined display properties
	 * that would be applied to a child, you could use:
	 * <code>
	 * var o = myDisplayObject;
	 * var props = new createjs.DisplayProps();
	 * do {
	 *     // prepend each parent's props in turn:
	 *     props.prepend(o.visible, o.alpha, o.shadow, o.compositeOperation, o.getMatrix());
	 * } while (o = o.parent);
	 * </code>
	 * @param	visible		Desired visible value.
	 * @param	alpha		Desired alpha value.
	 * @param	shadow		Desired shadow value.
	 * @param	composite	Desired composite operation value.
	 * @param	matrix		A Matrix2D instance
	 * @return	This instance. Useful for chaining method calls.
	 */
	public function prepend(visible:Bool, alpha:Float, shadow:Shadow, composite:CompositeOperation, ?matrix:Matrix2D):DisplayProps;
	
	/**
	 * Reinitializes the instance with the specified values.
	 * @param	visible		Visible value.
	 * @param	alpha		Alpha value.
	 * @param	shadow		A Shadow instance or null.
	 * @param	composite	A compositeOperation value or null.
	 * @param	matrix		A transformation matrix. Defaults to an identity matrix.
	 * @return	This instance. Useful for chaining method calls.
	 */
	public function setValues(	visible:Bool = true,
								alpha:Float = 1,
								shadow:Shadow = null,
								composite:CompositeOperation = null,
								matrix:Matrix2D = null
	):DisplayProps;
}