package easeljs.display;

/**
 * This class encapsulates the properties required to define a shadow to apply to a DisplayObject via its shadow property.
 * Documentation: https://www.createjs.com/docs/easeljs/classes/Shadow.html
 * @author VolkovRA
 */
@:native("createjs.Shadow")
extern class Shadow 
{
	/**
	 * An identity shadow object (all properties are set to 0).
	 */
	static public var identity(default, null):Shadow;
	
	/**
	 * The size of the blurring effect.
	 * Default: 0
	 */
	public var blur:Float;
	
	/**
	 * The color of the shadow. This can be any valid CSS color value.
	 * Default: "black"
	 */
	public var color:String;
	
	/**
	 * The x offset of the shadow in pixels.
	 * Default: 0
	 */
	public var offsetX:Float;
	
	/**
	 * The y offset of the shadow in pixels.
	 * Default: 0
	 */
	public var offsetY:Float;
	
	/**
	 * Create a new Shadow.
	 * @param	color	The color of the shadow. This can be any valid CSS color value.
	 * @param	offsetX	The x offset of the shadow in pixels.
	 * @param	offsetY	The y offset of the shadow in pixels.
	 * @param	blur	The size of the blurring effect.
	 */
	public function new(color:String = "black", offsetX:Float = 0, offsetY:Float = 0, blur:Float = 0);
	
	/**
	 * Returns a clone of this Shadow instance.
	 * @return A clone of the current Shadow instance.
	 */
	public function clone():Shadow;
	
	/**
	 * Returns a string representation of this Shadow.
	 * @return A string representation of the instance.
	 */
	public function toString():String;
}