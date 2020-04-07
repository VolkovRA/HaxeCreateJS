package createjs.sound;

/**
 * The play state sound values.
 * Documentation: https://www.createjs.com/docs/soundjs/classes/Sound.html
 * @author VolkovRA
 */
@:enum abstract SoundPlayState(String) to String
{
	/**
	 * Defines the playState of an instance that is still initializing.
	 */
	var PLAY_INITED  = "playInited";
	
	/**
	 * Defines the playState of an instance that is currently playing or paused.
	 */
	var PLAY_SUCCEEDED  = "playSucceeded";
	
	/**
	 * Defines the playState of an instance that was interrupted by another instance.
	 */
	var PLAY_INTERRUPTED  = "playInterrupted";
	
	/**
	 * Defines the playState of an instance that completed playback.
	 */
	var PLAY_FINISHED  = "playFinished";
	
	/**
	 * Defines the playState of an instance that failed to play.
	 * This is usually caused by a lack of available channels when the interrupt mode was "INTERRUPT_NONE",
	 * the playback stalled, or the sound could not be found.
	 */
	var PLAY_FAILED = "playFailed";
}