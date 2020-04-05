package easeljs.sheet;

import easeljs.geom.Rectangle;
import js.html.ImageElement;

/**
 * Frame description object.
 * The object params of specified frame data.
 * @author VolkovRA
 */
typedef Frame =
{
	/**
	 * Reference to the image object in which the frame is found.
	 */
	var image:ImageElement;
	
	/**
	 * Rectangle instance which defines the boundaries for the frame within that image.
	 */
	var rect:Rectangle;
	
	/**
	 * The regX value for the frame.
	 * The left offset for this frame registration point.
	 */
	var regX:Float;
	
	/**
	 * The regY value for the frame.
	 * The top offset for this frame registration point.
	 */
	var regY:Float;
}