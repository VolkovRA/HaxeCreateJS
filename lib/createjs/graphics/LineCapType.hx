package createjs.graphics;

/**
 * The LineCapType property of the Canvas 2D API determines the shape used to draw the end points of lines.
 * Note: The value LineCapType.ROUND and LineCapType.SQUARE make the lines slightly longer.
 * Documentation: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/lineCap
 * @author VolkovRA
 */
@:enum abstract LineCapType(String) to String
{
	/**
	 * The ends of lines are squared off at the endpoints.
	 * Default value.
	 */
	var BUTT = "butt";
	
	/**
	 * The ends of lines are rounded.
	 */
	var ROUND = "round";
	
	/**
	 * The ends of lines are squared off by adding a box with an equal width and half the height of the line's thickness.
	 */
	var SQUARE = "square";
}