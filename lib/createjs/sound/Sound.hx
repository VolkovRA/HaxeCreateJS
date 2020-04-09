package createjs.sound;

import createjs.events.Event;
import createjs.events.EventDispatcher;
import createjs.events.EventObject;
import createjs.events.Listener;
import createjs.events.ListenerCallback;
import createjs.plugin.AbstractPlugin;
import haxe.DynamicAccess;
import haxe.extern.EitherType;

/**
 * The Sound class is the public API for creating sounds, controlling the overall sound levels, and managing plugins.
 * All Sound APIs on this class are static.
 * 
 * <b>Registering and Preloading</b>
 * Before you can play a sound, it must be registered. You can do this with registerSound, or register multiple sounds
 * using registerSounds. If you don't register a sound prior to attempting to play it using play or create it using
 * createInstance, the sound source will be automatically registered but playback will fail as the source will not be ready.
 * If you use PreloadJS, registration is handled for you when the sound is preloaded. It is recommended to preload sounds
 * either internally using the register functions or externally using PreloadJS so they are ready when you want to use them.
 * 
 * <b>Playback</b>
 * To play a sound once it's been registered and preloaded, use the play method. This method returns a AbstractSoundInstance
 * which can be paused, resumed, muted, etc. Please see the AbstractSoundInstance documentation for more on the instance control APIs.
 * 
 * <b>Plugins</b>
 * By default, the WebAudioPlugin or the HTMLAudioPlugin are used (when available), although developers can change plugin
 * priority or add new plugins (such as the provided FlashAudioPlugin). Please see the Sound API methods for more on the
 * playback and plugin APIs. To install plugins, or specify a different plugin order, see Sound/installPlugins.
 * <code>
 * FlashAudioPlugin.swfPath = "../src/soundjs/flashaudio";
 * Sound.registerPlugins([WebAudioPlugin, FlashAudioPlugin]);
 * Sound.alternateExtensions = ["mp3"];
 * Sound.on(Event.FILE_LOAD, this.loadHandler, this);
 * Sound.registerSound("path/to/mySound.ogg", "sound");
 * function loadHandler(event) {
 *     // This is fired for each sound that is registered.
 *     var instance = Sound.play("sound");  // play using id.  Could also use full source path or event.src.
 *     instance.on(Event.COMPLETE, this.handleComplete, this);
 *     instance.volume = 0.5;
 * }
 * </code>
 * 
 * The maximum number of concurrently playing instances of the same sound can be specified in the "data" argument of registerSound.
 * Note that if not specified, the active plugin will apply a default limit. Currently HTMLAudioPlugin sets a default limit of 2,
 * while WebAudioPlugin and FlashAudioPlugin set a default limit of 100.
 * <code>
 * Sound.registerSound("sound.mp3", "soundId", 4);
 * </code>
 * 
 * Sound can be used as a plugin with PreloadJS to help preload audio properly. Audio preloaded with PreloadJS is automatically
 * registered with the Sound class. When audio is not preloaded, Sound will do an automatic internal load. As a result, it may
 * fail to play the first time play is called if the audio is not finished loading. Use the fileload event to determine when a
 * sound has finished internally preloading. It is recommended that all audio is preloaded before it is played.
 * <code>
 * var queue = new LoadQueue();
 * queue.installPlugin(Sound);
 * </code>
 * 
 * <b>Audio Sprites</b>
 * SoundJS has added support for AudioSprite, available as of version 0.6.0. For those unfamiliar with audio sprites, they are
 * much like CSS sprites or sprite sheets: multiple audio assets grouped into a single file.
 * 
 * <b>Example</b>
 * <code>
 * var assetsPath = "./assets/";
 * var sounds = [{
 *     src:"MyAudioSprite.ogg", data: {
 *         audioSprite: [
 *             {id:"sound1", startTime:0, duration:500},
 *             {id:"sound2", startTime:1000, duration:400},
 *             {id:"sound3", startTime:1700, duration: 1000}
 *         ]}
 *     }
 * ];
 * Sound.alternateExtensions = ["mp3"];
 * Sound.on(Event.FILE_LOAD, loadSound);
 * Sound.registerSounds(sounds, assetsPath);
 * // after load is complete
 * Sound.play("sound2");
 * </code>
 * 
 * <b>Mobile Playback</b>
 * Devices running iOS require the WebAudio context to be "unlocked" by playing at least one sound inside of a user- initiated
 * event (such as touch/click). Earlier versions of SoundJS included a "MobileSafe" sample, but this is no longer necessary
 * as of SoundJS 0.6.2.
 * 
 * In SoundJS 0.4.1 and above, you can either initialize plugins or use the playEmptySound method in the call stack of a user
 * input event to manually unlock the audio context.
 *   1. In SoundJS 0.6.2 and above, SoundJS will automatically listen for the first document-level "mousedown" and "touchend"
 * 		event, and unlock WebAudio. This will continue to check these events until the WebAudio context becomes "unlocked"
 * 		(changes from "suspended" to "running")
 *   2. Both the "mousedown" and "touchend" events can be used to unlock audio in iOS9+, the "touchstart" event will work in
 * 		iOS8 and below. The "touchend" event will only work in iOS9 when the gesture is interpreted as a "click", so if the
 * 		user long-presses the button, it will no longer work.
 *   3. When using the EaselJS Touch class, the "mousedown" event will not fire when a canvas is clicked, since MouseEvents
 * 		are prevented, to ensure only touch events fire. To get around this, you can either rely on "touchend", or:
 *   4. Set the allowDefault property on the Touch class constructor to true (defaults to false).
 *   5. Set the preventSelection property on the EaselJS Stage to false.
 *   6. These settings may change how your application behaves, and are not recommended.
 * 
 * <b>Loading Alternate Paths and Extension-less Files</b>
 * SoundJS supports loading alternate paths and extension-less files by passing an object instead of a string for the src
 * property, which is a hash using the format {extension:"path", extension2:"path2"}. These labels are how SoundJS determines
 * if the browser will support the sound. This also enables multiple formats to live in different folders, or on CDNs, which
 * often has completely different filenames for each file.
 * 
 * Priority is determined by the property order (first property is tried first). This is supported by both internal loading and
 * loading with PreloadJS.
 * 
 * <i>Note: an id is required for playback.</i>
 * 
 * <b>Example</b>
 * <code>
 * var sounds = {path:"./audioPath/",
 *      manifest: [
 *      {id: "cool", src: {mp3:"mp3/awesome.mp3", ogg:"noExtensionOggFile"}}
 * ]};
 * 
 * Sound.alternateExtensions = ["mp3"];
 * Sound.addEventListener(Event.FILE_LOAD, handleLoad);
 * Sound.registerSounds(sounds);
 * </code>
 * 
 * <h1>Known Browser and OS issues</h1>
 * <b>IE 9 HTML Audio limitations</b>
 *   1. There is a delay in applying volume changes to tags that occurs once playback is started. So if you have muted all sounds,
 * 		they will all play during this delay until the mute applies internally. This happens regardless of when or how you apply
 * 		the volume change, as the tag seems to need to play to apply it.
 *   2. MP3 encoding will not always work for audio tags, particularly in Internet Explorer. We've found default encoding with 64kbps works.
 *   3. Occasionally very short samples will get cut off.
 *   4. There is a limit to how many audio tags you can load and play at once, which appears to be determined by hardware and browser
 * 		settings. See HTMLAudioPlugin.MAX_INSTANCES for a safe estimate.
 * 
 * <b>Firefox 25 Web Audio limitations</b>
 *   1. mp3 audio files do not load properly on all windows machines, reported here.
 * 		For this reason it is recommended to pass another FF supported type (ie ogg) first until this bug is resolved, if possible.
 * 
 * <b>Safari limitations</b>
 *   1. Safari requires Quicktime to be installed for audio playback.
 * 
 * <b>iOS 6 Web Audio limitations</b>
 *   1. Sound is initially locked, and must be unlocked via a user-initiated event. Please see the section on Mobile Playback above.
 *   2. A bug exists that will distort un-cached web audio when a video element is present in the DOM that has audio at a different sampleRate.
 * 
 * <b>Android HTML Audio limitations</b>
 *   1. We have no control over audio volume. Only the user can set volume on their device.
 *   2. We can only play audio inside a user event (touch/click). This currently means you cannot loop sound or use a delay.
 * 
 * <b>Web Audio and PreloadJS</b>
 *   1. Web Audio must be loaded through XHR, therefore when used with PreloadJS, tag loading is not possible. This means that tag
 * 		loading can not be used to avoid cross domain issues.
 * 
 * EVENTS
 * Event.FILE_ERROR		This event is fired when a file fails loading internally. This event is fired for each loaded sound,
 * 						so any handler methods should look up the event.src to handle a particular sound.
 * 
 * Event.FILE_LOAD		This event is fired when a file finishes loading internally. This event is fired for each loaded sound,
 * 						so any handler methods should look up the event.src to handle a particular sound.
 * 
 * Documentation: https://www.createjs.com/docs/soundjs/classes/Sound.html
 * @author VolkovRA
 */
