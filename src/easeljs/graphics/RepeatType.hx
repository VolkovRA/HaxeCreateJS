package easeljs.graphics;

/**
 * Image repeat type.
 * A DOMString indicating how to repeat the pattern's image.
 * Documentation: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/createPattern
 * @author VolkovRA
 */
@:enum abstract RepeatType(String) to String
{
	/**
	 * Both directions.
	 */
	var REPEAT = "repeat";
	
	/**
	 * Horizontal only.
	 */
	var REPEAT_X = "repeat-x";
	
	/**
	 * Vertical only.
	 */
	var REPEAT_Y = "repeat-y";
	
	/**
	 * Neither direction.
	 */
	var NO_REPEAT = "no-repeat";
}