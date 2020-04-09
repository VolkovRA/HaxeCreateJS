package createjs.sound;

/**
 * The capabilities of Sound plugins.
 * @author VolkovRA
 */
typedef Capabilities =
{
	/**
	 * If the plugin can pan audio from left to right.
	 */
	var panning:Bool;
	
	/**
	 * If the plugin can control audio volume.
	 */
	var volume:Bool;
	
	/**
	 * The maximum number of audio tracks that can be played back at a time.
	 * This will be -1 if there is no known limit.
	 */
	var tracks:Int;
	
	
	// An entry for each file type in SUPPORTED_EXTENSIONS:
	/**
	 * If MP3 audio is supported.
	 */
	var mp3:Bool;
	
	/**
	 * If OGG audio is supported.
	 */
	var ogg:Bool;
	
	/**
	 * If WAV audio is supported.
	 */
	var wav:Bool;
	
	/**
	 * If MPEG audio is supported.
	 */
	var mpeg:Bool;
	
	/**
	 * If M4A audio is supported.
	 */
	var m4a:Bool;
	
	/**
	 * If MP4 audio is supported.
	 */
	var mp4:Bool;
	
	/**
	 * If aiff audio is supported.
	 */
	var aiff:Bool;
	
	/**
	 * If wma audio is supported.
	 */
	var wma:Bool;
	
	/**
	 * If mid audio is supported.
	 */
	var mid:Bool;
}