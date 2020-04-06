package createjs.display;

/**
 * The TextBaseline class is an enumeration of constant values to use in the Canvas 2D API when drawing text.
 * 
 * Documentation: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/textBaseline
 * @author VolkovRA
 */
@:enum abstract TextBaseline(String) to String
{
	/**
	 * The text baseline is the top of the em square.
	 */
	var TOP = "top";
	
	/**
	 * The text baseline is the hanging baseline. 
	 * Used by Tibetan and other Indic scripts.
	 */
	var HANGING = "hanging";
	
	/**
	 * The text baseline is the middle of the em square.
	 */
	var MIDDLE = "middle";
	
	/**
	 * The text baseline is the normal alphabetic baseline.
	 * Default value.
	 */
	var ALPHABETIC = "alphabetic";
	
	/**
	 * The text baseline is the ideographic baseline.
	 * This is the bottom of the body of the characters, if the main body of characters protrudes beneath the alphabetic baseline. 
	 * Used by Chinese, Japanese, and Korean scripts.
	 */
	var IDEOGRAPHIC = "ideographic";
	
	/**
	 * The text baseline is the bottom of the bounding box.
	 * This differs from the ideographic baseline in that the ideographic baseline doesn't consider descenders.
	 */
	var BOTTOM = "bottom";
}