package createjs.sound;

/**
 * A class to store the optional play properties passed in play and play calls.
 * 
 * Optional Play Properties Include:
 *   1. interrupt - How to interrupt any currently playing instances of audio with the same source,
 * 		if the maximum number of instances of the sound are already playing. Values are defined as
 * 		INTERRUPT_TYPE constants on the Sound class, with the default defined by defaultInterruptBehavior.
 *   2. delay - The amount of time to delay the start of audio playback, in milliseconds.
 *   3. offset - The offset from the start of the audio to begin playback, in milliseconds.
 *   4. loop - How many times the audio loops when it reaches the end of playback. The default is 0 (no loops),
 * 		and -1 can be used for infinite playback.
 *   5. volume - The volume of the sound, between 0 and 1. Note that the master volume is applied against the individual volume.
 *   6. pan - The left-right pan of the sound (if supported), between -1 (left) and 1 (right).
 *   7. startTime - To create an audio sprite (with duration), the initial offset to start playback and loop from, in milliseconds.
 *   8. duration - To create an audio sprite (with startTime), the amount of time to play the clip for, in milliseconds.
 * 
 * <b>Example</b>
 * <code>
 * var props = new PlayPropsConfig().set({interrupt: createjs.Sound.INTERRUPT_ANY, loop: -1, volume: 0.5})
 * Sound.play("mySound", props);
 * // OR
 * mySoundInstance.play(props);
 * </code>
 * 
 * Documentation: https://www.createjs.com/docs/soundjs/classes/PlayPropsConfig.html
 * @author VolkovRA
 */
@:native("createjs.PlayPropsConfig")
extern class PlayPropsConfig 
{
	/**
	 * Create a new PlayPropsConfig.
	 */
	public function new();
	
	
	
	////////////////////
	//   PROPERTIES   //
	////////////////////
	
	/**
	 * The amount of time to delay the start of audio playback, in milliseconds.
	 * Default: null
	 */
	public var delay:Float;
	
	/**
	 * Used to create an audio sprite (with startTime), the amount of time to play the clip for, in milliseconds.
	 * Default: null
	 */
	public var duration:Float;
	
	/**
	 * How to interrupt any currently playing instances of audio with the same source,
	 * if the maximum number of instances of the sound are already playing.
	 * Values are defined as INTERRUPT_TYPE constants on the Sound class, with the default defined by defaultInterruptBehavior.
	 * Default: null
	 */
	public var interrupt:InterruptType;
	
	/**
	 * How many times the audio loops when it reaches the end of playback.
	 * The default is 0 (no loops), and -1 can be used for infinite playback.
	 * Default: null
	 */
	public var loop:Float;
	
	/**
	 * The offset from the start of the audio to begin playback, in milliseconds.
	 * Default: null
	 */
	public var offset:Float;
	
	/**
	 * The left-right pan of the sound (if supported), between -1 (left) and 1 (right).
	 * Default: null
	 */
	public var pan:Float;
	
	/**
	 * Used to create an audio sprite (with duration), the initial offset to start playback and loop from, in milliseconds.
	 * Default: null
	 */
	public var startTime:Float;
	
	/**
	 * The volume of the sound, between 0 and 1.
	 * Note that the master volume is applied against the individual volume.
	 * Default: null
	 */
	public var volume:Float;
	
	
	
	/////////////////
	//   METHODS   //
	/////////////////
	
	/**
	 * Creates a PlayPropsConfig from another PlayPropsConfig or an Object.
	 * @param	value	The play properties
	 * @return	A PlayPropsConfig.
	 */
	@:overload(function(value:PlayPropsConfig):PlayPropsConfig {})
	static public function create(value:PlayPropsConfigObject):PlayPropsConfig;
	
	/**
	 * Provides a chainable shortcut method for setting a number of properties on the instance.
	 * <b>Example</b>
	 * <code>var PlayPropsConfig = new createjs.PlayPropsConfig().set({loop:-1, volume:0.7});</code>
	 * @param	props	A generic object containing properties to copy to the PlayPropsConfig instance.
	 * @return	Returns the instance the method is called on (useful for chaining calls.)
	 */
	public function set(props:PlayPropsConfigObject):PlayPropsConfig;
	
	/**
	 * Returns a string representation of this PlayPropsConfig.
	 * @return	A string representation of the instance.
	 */
	public function toString():String;
}