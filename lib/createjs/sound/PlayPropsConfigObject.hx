package createjs.sound;

/**
 * The properties of PlayPropsConfig class.
 * Documentation: https://www.createjs.com/docs/soundjs/classes/PlayPropsConfig.html
 * @author VolkovRA
 */
typedef PlayPropsConfigObject =
{	
	/**
	 * The amount of time to delay the start of audio playback, in milliseconds.
	 * Default: null
	 */
	@:optional var delay:Float;
	
	/**
	 * Used to create an audio sprite (with startTime), the amount of time to play the clip for, in milliseconds.
	 * Default: null
	 */
	@:optional var duration:Float;
	
	/**
	 * How to interrupt any currently playing instances of audio with the same source,
	 * if the maximum number of instances of the sound are already playing.
	 * Values are defined as INTERRUPT_TYPE constants on the Sound class, with the default defined by defaultInterruptBehavior.
	 * Default: null
	 */
	@:optional var interrupt:InterruptType;
	
	/**
	 * How many times the audio loops when it reaches the end of playback.
	 * The default is 0 (no loops), and -1 can be used for infinite playback.
	 * Default: null
	 */
	@:optional var loop:Float;
	
	/**
	 * The offset from the start of the audio to begin playback, in milliseconds.
	 * Default: null
	 */
	@:optional var offset:Float;
	
	/**
	 * The left-right pan of the sound (if supported), between -1 (left) and 1 (right).
	 * Default: null
	 */
	@:optional var pan:Float;
	
	/**
	 * Used to create an audio sprite (with duration), the initial offset to start playback and loop from, in milliseconds.
	 * Default: null
	 */
	@:optional var startTime:Float;
	
	/**
	 * The volume of the sound, between 0 and 1.
	 * Note that the master volume is applied against the individual volume.
	 * Default: null
	 */
	@:optional var volume:Float;
}