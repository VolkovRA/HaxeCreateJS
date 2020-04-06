package createjs.ui;

import createjs.display.Stage;

/**
 * Global utility for working with multi-touch enabled devices in EaselJS.
 * Currently supports W3C Touch API (iOS and modern Android browser) and the Pointer API (IE),
 * including ms-prefixed events in IE10, and unprefixed in IE11.
 * 
 * Ensure that you disable touch when cleaning up your application. You do not have to check if
 * touch is supported to enable it, as it will fail gracefully if it is not supported.
 * 
 * Example
 * <code>
 * var stage = new Stage("canvasId");
 * Touch.enable(stage);
 * </code>
 * 
 * Note: It is important to disable Touch on a stage that you are no longer using:
 * <code>
 * Touch.disable(stage);
 * </code>
 * 
 * Documentation: https://www.createjs.com/docs/easeljs/classes/Touch.html
 * @author VolkovRA
 */
@:native("createjs.Touch")
extern class Touch 
{
	/**
	 * Removes all listeners that were set up when calling Touch.enable() on a stage.
	 * @param	stage	The Stage to disable touch on.
	 */
	static public function disable(stage:Stage):Void;
	
	/**
	 * Enables touch interaction for the specified EaselJS Stage.
	 * Currently supports iOS (and compatible browsers, such as modern Android browsers), and IE10/11.
	 * Supports both single touch and multi-touch modes. Extends the EaselJS MouseEvent model, but
	 * without support for double click or over/out events. See the MouseEvent
	 * MouseEvent/pointerId:property for more information.
	 * @param	stage			The Stage to enable touch on.
	 * @param	singleTouch		If true, only a single touch will be active at a time.
	 * @param	allowDefault	If true, then default gesture actions (ex. scrolling, zooming) will be
	 * 							allowed when the user is interacting with the target canvas.
	 * @return	Returns true if touch was successfully enabled on the target stage.
	 */
	static public function enable(stage:Stage, singleTouch:Bool = false, allowDefault:Bool = false):Bool;
	
	/**
	 * Returns true if touch is supported in the current browser.
	 * @return	Indicates whether touch is supported in the current browser.
	 */
	static public function isSupported():Bool;
}