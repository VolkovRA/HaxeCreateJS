package createjs.display;

/**
 * The TextAlign class is an enumeration of constant values to use in the Canvas 2D API when drawing text.
 * 
 * The alignment is relative to the x value of the fillText() method.
 * For example, if textAlign is "center", then the text's left edge will be at x - (textWidth / 2).
 * 
 * Documentation: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/textAlign
 * @author VolkovRA
 */
@:enum abstract TextAlign(String) to String
{
	/**
	 * The text is left-aligned.
	 */
	var LEFT = "left";
	
	/**
	 * The text is right-aligned.
	 */
	var RIGHT = "right";
	
	/**
	 * The text is centered.
	 */
	var CENTER = "center";
	
	/**
	 * The text is aligned at the normal start of the line (left-aligned for left-to-right locales, right-aligned for right-to-left locales).
	 * Default value.
	 */
	var START = "start";
	
	/**
	 * The text is aligned at the normal end of the line (right-aligned for left-to-right locales, left-aligned for right-to-left locales).
	 */
	var END = "end";
}