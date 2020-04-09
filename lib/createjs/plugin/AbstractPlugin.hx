package createjs.plugin;

import createjs.loader.AbstractLoader;
import createjs.loader.LoadItem;
import createjs.loader.LoadItemObject;
import createjs.sound.AbstractSoundInstance;

/**
 * A default plugin class used as a base for all other plugins. (SoundJS)
 * Documentation: https://www.createjs.com/docs/soundjs/classes/AbstractPlugin.html
 * @author VolkovRA
 */
@:native("createjs.AbstractPlugin")
extern  class AbstractPlugin 
{
	/**
	 * Create a new AbstractPlugin.
	 */
	public function new();
	
	
	
	////////////////
	//   STATIC   //
	////////////////
	
	/**
	 * Determine if the plugin can be used in the current browser/OS.
	 * @return	If the plugin can be initialized.
	 */
	static public function isSupported():Bool;
	
	
	
	/////////////////
	//   METHODS   //
	/////////////////
	
	/**
	 * Create a sound instance.
	 * If the sound has not been preloaded, it is internally preloaded here.
	 * @param	src			The sound source to use.
	 * @param	startTime	Audio sprite property used to apply an offset, in milliseconds.
	 * @param	duration	Audio sprite property used to set the time the clip plays for, in milliseconds.
	 * @return	A sound instance for playback and control.
	 */
	public function create(src:String, startTime:Float, duration:Float):AbstractSoundInstance;
	
	/**
	 * Get the master volume of the plugin, which affects all SoundInstances.
	 * @return	The volume level, between 0 and 1.
	 */
	public function getVolume():Float;
	
	/**
	 * Checks if preloading has finished for a specific source.
	 * @param	src	The sound URI to load.
	 * @return	True, if preloading has finished.
	 */
	public function isPreloadComplete (src:String):Bool;
	
	/**
	 * Checks if preloading has started for a specific source.
	 * If the source is found, we can assume it is loading, or has already finished loading.
	 * @param	src	The sound URI to check.
	 * @return	True, if preloading has started.
	 */
	public function isPreloadStarted(src:String):Bool;
	
	/**
	 * Internally preload a sound.
	 * @param	loader	The sound URI to load.
	 */
	public function preload(loader:AbstractLoader):Void;
	
	/**
	 * Pre-register a sound for preloading and setup.
	 * This is called by Sound. Note all plugins provide a Loader instance, which PreloadJS can use to assist with preloading.
	 * @param	item	An Object containing the source of the audio Note that not every plugin will manage this value.
	 * @return	A result object, containing a "tag" for preloading purposes.
	 */
	@:overload(function(item:LoadItemObject):AbstractLoader{})
	public function register(item:LoadItem):AbstractLoader;
	
	/**
	 * Remove all sounds added using WebAudioPlugin/register.
	 * Note this does not cancel a preload.
	 */
	public function removeAllSounds():Void;
	
	/**
	 * Remove a sound added using WebAudioPlugin/register.
	 * Note this does not cancel a preload.
	 * @param	src	The sound URI to unload.
	 */
	public function removeSound(src:String):Void;
	
	/**
	 * Mute all sounds via the plugin.
	 * @param	value	If all sound should be muted or not.
	 * 					Note that plugin-level muting just looks up the mute value of Sound muted, so this property is not used here.
	 * @return	If the mute call succeeds.
	 */
	public function setMute(value:Bool):Bool;
	
	/**
	 * Set the master volume of the plugin, which affects all SoundInstances.
	 * @param	value	The volume to set, between 0 and 1.
	 * @return	If the plugin processes the setVolume call (true). The Sound class will affect all the instances manually otherwise.
	 */
	public function setVolume(value:Float):Bool;
}