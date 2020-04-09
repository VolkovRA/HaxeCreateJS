package createjs.sound;

/**
 * The play state sound values.
 * Documentation: https://www.createjs.com/docs/soundjs/classes/Sound.html
 * @author VolkovRA
 */
@:enum abstract PlayState(String) to String
{
	/**
	 * Defines the playState of an instance that is still initializing.
	 */
	var INITED = "playInited";
	
	/**
	 * Defines the playState of an instance that is currently playing or paused.
	 */
	var SUCCEEDED = "playSucceeded";
	
	/**
	 * Defines the playState of an instance that was interrupted by another instance.
	 */
	var INTERRUPTED = "playInterrupted";
	
	/**
	 * Defines the playState of an instance that completed playback.
	 */
	var FINISHED = "playFinished";
	
	/**
	 * Defines the playState of an instance that failed to play.
	 * This is usually caused by a lack of available channels when the interrupt mode was "InterruptType.NONE",
	 * the playback stalled, or the sound could not be found.
	 */
	var FAILED = "playFailed";
}