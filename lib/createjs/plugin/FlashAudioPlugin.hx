package createjs.plugin;

/**
 * Play sounds using a Flash instance.
 * This plugin is not used by default, and must be registered manually in Sound using the registerPlugins method.
 * This plugin is recommended to be included if sound support is required in older browsers such as IE8.
 * This plugin requires FlashAudioPlugin.swf and swfObject.js, which is compiled into the minified FlashAudioPlugin-X.X.X.min.js file.
 * You must ensure that swfPath is set when using this plugin, so that the script can find the swf.
 * <code>
 * FlashAudioPlugin.swfPath = "../src/soundjs/flashaudio";
 * Sound.registerPlugins([WebAudioPlugin, HTMLAudioPlugin, FlashAudioPlugin]);
 * // Adds FlashAudioPlugin as a fallback if WebAudio and HTMLAudio do not work.
 * </code>
 * 
 * Note that the SWF is embedded into a container DIV (with an id and classname of "SoundJSFlashContainer"),
 * and will have an id of "flashAudioContainer". The container DIV is positioned 1 pixel off-screen to the
 * left to avoid showing the 1x1 pixel white square.
 * 
 * <b>Known Browser and OS issues for Flash Audio</b>
 * <b>All browsers</b>
 *   1. There can be a delay in flash player starting playback of audio. This has been most noticeable in Firefox.
 * 		Unfortunely this is an issue with the flash player and the browser and therefore cannot be addressed by SoundJS.
 * 
 * Documentation: https://www.createjs.com/docs/soundjs/classes/FlashAudioPlugin.html
 * @author VolkovRA
 */
@:native("createjs.FlashAudioPlugin")
extern class FlashAudioPlugin extends AbstractPlugin 
{
	/**
	 * Create a new FlashAudioPlugin.
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
	 * The path relative to the HTML page that the FlashAudioPlugin.swf resides.
	 * Note if this is not correct, this plugin will not work.
	 * Default: src/SoundJS
	 */
	static public var swfPath:String;
	
	/**
	 * The version string for this release.
	 */
	static public var version:String;
	
	/**
	 * Determine if the plugin can be used in the current browser/OS.
	 * @return	If the plugin can be initialized.
	 */
	static public function isSupported():Bool;
	
	
	
	////////////////////
	//   PROPERTIES   //
	////////////////////
	
	/**
	 * Determines if the Flash object has been created and initialized.
	 * This is required to make ExternalInterface calls from JavaScript to Flash.
	 * Default: false
	 */
	public var flashReady:Bool;
	
	/**
	 * A developer flag to output all flash events to the console (if it exists). Used for debugging.
	 * <code>Sound.activePlugin.showOutput = true;</code>
	 * Default: false
	 */
	public var showOutput:Bool;
	
	
	
	/////////////////
	//   METHODS   //
	/////////////////
	
	/**
	 * Returns a string representation of this FlashAudioPlugin.
	 * @return A string representation of the instance.
	 */
	override public function toString():String;
}