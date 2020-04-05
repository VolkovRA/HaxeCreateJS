package easeljs.display;

import easeljs.geom.Rectangle;
import easeljs.tween.TimelineConfig;

/**
 * The configuration properties to apply to MovieClip instance (ex. {mode:MovieClipMode.SYNCHED}).
 * Supported props for the MovieClip are listed below. These props are set on the corresponding instance properties except where specified.
 * This object will also be passed into the Timeline instance associated with this MovieClip.
 * See the documentation for Timeline for a list of supported props (ex. paused, labels, loop, reversed, etc.)
 * 
 * Documentation: https://www.createjs.com/docs/easeljs/classes/MovieClip.html
 * @author VolkovRA
 */
typedef MovieClipConfig =
{
	>TimelineConfig,
	
	/**
	 * Controls how this MovieClip advances its time.
	 * Must be one of 0 MovieClipMode.INDEPENDENT, 1 MovieClipMode.SINGLE_FRAME, or 2 MovieClipMode.SYNCHED.
	 * See each constant for a description of the behaviour.
	 * Default: null
	 */
	@:optional var mode:MovieClipMode;
	
	/**
	 * Specifies what the first frame to play in this movieclip, or the only frame to display if mode is MovieClipMode.SINGLE_FRAME.
	 * Default: 0
	 */
	@:optional var startPosition:Float;
	
	/**
	 * An array of bounds for each frame in the MovieClip.
	 * This is mainly intended for tool output.
	 * Default: null
	 */
	@:optional var frameBounds:Array<Rectangle>;
}