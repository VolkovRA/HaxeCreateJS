package createjs.utils;

/**
 * An object that determines the current browser, version, operating system, and other environment variables via user agent string.
 * Used for audio because feature detection is unable to detect the many limitations of mobile devices.
 * <code>
 * if (BrowserDetect.isIOS) { // do stuff }
 * </code>
 * 
 * Documentation: https://www.createjs.com/docs/soundjs/classes/Utility%20Methods.html
 * Documentation: https://www.createjs.com/docs/soundjs/files/createjs_utils_BrowserDetect.js.html#l42
 * @author VolkovRA
 */
@:native("createjs.BrowserDetect")
extern class BrowserDetect 
{
	/**
	 * The <b>NavigatorID.userAgent</b> read-only property returns the user agent string for the current browser.
	 * <code>window.navigator.userAgent;</code>
	 */
	static public var agent(default, null):String;
	
	/**
	 * Check current browser is Windows Phone.
	 * @return	True if our browser is Windows Phone.
	 */
	static public function isWindowPhone():Bool;
	
	/**
	 * Check current browser is Firefox.
	 * @return	True if our browser is Firefox.
	 */
	static public function isFirefox():Bool;
	
	/**
	 * Check current browser is Opera.
	 * @return	True if our browser is opera.
	 */
	static public function isOpera():Bool;
	
	/**
	 * Check current browser is Chrome.
	 * Note that Chrome for Android returns true, but is a completely different browser with different abilities.
	 * @return	True if our browser is Chrome.  
	 */
	static public function isChrome():Bool;
	
	/**
	 * Check current browser is iOS.
	 * @return	True if our browser is safari for iOS devices (iPad, iPhone, and iPod).
	 */
	static public function isIOS():Bool;
	
	/**
	 * Check current browser is Android.
	 * @return	True if our browser is Android.
	 */
	static public function isAndroid():Bool;
	
	/**
	 * Check current browser is Blackberry.
	 * @return	True if our browser is Blackberry.
	 */
	static public function isBlackberry():Bool;
}