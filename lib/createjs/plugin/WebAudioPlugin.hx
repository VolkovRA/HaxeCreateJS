package createjs.plugin;

import js.html.audio.AudioContext;
import js.html.audio.AudioNode;
import js.html.audio.GainNode;

/**
 * Play sounds using Web Audio in the browser.
 * The WebAudioPlugin is currently the default plugin, and will be used anywhere that it is supported.
 * To change plugin priority, check out the Sound API registerPlugins method.
 * 
 * <b>Known Browser and OS issues for Web Audio</b>
 * <b>Firefox 25</b>
 *   1. mp3 audio files do not load properly on all windows machines, reported here: https://bugzilla.mozilla.org/show_bug.cgi?id=929969
 * For this reason it is recommended to pass another FireFox-supported type (i.e. ogg) as the default extension, until this bug is resolved
 * 
 * <b>Webkit (Chrome and Safari)</b>
 *   1. AudioNode.disconnect does not always seem to work.
 * 		This can cause the file size to grow over time if you are playing a lot of audio files.
 * 
 * <b>iOS 6 limitations</b>
 *   1. Sound is initially muted and will only unmute through play being called inside a user initiated event (touch/click).
 * 		Please read the mobile playback notes in the the Sound class for a full overview of the limitations, and how to get around them.
 *   2. A bug exists that will distort un-cached audio when a video element is present in the DOM.
 * 		You can avoid this bug by ensuring the audio and video audio share the same sample rate.
 * 
 * Documentation: https://www.createjs.com/docs/soundjs/classes/WebAudioPlugin.html
 * @author VolkovRA
 */
@:native("createjs.WebAudioPlugin")
extern class WebAudioPlugin extends AbstractPlugin 
{
	/**
	 * Create a new WebAudioPlugin.
	 */
	public function new();
	
	
	
	////////////////
	//   STATIC   //
	////////////////
	
	/**
	 * The web audio context, which WebAudio uses to play audio.
	 * All nodes that interact with the WebAudioPlugin need to be created within this context.
	 * 
	 * Advanced users can set this to an existing context, but <b>must</b> do so before they call registerPlugins or initializeDefaultPlugins.
	 */
	static public var context:AudioContext;
	
	/**
	 * The default sample rate used when checking for iOS compatibility.
	 * See _createAudioContext.
	 * Default: 44100
	 */
	static public var DEFAULT_SAMPLE_RATE:Float;
	
	/**
	 * Determine if the plugin can be used in the current browser/OS.
	 * @return	If the plugin can be initialized.
	 */
	static public function isSupported():Bool;
	
	/**
	 * Plays an empty sound in the web audio context.
	 * This is used to enable web audio on iOS devices, as they require the first sound to be played inside of a user initiated event
	 * (touch/click). This is called when WebAudioPlugin is initialized (by Sound initializeDefaultPlugins for example).
	 * <code>
	 * function handleTouch(event) {
	 *     WebAudioPlugin.playEmptySound();
	 * }
	 * </code>
	 */
	static public function playEmptySound():Void;
	
	
	
	////////////////////
	//   PROPERTIES   //
	////////////////////
	
	/**
	 * The web audio context, which WebAudio uses to play audio.
	 * All nodes that interact with the WebAudioPlugin need to be created within this context.
	 */
	public var context:AudioContext;
	
	/**
	 * A DynamicsCompressorNode, which is used to improve sound quality and prevent audio distortion.
	 * It is connected to context.destination.
	 * 
	 * Can be accessed by advanced users through createjs.Sound.activePlugin.dynamicsCompressorNode.
	 */
	public var dynamicsCompressorNode:AudioNode;
	
	/**
	 * A GainNode for controlling master volume.
	 * It is connected to dynamicsCompressorNode.
	 * 
	 * Can be accessed by advanced users through Sound.activePlugin.gainNode.
	 */
	public var gainNode:GainNode;
	
	
	
	/////////////////
	//   METHODS   //
	/////////////////
	
	/**
	 * Returns a string representation of this WebAudioPlugin.
	 * @return A string representation of the instance.
	 */
	override public function toString():String;
}