@:native("createjs.Sound")
extern class Sound extends EventDispatcher 
{
	////////////////////
	//   PROPERTIES   //
	////////////////////
	
	/**
	 * The currently active plugin.
	 * If this is null, then no plugin could be initialized.
	 * If no plugin was specified, Sound attempts to apply the default plugins: WebAudioPlugin, followed by HTMLAudioPlugin.
	 */
	static public var activePlugin:AbstractPlugin;
	
	/**
	 * An array of extensions to attempt to use when loading sound, if the default is unsupported by the active plugin.
	 * These are applied in order, so if you try to Load Thunder.ogg in a browser that does not support ogg,
	 * and your extensions array is ["mp3", "m4a", "wav"] it will check mp3 support, then m4a, then wav.
	 * The audio files need to exist in the same location, as only the extension is altered.
	 * 
	 * Note that regardless of which file is loaded, you can call createInstance and play using the same id or full
	 * source path passed for loading.
	 * 
	 * <b>Example</b>
	 * <code>
	 * var sounds = [
	 *     {src:"myPath/mySound.ogg", id:"example"},
	 * ];
	 * Sound.alternateExtensions = ["mp3"]; // now if ogg is not supported, SoundJS will try asset0.mp3
	 * Sound.on(Event.FILE_LOAD, handleLoad); // call handleLoad when each sound loads
	 * Sound.registerSounds(sounds, assetPath);
	 * // ...
	 * createjs.Sound.play("myPath/mySound.ogg"); // works regardless of what extension is supported.  Note calling with ID is a better approach
	 * </code>
	 */
	static public var alternateExtensions:Array<String>;
	
	/**
	 * Get the active plugins capabilities, which help determine if a plugin can be used in the current environment,
	 * or if the plugin supports a specific feature.
	 * 
	 * You can get a specific capability of the active plugin using standard object notation
	 * 
	 * <b>Example</b>
	 * <code>var mp3 = Sound.capabilities.mp3;</code>
	 */
	static public var capabilities(default, null):Capabilities;
	
	/**
	 * Determines the default behavior for interrupting other currently playing instances with the same source,
	 * if the maximum number of instances of the sound are already playing. Currently the default is InterruptType.NONE but this
	 * can be set and will change playback behavior accordingly. This is only used when play is called without passing a value for interrupt.
	 * Default: InterruptType.NONE, or "none"
	 */
	static public var defaultInterruptBehavior:InterruptType;
	
	/**
	 * Some extensions use another type of extension support to play (one of them is a codex).
	 * This allows you to map that support so plugins can accurately determine if an extension is supported.
	 * Adding to this list can help plugins determine more accurately if an extension is supported.
	 * 
	 * A useful list of extensions for each format can be found at http://html5doctor.com/html5-audio-the-state-of-play/.
	 * Default: {m4a:"mp4"}
	 */
	static public var EXTENSION_MAP:DynamicAccess<String>;
	
	/**
	 * Mute/Unmute all audio. Note that muted audio still plays at 0 volume.
	 * This global mute value is maintained separately and when set will override, but not change the mute property of individual instances.
	 * To mute an individual instance, use AbstractSoundInstance muted instead.
	 * 
	 * <b>Example</b>
	 * <code>Sound.muted = true;</code>
	 * 
	 * Default: false
	 */
	static public var muted:Bool;
	
	/**
	 * A list of the default supported extensions that Sound will try to play.
	 * Plugins will check if the browser can play these types, so modifying this list before a plugin is initialized will
	 * allow the plugins to try to support additional media types.
	 * 
	 * NOTE this does not currently work for FlashAudioPlugin.
	 * 
	 * More details on file formats can be found at http://en.wikipedia.org/wiki/Audio_file_format.
	 * A very detailed list of file formats can be found at http://www.fileinfo.com/filetypes/audio.
	 * 
	 * Default: ["mp3", "ogg", "opus", "mpeg", "wav", "m4a", "mp4", "aiff", "wma", "mid"]
	 */
	static public var SUPPORTED_EXTENSIONS:Array<String>;
	
	/**
	 * Set the master volume of Sound. The master volume is multiplied against each sound's individual volume.
	 * For example, if master volume is 0.5 and a sound's volume is 0.5, the resulting volume is 0.25.
	 * To set individual sound volume, use AbstractSoundInstance volume instead.
	 * 
	 * <b>Example</b>
	 * <code>Sound.volume = 0.5;</code>
	 * 
	 * Default: 1
	 */
	static public var volume:Float;
	
	
	
	/////////////////
	//   METHODS   //
	/////////////////
	
	/**
	 * Creates a AbstractSoundInstance using the passed in src.
	 * If the src does not have a supported extension or if there is no available plugin, a default AbstractSoundInstance
	 * will be returned that can be called safely but does nothing.
	 * 
	 * <b>Example</b><code>
	 * var myInstance = null;
	 * Sound.on(Event.FILE_LOAD, handleLoad);
	 * Sound.registerSound("myAudioPath/mySound.mp3", "myID", 3);
	 * function handleLoad(event) {
	 *     myInstance = Sound.createInstance("myID");
	 *     // alternately we could call the following
	 *     myInstance = Sound.createInstance("myAudioPath/mySound.mp3");
	 * }
	 * </code>
	 * 
	 * NOTE to create an audio sprite that has not already been registered, both startTime and duration need to be set.
	 * This is only when creating a new audio sprite, not when playing using the id of an already registered audio sprite.
	 * 
	 * @param	src			The src or ID of the audio.
	 * @param	startTime	To create an audio sprite (with duration), the initial offset to start playback and loop from, in milliseconds.
	 * @param	duration	To create an audio sprite (with startTime), the amount of time to play the clip for, in milliseconds.
	 * @return	A AbstractSoundInstance that can be controlled after it is created. Unsupported extensions will return the default AbstractSoundInstance.
	 */
	static public function createInstance(src:String, startTime:Float = null, duration:Float = null):AbstractSoundInstance;
	
	/**
	 * Get the default playback properties for the passed in src or ID.
	 * These properties are applied to all new SoundInstances. Returns null if default does not exist.
	 * @param	src The src or ID used to register the audio.
	 * @return	Returns an existing PlayPropsConfig or null if one does not exist.
	 */
	static public function getDefaultPlayProps(src:String):PlayPropsConfig;
	
	/**
	 * Initialize the default plugins.
	 * This method is automatically called when any audio is played or registered before the user has manually registered plugins,
	 * and enables Sound to work without manual plugin setup. Currently, the default plugins are WebAudioPlugin followed by HTMLAudioPlugin.
	 * 
	 * <b>Example</b>
	 * <code>if (!Sound.initializeDefaultPlugins()) { return; }</code>
	 * @return	True if a plugin was initialized, false otherwise.
	 */
	static public function initializeDefaultPlugins():Bool;
	
	/**
	 * Determines if Sound has been initialized, and a plugin has been activated.
	 * 
	 * <b>Example</b>
	 * This example sets up a Flash fallback, but only if there is no plugin specified yet.
	 * <code>
	 * if (!createjs.Sound.isReady()) {
	 *     FlashAudioPlugin.swfPath = "../src/soundjs/flashaudio/";
	 *     Sound.registerPlugins([WebAudioPlugin, HTMLAudioPlugin, FlashAudioPlugin]);
	 * }
	 * </code>
	 * @return	If Sound has initialized a plugin.
	 */
	static public function isReady():Bool;
	
	/**
	 * Check if a source has been loaded by internal preloaders.
	 * This is necessary to ensure that sounds that are not completed preloading will not kick off a new internal preload if they are played.
	 * 
	 * <b>Example</b><code>
	 * var mySound = "assetPath/asset0.ogg";
	 * if(Sound.loadComplete(mySound) {
	 *     Sound.play(mySound);
	 * }
	 * </code>
	 * @param	src The src or id that is being loaded.
	 * @return	If the src is already loaded.
	 */
	static public function loadComplete(src:String):Bool;
	
	/**
	 * Play a sound and get a AbstractSoundInstance to control.
	 * If the sound fails to play, an AbstractSoundInstance will still be returned, and have a playState of PlayState.FAILED.
	 * Note that even on sounds with failed playback, you may still be able to call the play, method, since the failure could be due to
	 * lack of available channels. If the src does not have a supported extension or if there is no available plugin, a default
	 * AbstractSoundInstance will still be returned, which will not play any audio, but will not generate errors.
	 * 
	 * <b>Example</b><code>
	 * Sound.on(Event.FILE_LOAD, handleLoad);
	 * Sound.registerSound("myAudioPath/mySound.mp3", "myID", 3);
	 * function handleLoad(event) {
	 *     Sound.play("myID");
	 *     // store off AbstractSoundInstance for controlling
	 *     var myInstance = Sound.play("myID", {interrupt: InterruptType.ANY, loop:-1});
	 * }
	 * </code>
	 * @param	src		The src or ID of the audio.
	 * @param	props	A PlayPropsConfig instance, or an object that contains the parameters to play a sound.
	 * @return	A AbstractSoundInstance that can be controlled after it is created.
	 */
	@:overload(function(src:String, props:PlayPropsConfigObject):AbstractSoundInstance{})
	static public function play(src:String, props:PlayPropsConfig):AbstractSoundInstance;
	
	/**
	 * Register a list of Sound plugins, in order of precedence.
	 * To register a single plugin, pass a single element in the array.
	 * 
	 * <b>Example</b><code>
	 * FlashAudioPlugin.swfPath = "../src/soundjs/flashaudio/";
	 * Sound.registerPlugins([WebAudioPlugin, HTMLAudioPlugin, FlashAudioPlugin]);
	 * </code>
	 * @param	plugins An array of plugins classes to install.
	 * @return	Whether a plugin was successfully initialized.
	 */
	static public function registerPlugins(plugins:Array<AbstractPlugin>):Bool;
	
	/**
	 * Register an audio file for loading and future playback in Sound.
	 * This is automatically called when using PreloadJS. It is recommended to register all sounds that need to be played
	 * back in order to properly prepare and preload them. Sound does internal preloading when required.
	 * 
	 * <b>Example</b><code>
	 * Sound.alternateExtensions = ["mp3"];
	 * Sound.on(Event.FILE_LOAD, handleLoad); // add an event listener for when load is completed
	 * Sound.registerSound("myAudioPath/mySound.ogg", "myID", 3);
	 * Sound.registerSound({ogg:"path1/mySound.ogg", mp3:"path2/mySoundNoExtension"}, "myID", 3);
	 * </code>
	 * @param	src					The source or an Object with a "src" property or an Object with multiple extension labeled src properties.
	 * @param	id					An id specified by the user to play the sound later. Note id is required for when src is multiple extension labeled src properties.
	 * @param	data				Data associated with the item. Sound uses the data parameter as the number of channels for an audio instance,
	 * 								however a "channels" property can be appended to the data object if it is used for other information.
	 * 								The audio channels will set a default based on plugin if no value is found. Sound also uses the data property
	 * 								to hold an AudioSprite array of objects in the following format {id, startTime, duration}.
	 * 								id used to play the sound later, in the same manner as a sound src with an id.
	 * 								startTime is the initial offset to start playback and loop from, in milliseconds.
	 * 								duration is the amount of time to play the clip for, in milliseconds.
	 * 								This allows Sound to support audio sprites that are played back by id.
	 * @param	basePath			Set a path that will be prepended to src for loading.
	 * @param	defaultPlayProps	Optional Playback properties that will be set as the defaults on any new AbstractSoundInstance.
	 * 								See PlayPropsConfig for options.
	 * @return	An object with the modified values that were passed in, which defines the sound.
	 * 			Returns false if the source cannot be parsed or no plugins can be initialized.
	 * 			Returns true if the source is already loaded.
	 */
	static public function registerSound(	src:EitherType<String, Dynamic>,
											id:String = null,
											data:EitherType<Float, Dynamic> = null,
											basePath:String = null,
											defaultPlayProps:EitherType<PlayPropsConfig, PlayPropsConfigObject>
	):EitherType<Bool, Dynamic>;
	
	/**
	 * Register an array of audio files for loading and future playback in Sound. It is recommended to register all sounds that need to
	 * be played back in order to properly prepare and preload them. Sound does internal preloading when required.
	 * 
	 * <b>Example</b><code>
	 * var assetPath = "./myAudioPath/";
	 * var sounds = [
	 *     {src:"asset0.ogg", id:"example"},
	 *     {src:"asset1.ogg", id:"1", data:6},
	 *     {src:"asset2.mp3", id:"works"}
	 *     {src:{mp3:"path1/asset3.mp3", ogg:"path2/asset3NoExtension"}, id:"better"}
	 * ];
	 * Sound.alternateExtensions = ["mp3"];    // if the passed extension is not supported, try this extension
	 * Sound.on(Event.FILE_LOAD, handleLoad); // call handleLoad when each sound loads
	 * Sound.registerSounds(sounds, assetPath);
	 * </code>
	 * @param	sounds		An array of objects to load. Objects are expected to be in the format needed for registerSound: {src:srcURI,
	 * 						id:ID, data:Data} with "id" and "data" being optional. You can also pass an object with path and manifest
	 * 						properties, where path is a basePath and manifest is an array of objects to load. Note id is required if
	 * 						src is an object with extension labeled src properties.
	 * @param	basePath	Set a path that will be prepended to each src when loading. When creating, playing, or removing audio that
	 * 						was loaded with a basePath by src, the basePath must be included.
	 * @return	An array of objects with the modified values that were passed in, which defines each sound. Like registerSound, it will
	 * 						return false for any values when the source cannot be parsed or if no plugins can be initialized. Also, it
	 * 						will return true for any values when the source is already loaded.
	 */
	static public function registerSounds(sounds:Array<Dynamic>, basePath:String):Dynamic;
	
	/**
	 * Remove all sounds that have been registered with registerSound or registerSounds.
	 * Note this will stop playback on all active sound instances before deleting them.
	 * 
	 * <b>Example</b>
	 * <code>createjs.Sound.removeAllSounds();</code>
	 */
	static public function removeAllSounds():Void;
	
	/**
	 * Remove a sound that has been registered with registerSound or registerSounds.
	 * Note this will stop playback on active instances playing this sound before deleting them.
	 * Note if you passed in a basePath, you need to pass it or prepend it to the src here.
	 * 
	 * <b>Example</b><code>
	 * Sound.removeSound("myID");
	 * Sound.removeSound("myAudioBasePath/mySound.ogg");
	 * Sound.removeSound("myPath/myOtherSound.mp3", "myBasePath/");
	 * Sound.removeSound({mp3:"musicNoExtension", ogg:"music.ogg"}, "myBasePath/");
	 * </code>
	 * @param	src			The src or ID of the audio, or an Object with a "src" property, or an Object with multiple extension labeled src properties.
	 * @param	basePath	Set a path that will be prepended to each src when removing.
	 * @return	True if sound is successfully removed.
	 */
	static public function removeSound(src:EitherType<String, Dynamic>, basePath :String):Bool;
	
	/**
	 * Remove an array of audio files that have been registered with registerSound or registerSounds.
	 * Note this will stop playback on active instances playing this audio before deleting them.
	 * Note if you passed in a basePath, you need to pass it or prepend it to the src here.
	 * 
	 * <b></b><code>
	 * assetPath = "./myPath/";
	 * var sounds = [
	 *     {src:"asset0.ogg", id:"example"},
	 *     {src:"asset1.ogg", id:"1", data:6},
	 *     {src:"asset2.mp3", id:"works"}
	 * ];
	 * Sound.removeSounds(sounds, assetPath);
	 * </code>
	 * @param	sounds		An array of objects to remove. Objects are expected to be in the format needed for
	 * 						removeSound: {srcOrID:srcURIorID}. You can also pass an object with path and manifest properties,
	 * 						where path is a basePath and manifest is an array of objects to remove.
	 * @param	basePath	Set a path that will be prepended to each src when removing.
	 * @return	An array of Boolean values representing if the sounds with the same array index were successfully removed.
	 */
	static public function removeSounds(sounds:Array<Dynamic>, basePath:String):Dynamic;
	
	/**
	 * Set the default playback properties for all new SoundInstances of the passed in src or ID.
	 * @param	src			The src or ID used to register the audio.
	 * @param	playProps	The playback properties you would like to set.
	 */
	@:overload(function(src:String, playProps:PlayPropsConfigObject):Void{})
	static public function setDefaultPlayProps(src:String, playProps:PlayPropsConfig):Void;
	
	/**
	 * Stop all audio (global stop).
	 * Stopped audio is reset, and not paused.
	 * To play audio that has been stopped, call AbstractSoundInstance play.
	 * 
	 * <b>Example</b>
	 * <code>Sound.stop();</code>
	 */
	static public function stop():Void;
	
	/**
	 * Use the volume property instead.
	 */
	@:deprecated
	@:noCompletion
	static public function setVolume(value:Float):Void;
	
	/**
	 * Use the muted property instead.
	 */
	@:deprecated
	@:noCompletion
	static public function setMute(value:Bool):Void;
	
	/**
	 * Use the capabilities property instead.
	 */
	@:deprecated
	@:noCompletion
	static public function getCapabilities():Capabilities;
	
	/**
	 * Use the volume property instead.
	 */
	@:deprecated
	@:noCompletion
	static public function getMasterVolume():Float;
	
	/**
	 * Use the muted property instead.
	 */
	@:deprecated
	@:noCompletion
	static public function getMute():Bool;
	
	
	
	////////////////////////////////////////
	//   INCLUDED FROM EVENT DISPATCHER   //
	////////////////////////////////////////
	
	/**
	 * Adds the specified event listener.
	 * Note that adding multiple listeners to the same function will result in multiple callbacks getting fired.
	 * @param	type		The string type of the event.
	 * @param	listener	An object with a handleEvent method, or a function that will be called when the event is dispatched.
	 * @param	useCapture	For events that bubble, indicates whether to listen for the event in the capture or bubbling/target phase.
	 * @return	Returns the listener for chaining or assignment.
	 */
	static public function addEventListener(type:String, listener:Listener, useCapture:Bool = false):Listener;
	
	/**
	 * A shortcut method for using addEventListener that makes it easier to specify an execution scope, have a
	 * listener only run once, associate arbitrary data with the listener, and remove the listener.
	 * 
	 * This method works by creating an anonymous wrapper function and subscribing it with addEventListener.
	 * The wrapper function is returned for use with removeEventListener (or off).
	 * 
	 * IMPORTANT: To remove a listener added with on, you must pass in the returned wrapper function as the
	 * listener, or use remove. Likewise, each time you call on a NEW wrapper function is subscribed, so
	 * multiple calls to on with the same params will create multiple listeners.
	 * @param	type		The string type of the event.
	 * @param	listener	An object with a handleEvent method, or a function that will be called when the event is dispatched.
	 * @param	scope		The scope to execute the listener in. Defaults to the dispatcher/currentTarget for function listeners,
	 * 						and to the listener itself for object listeners (ie. using handleEvent).
	 * @param	once		If true, the listener will remove itself after the first time it is triggered.
	 * @param	data		Arbitrary data that will be included as the second parameter when the listener is called.
	 * @param	useCapture	For events that bubble, indicates whether to listen for the event in the capture or bubbling/target phase.
	 * @return	Returns the anonymous function that was created and assigned as the listener.
	 * 			This is needed to remove the listener later using .removeEventListener.
	 */
	static public function on(type:String, listener:Listener, scope:Dynamic = null, once:Bool = false, data:Dynamic = null, useCapture:Bool = false):ListenerCallback;
	
	/**
	 * Removes the specified event listener.
	 * Important Note: that you must pass the exact function reference used when the event was added.
	 * If a proxy function, or function closure is used as the callback, the proxy/closure reference must be
	 * used - a new proxy or closure will not work.
	 * @param	type		The string type of the event.
	 * @param	listener	The listener function or object.
	 * @param	useCapture	For events that bubble, indicates whether to listen for the event in the capture or bubbling/target phase.
	 */
	static public function removeEventListener(type:String, listener:Listener, useCapture:Bool = false):Void;
	
	/**
	 * Removes all listeners for the specified type, or all listeners of all types.
	 * @param	type The string type of the event. If omitted, all listeners for all types will be removed.
	 */
	static public function removeAllEventListeners(type:String = null):Void;
	
	/**
	 * Indicates whether there is at least one listener for the specified event type.
	 * @param	The string type of the event.
	 * @return	Returns true if there is at least one listener for the specified event.
	 */
	static public function hasEventListener(type:String):Bool;
	
	/**
	 * Dispatches the specified event to all listeners.
	 * @param	event		An object with a "type" property, or a string type.
	 * 						While a generic object will work, it is recommended to use a CreateJS Event instance.
	 * 						If a string is used, dispatchEvent will construct an Event instance if necessary with the specified type.
	 * 						This latter approach can be used to avoid event object instantiation for non-bubbling events that may not have any listeners.
	 * @param	bubbles		Specifies the bubbles value when a string was passed to event.
	 * @param	cancelable	Specifies the cancelable value when a string was passed to event.
	 * @return	Returns false if preventDefault() was called on a cancelable event, true otherwise.
	 */
	@:overload(function(event:String, bubbles:Bool = false, cancelable:Bool = false):Bool{})
	@:overload(function(event:EventObject, bubbles:Bool = false, cancelable:Bool = false):Bool{})
	static public function dispatchEvent(event:Event, bubbles:Bool = false, cancelable:Bool = false):Bool;
	
	/**
	 * Indicates whether there is at least one listener for the specified event type on this object or any of
	 * its ancestors (parent, parent's parent, etc). A return value of true indicates that if a bubbling event of
	 * the specified type is dispatched from this object, it will trigger at least one listener.
	 * 
	 * This is similar to hasEventListener, but it searches the entire event flow for a listener, not just this object.
	 * @param	type The string type of the event.
	 * @return	Returns true if there is at least one listener for the specified event.
	 */
	static public function willTrigger(type:String):Bool;
}