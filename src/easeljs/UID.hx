package easeljs;

/**
 * Global utility for generating sequential unique ID numbers.
 * The UID class uses a static interface (ex. UID.get()) and should not be instantiated.
 * Documentation: https://www.createjs.com/docs/easeljs/classes/UID.html
 * @author VolkovRA
 */
@:native("createjs.UID")
extern class UID 
{
	/**
	 * Returns the next unique id.
	 * @return The next unique id.
	 */
	public static function get():Float;
}