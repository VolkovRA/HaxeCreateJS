package createjs;

/**
 * Static class holding library specific information such as the version and buildDate of the library.
 * The SoundJS class has been renamed Sound. Please see Sound for information on using sound.
 * 
 * Documentation: https://www.createjs.com/docs/soundjs/classes/SoundJS.html
 * @author VolkovRA
 */
@:native("createjs.SoundJS")
extern class SoundJS 
{
	/**
	 * The version string for this release.
	 */
	static public var version:String;
	
	/**
	 * The build date for this release in UTC format.
	 */
	static public var buildDate:String;
}