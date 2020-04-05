package createjs;

/**
 * Static class holding library specific information such as the version and buildDate of the library.
 * Documentation: https://www.createjs.com/docs/easeljs/classes/EaselJS.html
 * @author VolkovRA
 */
@:native("createjs.EaselJS")
extern class EaselJS 
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