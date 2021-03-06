package createjs.sound;

/**
 * The sound interrupt type values.
 * Documentation: https://www.createjs.com/docs/soundjs/classes/Sound.html
 * @author VolkovRA
 */
@:enum abstract InterruptType(String) to String
{
	/**
	 * The interrupt value to interrupt any currently playing instance with the same source,
	 * if the maximum number of instances of the sound are already playing.
	 */
	var ANY = "any";
	
	/**
	 * The interrupt value to interrupt the earliest currently playing instance with the same
	 * source that progressed the least distance in the audio track, if the maximum number of
	 * instances of the sound are already playing.
	 */
	var EARLY = "early";
	
	/**
	 * The interrupt value to interrupt the currently playing instance with the same source that
	 * progressed the most distance in the audio track, if the maximum number of instances of
	 * the sound are already playing.
	 */
	var LATE = "late";
	
	/**
	 * The interrupt value to not interrupt any currently playing instances with the same source,
	 * if the maximum number of instances of the sound are already playing.
	 */
	var NONE = "none";
}