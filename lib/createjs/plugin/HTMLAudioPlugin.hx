package createjs.plugin;

/**
 * Play sounds using HTML <audio> tags in the browser.
 * This plugin is the second priority plugin installed by default, after the WebAudioPlugin. For older browsers
 * that do not support html audio, include and install the FlashAudioPlugin.
 * 
 * <b>Known Browser and OS issues for HTML Audio</b>
 * <b>All browsers</b>
 * Testing has shown in all browsers there is a limit to how many audio tag instances you are allowed. If you
 * exceed this limit, you can expect to see unpredictable results. Please use Sound.MAX_INSTANCES as a guide
 * to how many total audio tags you can safely use in all browsers. This issue is primarily limited to IE9.
 * 
 * <b>IE html limitations</b>
 *   1. There is a delay in applying volume changes to tags that occurs once playback is started. So if you have
 * 		muted all sounds, they will all play during this delay until the mute applies internally. This happens
 * 		regardless of when or how you apply the volume change, as the tag seems to need to play to apply it.
 *   2. MP3 encoding will not always work for audio tags if it's not default. We've found default encoding with 64kbps works.
 *   3. Occasionally very short samples will get cut off.
 *   4. There is a limit to how many audio tags you can load or play at once, which appears to be determined by
 * 		hardware and browser settings. See HTMLAudioPlugin.MAX_INSTANCES for a safe estimate. Note that audio sprites
 * 		can be used as a solution to this issue.
 * 
 * <b>Safari limitations</b>
 *   1. Safari requires Quicktime to be installed for audio playback.
 * 
 * <b>iOS 6 limitations</b>
 *   1. Can only have one <audio> tag.
 *   2. Can not preload or autoplay the audio.
 *   3. Can not cache the audio.
 *   4. Can not play the audio except inside a user initiated event.
 *   5. Note it is recommended to use WebAudioPlugin for iOS. (6+)
 *   6. Audio sprites can be used to mitigate some of these issues and are strongly recommended on iOS.
 * 
 * <b>Android Native Browser limitations</b>
 *   1. We have no control over audio volume. Only the user can set volume on their device.
 *   2. We can only play audio inside a user event (touch/click). This currently means you cannot loop sound or use a delay.
 * 
 * <b>Android Chrome 26.0.1410.58 specific limitations</b>
 *   1. Can only play 1 sound at a time.
 *   2. Sound is not cached.
 *   3. Sound can only be loaded in a user initiated touch/click event.
 *   4. There is a delay before a sound is played, presumably while the src is loaded.
 * 
 * See Sound for general notes on known issues.
 * 
 * Documentation: https://www.createjs.com/docs/soundjs/classes/HTMLAudioPlugin.html
 * @author VolkovRA
 */
@:native("createjs.HTMLAudioPlugin")
extern class HTMLAudioPlugin extends AbstractPlugin 
{
	/**
	 * Create a new HTMLAudioPlugin.
	 */
	public function new();
	
	
	
	////////////////
	//   STATIC   //
	////////////////
	
	/**
	 * The maximum number of instances that can be loaded or played.
	 * This is a browser limitation, primarily limited to IE9. The actual number varies from browser to
	 * browser (and is largely hardware dependant), but this is a safe estimate. Audio sprites work around this limitation.
	 * Default: 30
	 */
	static public var MAX_INSTANCES:Int;
	
	/**
	 * Determine if the plugin can be used in the current browser/OS.
	 * Note that HTML audio is available in most modern browsers, but is disabled in iOS because of its limitations.
	 * @return	If the plugin can be initialized.
	 */
	static public function isSupported():Bool;
	
	
	
	/////////////////
	//   METHODS   //
	/////////////////
	
	/**
	 * Returns a string representation of this HTMLAudioPlugin.
	 * @return A string representation of the instance.
	 */
	override public function toString():String;
}