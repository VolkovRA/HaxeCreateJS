package createjs.display;

/**
 * Controls how this MovieClip advances its time.
 * Must be one of 0 (INDEPENDENT), 1 (SINGLE_FRAME), or 2 (SYNCHED).
 * See each constant for a description of the behaviour.
 * @author VolkovRA
 */
@:enum abstract MovieClipMode(String) to String
{
	/**
	 * The MovieClip will advance independently of its parent, even if its parent is paused.
	 * This is the default mode.
	 */
	var INDEPENDENT = "independent";
	
	/**
	 * The MovieClip will only display a single frame (as determined by the startPosition property).
	 */
	var SINGLE_FRAME = "single";
	
	/**
	 * The MovieClip will be advanced only when its parent advances and will be synched to the position of the parent MovieClip.
	 */
	var SYNCHED = "synched";
}