package createjs.utils;

import js.html.CanvasElement;
import js.html.VideoElement;

/**
 * When an HTML video seeks, including when looping, there is an indeterminate period before a new frame is available.
 * This can result in the video blinking or flashing when it is drawn to a canvas. The VideoBuffer class resolves this
 * issue by drawing each frame to an off-screen canvas and preserving the prior frame during a seek.
 * <code>
 * var myBuffer = new VideoBuffer(myVideo);
 * var myBitmap = new Bitmap(myBuffer);
 * </code>
 * Documentation: https://www.createjs.com/docs/easeljs/classes/VideoBuffer.html
 * @author VolkovRA
 */
@:native("createjs.VideoBuffer")
extern class VideoBuffer 
{
	/**
	 * Create a new VideoBuffer.
	 * @param	video	The HTML video element to buffer.
	 */
	public function new(video:VideoElement);
	
	/**
	 * Gets an HTML canvas element showing the current video frame, or the previous frame if in a seek / loop.
	 * Primarily for use by Bitmap.
	 */
	public function getImage():CanvasElement;
}