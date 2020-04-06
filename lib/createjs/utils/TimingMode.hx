package createjs.utils;

/**
 * Specifies the timing api (setTimeout or requestAnimationFrame) and mode to use.
 * See TIMEOUT, RAF, and RAF_SYNCHED for mode details.
 * @author VolkovRA
 */
@:enum abstract TimingMode(String) to String
{
	/**
	 * In this mode, Ticker passes through the requestAnimationFrame heartbeat, ignoring the target framerate completely.
	 * Because requestAnimationFrame frequency is not deterministic, any content using this mode should be time based.
	 * You can leverage getTime and the tick event object's "delta" properties to make this easier.
	 * 
	 * Falls back on TIMEOUT if the requestAnimationFrame API is not supported.
	 */
	var RAF = "raf";
	
	/**
	 * In this mode, Ticker uses the requestAnimationFrame API, but attempts to synch the ticks to target framerate.
	 * It uses a simple heuristic that compares the time of the RAF return to the target time for the current frame
	 * and dispatches the tick when the time is within a certain threshold.
	 * 
	 * This mode has a higher variance for time between frames than TIMEOUT, but does not require that content be
	 * time based as with RAF while gaining the benefits of that API (screen synch, background throttling).
	 * 
	 * Variance is usually lowest for framerates that are a divisor of the RAF frequency. This is usually 60, so
	 * framerates of 10, 12, 15, 20, and 30 work well.
	 * 
	 * Falls back to TIMEOUT if the requestAnimationFrame API is not supported.
	 */
	var RAF_SYNCHED = "synched";
	
	/**
	 * In this mode, Ticker uses the setTimeout API.
	 * This provides predictable, adaptive frame timing, but does not provide the benefits of
	 * requestAnimationFrame (screen synch, background throttling).
	 */
	var TIMEOUT = "timeout";
}