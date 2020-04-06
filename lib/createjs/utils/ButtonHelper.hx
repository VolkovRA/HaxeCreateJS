package createjs.utils;

import createjs.display.DisplayObject;
import createjs.display.MovieClip;
import createjs.display.Sprite;
import haxe.extern.EitherType;

/**
 * The ButtonHelper is a helper class to create interactive buttons from MovieClip or Sprite instances.
 * This class will intercept mouse events from an object, and automatically call gotoAndStop or gotoAndPlay,
 * to the respective animation labels, add a pointer cursor, and allows the user to define a hit state frame.
 * 
 * The ButtonHelper instance does not need to be added to the stage, but a reference should be maintained
 * to prevent garbage collection.
 * 
 * Note that over states will not work unless you call enableMouseOver.
 * Example
 * <code>
 * var helper = new ButtonHelper(myInstance, "out", "over", "down", false, myInstance, "hit");
 * myInstance.addEventListener(MouseEvent.CLICK, handleClick);
 * function handleClick(event) {
 *     // Click Happened.
 * }
 * </code>
 * 
 * Documentation: https://www.createjs.com/docs/easeljs/classes/ButtonHelper.html
 * @author VolkovRA
 */
@:native("createjs.ButtonHelper")
extern class ButtonHelper 
{
	/**
	 * Create a new ButtonHelper.
	 * @param	target		The instance to manage.
	 * @param	outLabel	The label or animation to go to when the user rolls out of the button.
	 * @param	overLabel	The label or animation to go to when the user rolls over the button.
	 * @param	downLabel	The label or animation to go to when the user presses the button.
	 * @param	play		If the helper should call "gotoAndPlay" or "gotoAndStop" on the button when changing states.
	 * @param	hitArea		An optional item to use as the hit state for the button.
	 * 						If this is not defined, then the button's visible states will be used instead.
	 * 						Note that the same instance as the "target" argument can be used for the hitState.
	 * @param	hitLabel	The label or animation on the hitArea instance that defines the hitArea bounds.
	 * 						If this is null, then the default state of the hitArea will be used. *
	 */
	public function new(	target:EitherType<Sprite, MovieClip>,
							outLabel:EitherType<Int, String> = "out",
							overLabel:EitherType<Int, String> = "over",
							downLabel:EitherType<Int, String> = "down",
							play:Bool = false,
							hitArea:DisplayObject = null,
							hitLabel:EitherType<Int, String> = null
	);
	
	
	
	////////////////////
	//   PROPERTIES   //
	////////////////////
	
	/**
	 * The target for this button helper.
	 */
	public var target:EitherType<Sprite, MovieClip>;
	
	/**
	 * The label name or frame number to display when the user presses on the target.
	 * Default: "down"
	 */
	public var downLabel:EitherType<Int, String>;
	
	/**
	 * The label name or frame number to display when the user mouses over the target.
	 * Default: "out"
	 */
	public var outLabel:EitherType<Int, String>;
	
	/**
	 * The label name or frame number to display when the user mouses out of the target.
	 * Default: "over"
	 */
	public var overLabel:EitherType<Int, String>;
	
	/**
	 * If true, then ButtonHelper will call gotoAndPlay, if false, it will use gotoAndStop.
	 * Default: false
	 */
	public var play:Bool;
	
	/**
	 * Enables or disables the button functionality on the target.
	 */
	public var enabled:Bool;
	
	
	
	/////////////////
	//   METHODS   //
	/////////////////
	
	/**
	 * Use the enabled property instead.
	 */
	@:deprecated
	@:noCompletion
	public function getEnabled():Bool;
	
	/**
	 * Use the enabled property instead.
	 */
	@:deprecated
	@:noCompletion
	public function setEnabled(value:Bool):Void;
	
	/**
	 * Returns a string representation of this ButtonHelper.
	 * @return	A string representation of the instance.
	 */
	public function toString():String;
}