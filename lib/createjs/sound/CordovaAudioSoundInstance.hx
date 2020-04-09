package createjs.sound;

import js.lib.Function;

/**
 * CordovaAudioSoundInstance extends the base api of AbstractSoundInstance and is used by CordovaAudioPlugin.
 * 
 * EVENTS
 * Event.COMPLETE			The event that is fired when playback completes.
 * 							This means that the sound has finished playing in its entirety, including its loop iterations.
 * 
 * Event.FAILED				The event that is fired when playback has failed.
 * 							This happens when there are too many channels with the same src property already playing (and
 * 							the interrupt value doesn't cause an interrupt of another instance), or the sound could not be played,
 * 							perhaps due to a 404 error.
 * 
 * Event.INTERRUPTED		The event that is fired when playback is interrupted.
 * 							This happens when another sound with the same src property is played using an interrupt value that
 * 							causes this instance to stop playing.
 * 
 * Event.LOOP				The event that is fired when a sound has completed playing but has loops remaining.
 * 
 * Event.SUCCEEDED			The event that is fired when playback has started successfully.
 * 
 * Documentation: https://www.createjs.com/docs/soundjs/classes/CordovaAudioSoundInstance.html
 * @author VolkovRA
 */
@:native("createjs.CordovaAudioSoundInstance")
extern class CordovaAudioSoundInstance extends AbstractSoundInstance 
{
	/**
	 * Create a new CordovaAudioSoundInstance.
	 * @param	src					The path to and file name of the sound.
	 * @param	startTime			Audio sprite property used to apply an offset, in milliseconds.
	 * @param	duration			Audio sprite property used to set the time the clip plays for, in milliseconds.
	 * @param	playbackResource	Any resource needed by plugin to support audio playback.
	 */
	public function new(src:String, startTime:Float, duration:Float, playbackResource:Dynamic);
	
	
	
	////////////////////
	//   PROPERTIES   //
	////////////////////
	
	/**
	 * Sets the playAudioWhenScreenIsLocked property for play calls on iOS devices.
	 */
	public var playWhenScreenLocked:Bool;
	
	
	
	/////////////////
	//   METHODS   //
	/////////////////
	
	/**
	 * Maps to Media.getCurrentPosition, which is curiously asynchronus and requires a callback.
	 * @param	mediaSuccess	The callback that is passed the current position in seconds.
	 * @param	mediaError		The callback to execute if an error occurs.
	 */
	public function getCurrentPosition(mediaSuccess:Function, mediaError:Function = null):Void;
	
	/**
	 * Returns a string representation of this CordovaAudioSoundInstance.
	 * @return A string representation of the instance.
	 */
	override public function toString():String;
}