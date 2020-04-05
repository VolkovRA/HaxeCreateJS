package createjs.sheet;

/**
 * Animation description object.
 * The object params of specified animation.
 * @author VolkovRA
 */
typedef Animation =
{
	/**
	 * An array of the frame ids in the animation.
	 */
	var frames:Array<FrameIndex>;
	
	/**
	 * The playback speed for this animation.
	 */
	var speed:Float;
	
	/**
	 * The name of the animation.
	 */
	var name:AnimationName;
	
	/**
	 * The default animation to play next.
	 * If the animation loops, the name and next property will be the same.
	 */
	var next:AnimationName;
}