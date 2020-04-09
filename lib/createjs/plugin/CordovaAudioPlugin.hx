package createjs.plugin;

/**
 * Play sounds using Cordova Media plugin, which will work with a Cordova app and tools that utilize Cordova such as PhoneGap or Ionic.
 * This plugin is not used by default, and must be registered manually in Sound using the registerPlugins method.
 * This plugin is recommended when building a Cordova based app, but is not required.
 * 
 * <b>NOTE the Cordova Media plugin is required.</b>
 * <code>cordova plugin add org.apache.cordova.media</code>
 * 
 * <b>Known Issues</b>
 * <b>Audio Position</b>
 * Audio position is calculated asynchronusly by Media. The SoundJS solution to this problem is two-fold:
 *   1. Provide getCurrentPosition that maps directly to media.getCurrentPosition.
 *   2. Provide a best guess position based on elapsed time since playback started, which is synchronized
 * 		with actual position when the audio is paused or stopped. Testing showed this to be fairly reliable within 200ms.
 * 
 * <b>Cordova Media Docs</b>
 *   1. See the Cordova Media Docs for various known OS issues.
 * 
 * Documentation: https://www.createjs.com/docs/soundjs/classes/CordovaAudioPlugin.html
 * @author VolkovRA
 */
@:native("createjs.CordovaAudioPlugin")
extern class CordovaAudioPlugin extends AbstractPlugin 
{
	/**
	 * Create a new CordovaAudioPlugin.
	 */
	public function new();
	
	
	
	////////////////
	//   STATIC   //
	////////////////
	
	/**
	 * The build date for this release in UTC format.
	 */
	static public var buildDate:String;
	
	/**
	 * Sets a default playAudioWhenScreenIsLocked property for play calls on iOS devices.
	 * Individual SoundInstances can alter the default with CordovaAudioSoundInstance/playWhenScreenLocked.
	 */
	static public var playWhenScreenLocked:Bool;
	
	/**
	 * The version string for this release.
	 */
	static public var version:String;
	
	/**
	 * Determine if the plugin can be used in the current browser/OS.
	 * Note that HTML audio is available in most modern browsers, but is disabled in iOS because of its limitations.
	 * @return	 If the plugin can be initialized.
	 */
	static public function isSupported():Bool;
	
	
	
	/////////////////
	//   METHODS   //
	/////////////////
	
	/**
	 * Get the duration for a src.
	 * Intended for internal use by CordovaAudioSoundInstance.
	 * @param	src
	 * @return	The duration of the src or null if it does not exist
	 */
	public function getSrcDuration(src:Dynamic):Float;
	
	/**
	 * Returns a string representation of this CordovaAudioPlugin.
	 * @return A string representation of the instance.
	 */
	override public function toString():String;
}