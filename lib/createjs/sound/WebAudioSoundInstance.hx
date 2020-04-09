package createjs.sound;

import js.html.audio.AudioBufferSourceNode;
import js.html.audio.AudioContext;
import js.html.audio.AudioNode;
import js.html.audio.GainNode;
import js.html.audio.PannerNode;

/**
 * WebAudioSoundInstance extends the base api of AbstractSoundInstance and is used by WebAudioPlugin.
 * WebAudioSoundInstance exposes audioNodes for advanced users.
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
 * Documentation: https://www.createjs.com/docs/soundjs/classes/WebAudioSoundInstance.html
 * @author VolkovRA
 */
@:native("createjs.WebAudioSoundInstance")
extern class WebAudioSoundInstance extends AbstractSoundInstance 
{
	/**
	 * Create a new WebAudioSoundInstance.
	 * @param	src					The path to and file name of the sound.
	 * @param	startTime			Audio sprite property used to apply an offset, in milliseconds.
	 * @param	duration			Audio sprite property used to set the time the clip plays for, in milliseconds.
	 * @param	playbackResource	Any resource needed by plugin to support audio playback.
	 */
	public function new(src:String, startTime:Float, duration:Float, playbackResource:Dynamic);
	
	
	
	////////////////
	//   STATIC   //
	////////////////
	
	/**
	 * Note this is only intended for use by advanced users.
	 * The scratch buffer that will be assigned to the buffer property of a source node on close.
	 * This is and should be the same scratch buffer referenced by WebAudioPlugin.
	 */
	static public var _scratchBuffer:AudioBufferSourceNode;
	
	/**
	 * Note this is only intended for use by advanced users.
	 * Audio context used to create nodes. This is and needs to be the same context used by WebAudioPlugin.
	 */
	static public var context:AudioContext;
	
	/**
	 * Note this is only intended for use by advanced users.
	 * Audio node from WebAudioPlugin that sequences to context.destination
	 */
	static public var destinationNode:AudioNode;
	
	
	
	////////////////////
	//   PROPERTIES   //
	////////////////////
	
	/**
	 * NOTE this is only intended for use by advanced users.
	 * GainNode for controlling WebAudioSoundInstance volume. Connected to the destinationNode.
	 */
	public var gainNode:GainNode;
	
	/**
	 * NOTE this is only intended for use by advanced users.
	 * A panNode allowing left and right audio channel panning only. Connected to WebAudioSoundInstance gainNode.
	 */
	public var panNode:PannerNode;
	
	/**
	 * NOTE this is only intended for use by advanced users.
	 * sourceNode is the audio source. Connected to WebAudioSoundInstance panNode.
	 */
	public var sourceNode:AudioNode;
	
	
	
	/////////////////
	//   METHODS   //
	/////////////////
	
	/**
	 * Returns a string representation of this WebAudioSoundInstance.
	 * @return A string representation of the instance.
	 */
	override public function toString():String;
}