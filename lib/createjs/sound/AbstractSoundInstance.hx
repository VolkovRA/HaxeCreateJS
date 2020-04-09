package createjs.sound;

import createjs.events.EventDispatcher;
import haxe.extern.EitherType;

/**
 * A AbstractSoundInstance is created when any calls to the Sound API method play or createInstance are made.
 * The AbstractSoundInstance is returned by the active plugin for control by the user.
 * <code>
 * var myInstance = Sound.play("myAssetPath/mySrcFile.mp3");
 * </code>
 * 
 * A number of additional parameters provide a quick way to determine how a sound is played.
 * Please see the Sound API method play for a list of arguments.
 * 
 * Once a AbstractSoundInstance is created, a reference can be stored that can be used to control the audio directly
 * through the AbstractSoundInstance. If the reference is not stored, the AbstractSoundInstance will play out its
 * audio (and any loops), and is then de-referenced from the Sound class so that it can be cleaned up. If audio playback
 * has completed, a simple call to the play instance method will rebuild the references the Sound class need to control it.
 * <code>
 * var myInstance = Sound.play("myAssetPath/mySrcFile.mp3", {loop:2});
 * myInstance.on("loop", handleLoop);
 * function handleLoop(event) {
 *     myInstance.volume = myInstance.volume * 0.5;
 * }
 * </code>
 * 
 * Events are dispatched from the instance to notify when the sound has completed, looped, or when playback fails
 * <code>
 * var myInstance = Sound.play("myAssetPath/mySrcFile.mp3");
 * myInstance.on("complete", handleComplete);
 * myInstance.on("loop", handleLoop);
 * myInstance.on("failed", handleFailed);
 * </code>
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
 * Documentation: https://www.createjs.com/docs/soundjs/classes/AbstractSoundInstance.html
 * @author VolkovRA
 */
@:native("createjs.AbstractSoundInstance")
extern class AbstractSoundInstance extends EventDispatcher 
{
	/**
	 * Create a new AbstractSoundInstance.
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
	 * Sets or gets the length of the audio clip, value is in milliseconds.
	 * Default: 0
	 */
	public var duration:Float;
	
	/**
	 * The number of play loops remaining. Negative values will loop infinitely.
	 * Default: 0
	 */
	public var loop:Float;
	
	/**
	 * Mutes or unmutes the current audio instance.
	 * Default: false
	 */
	public var muted:Bool;
	
	/**
	 * The pan of the sound, between -1 (left) and 1 (right). Note that pan is not supported by HTML Audio.
	 * Note in WebAudioPlugin this only gives us the "x" value of what is actually 3D audio
	 * Default: 0
	 */
	public var pan:Float;
	
	/**
	 * Pauses or resumes the current audio instance.
	 */
	public var paused:Bool;
	
	/**
	 * Object that holds plugin specific resource need for audio playback. This is set internally by the plugin.
	 * For example, WebAudioPlugin will set an array buffer, HTMLAudioPlugin will set a tag, FlashAudioPlugin will set a flash reference.
	 * Default: null
	 */
	public var playbackResource:Dynamic;
	
	/**
	 * The play state of the sound.
	 * Default: null
	 */
	public var playState:PlayState;
	
	/**
	 * The position of the playhead in milliseconds.
	 * This can be set while a sound is playing, paused, or stopped.
	 * Default: 0
	 */
	public var position:Float;
	
	/**
	 * The source of the sound.
	 * Default: null
	 */
	public var src:String;
	
	/**
	 * Audio sprite property used to determine the starting offset.
	 * Default: 0
	 */
	public var startTime:Float;
	
	/**
	 * The unique ID of the instance.
	 * This is set by Sound.
	 * Default: -1
	 */
	public var uniqueId:EitherType<String, Float>;
	
	/**
	 * The volume of the sound, between 0 and 1.
	 * The actual output volume of a sound can be calculated using:
	 * <code>myInstance.volume * Sound.volume;</code>
	 * Default: 1
	 */
	public var volume:Float;
	
	
	
	/////////////////
	//   METHODS   //
	/////////////////
	
	/**
	 * Takes an PlayPropsConfig or Object with the same properties and sets them on this instance.
	 * @param	props	A PlayPropsConfig or object containing the same properties.
	 * @return	A reference to itself, intended for chaining calls.
	 */
	@:overload(function(props:PlayPropsConfigObject):AbstractSoundInstance {})
	public function applyPlayProps(props:PlayPropsConfig):AbstractSoundInstance;
	
	/**
	 * Remove all external references and resources from AbstractSoundInstance.
	 * Note this is irreversible and AbstractSoundInstance will no longer work
	 */
	public function destroy():Void;
	
	/**
	 * Play an instance.
	 * This method is intended to be called on SoundInstances that already exist (created with the Sound API createInstance or play).
	 * <code>
	 * var myInstance = Sound.createInstance(mySrc);
	 * myInstance.play({interrupt:Sound.INTERRUPT_ANY, loop:2, pan:0.5});
	 * </code>
	 * Note that if this sound is already playing, this call will still set the passed in parameters.
	 * 
	 * <b>Parameters Deprecated</b>
	 * The parameters for this method are deprecated in favor of a single parameter that is an Object or PlayPropsConfig.
	 * 
	 * @param	props	A PlayPropsConfig instance, or an object that contains the parameters to play a sound.
	 * 					See the PlayPropsConfig for more info.
	 * @return	A reference to itself, intended for chaining calls.
	 */
	@:overload(function(props:PlayPropsConfig):AbstractSoundInstance {})
	public function play(props:PlayPropsConfigObject):AbstractSoundInstance;
	
	/**
	 * Stop playback of the instance.
	 * Stopped sounds will reset their position to 0, and calls to AbstractSoundInstance/resume will fail.
	 * To start playback again, call play.
	 * 
	 * If you don't want to lose your position use yourSoundInstance.paused = true instead. AbstractSoundInstance/paused.
	 * <code>myInstance.stop();</code>
	 * @return	A reference to itself, intended for chaining calls.
	 */
	public function stop():AbstractSoundInstance;
	
	/**
	 * Returns a string representation of this AbstractSoundInstance.
	 * @return A string representation of the instance.
	 */
	override public function toString():String;
}