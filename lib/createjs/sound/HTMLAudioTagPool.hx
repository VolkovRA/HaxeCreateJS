package createjs.sound;

import js.html.AudioElement;

/**
 * HTMLAudioTagPool is an object pool for HTMLAudio tag instances.
 * Documentation: https://www.createjs.com/docs/soundjs/classes/HTMLAudioTagPool.html
 * @author VolkovRA
 */
@:native("createjs.HTMLAudioTagPool")
extern class HTMLAudioTagPool 
{
	/**
	 * Get an audio tag with the given source.
	 * @param	src The source file used by the audio tag.
	 */
	static public function get(src:String):AudioElement;
	
	/**
	 * Gets the duration of the src audio in milliseconds
	 * @param	src The source file used by the audio tag.
	 * @return	Duration of src in milliseconds
	 */
	static public function getDuration(src:String):Float;
	
	/**
	 * Delete stored tag reference and return them to pool.
	 * Note that if the tag reference does not exist, this will fail.
	 * @param	src The source for the tag.
	 * @return	If the TagPool was deleted.
	 */
	static public function remove(src:String):Bool;
	
	/**
	 * Return an audio tag to the pool.
	 * @param	src	The source file used by the audio tag.
	 * @param	tag	Audio tag to set.
	 */
	static public function set(src:String, tag:AudioElement):Void;
}