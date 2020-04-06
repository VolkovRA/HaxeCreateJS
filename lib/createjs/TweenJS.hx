package createjs;

/**
 * Static class holding library specific information such as the version and buildDate of the library.
 * Documentation: https://www.createjs.com/docs/tweenjs/classes/TweenJS.html
 * @author VolkovRA
 */
@:native("createjs.TweenJS")
extern class TweenJS 
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