package createjs.display;

import js.html.CanvasRenderingContext2D;

/**
 * Display one or more lines of dynamic text (not user editable) in the display list.
 * Line wrapping support (using the lineWidth) is very basic, wrapping on spaces and tabs only. Note that as an
 * alternative to Text, you can position HTML text above or below the canvas relative to items in the display
 * list using the localToGlobal method, or using DOMElement.
 * 
 * <b>Please note that Text does not support HTML text, and can only display one font style at a time.</b>
 * To use multiple font styles, you will need to create multiple text instances, and position them manually.
 * 
 * Example
 * <code>
 * var text = new Text("Hello World", "20px Arial", "#ff7700");
 * text.x = 100;
 * text.textBaseline = TextBaseline.ALPHABETIC;
 * </code>
 * 
 * CreateJS Text supports web fonts (the same rules as Canvas).
 * The font must be loaded and supported by the browser before it can be displayed.
 * 
 * Note: Text can be expensive to generate, so cache instances where possible.
 * Be aware that not all browsers will render Text exactly the same.
 * 
 * EVENTS
 * Event.TICK				Dispatched on each display object on a stage whenever the stage updates. This occurs immediately before the
 * 							rendering (draw) pass. When update is called, first all display objects on the stage dispatch the tick event,
 * 							then all of the display objects are drawn to stage. Children will have their Tick:event event dispatched in
 * 							order of their depth prior to the event being dispatched on their parent.
 * 
 * Event.ADDED				Dispatched when the display object is added to a parent container.
 * 
 * Event.REMOVED			Dispatched when the display object is removed from its parent container.
 * 
 * MouseEvent.CLICK			Dispatched when the user presses their left mouse button and then releases it while over the display object.
 * 							See the MouseEvent class for a listing of event properties.
 * 
 * MouseEvent.DBL_CLICK		Dispatched when the user double clicks their left mouse button over this display object.
 * 							See the MouseEvent class for a listing of event properties.
 * 
 * MouseEvent.MOUSE_DOWN	Dispatched when the user presses their left mouse button over the display object.
 * 							See the MouseEvent class for a listing of event properties.
 * 	
 * MouseEvent.MOUSE_OUT		Dispatched when the user's mouse leaves this display object. This event must be enabled using enableMouseOver.
 * 							See also rollout. See the MouseEvent class for a listing of event properties.
 * 
 * MouseEvent.MOUSE_OVER	Dispatched when the user's mouse enters this display object. This event must be enabled using enableMouseOver.
 * 							See also rollover. See the MouseEvent class for a listing of event properties.
 * 
 * MouseEvent.PRESS_MOVE	After a mousedown occurs on a display object, a pressmove event will be generated on that object whenever the
 * 							mouse moves until the mouse press is released. This can be useful for dragging and similar operations.
 * 							Please note that if the initial mouse target from a mousedown event is removed from the stage after being
 * 							pressed (e.g. during a pressmove event), a pressmove event is still generated. However since it is no longer
 * 							in the display list, the event can not bubble. This means that previous ancestors (parent containers) will
 * 							not receive the event, and therefore can not re-dispatch it. If you intend to listen for pressup or pressmove
 * 							on a dynamic object (such as a MovieClip or Container), then ensure you set mouseChildren to false.
 * 	
 * MouseEvent.PRESS_UP		After a mousedown occurs on a display object, a pressup event will be generated on that object when that mouse
 * 							press is released. This can be useful for dragging and similar operations.
 * 							Please note that if the initial mouse target from a mousedown event is removed from the stage after being
 * 							pressed (e.g. during a pressmove event), a pressup event is still generated. However since it is no longer in
 * 							the display list, the event can not bubble. This means that previous ancestors (parent containers) will not
 * 							receive the event, and therefore can not re-dispatch it. If you intend to listen for pressmove or pressup on
 * 							a dynamic object (such as a MovieClip or Container), then ensure you set mouseChildren to false.
 * 	
 * MouseEvent.ROLL_OVER		This event is similar to mouseover, with the following differences: it does not bubble, and it considers
 * 							Container instances as an aggregate of their content. This event must be enabled using enableMouseOver. See
 * 							the MouseEvent class for a listing of event properties.
 * 	
 * MouseEvent.ROLL_OUT		This event is similar to mouseout, with the following differences: it does not bubble, and it considers Container
 * 							instances as an aggregate of their content. This event must be enabled using enableMouseOver. See the MouseEvent
 * 							class for a listing of event properties.
 * 
 * Documentation: https://www.createjs.com/docs/easeljs/classes/Text.html
 * @author VolkovRA
 */
@:native("createjs.Text")
extern class Text extends DisplayObject 
{
	/**
	 * Create a new Text.
	 * @param	text	The text to display.
	 * @param	font	The font style to use. Any valid value for the CSS font attribute is acceptable (ex. "bold 36px Arial").
	 * @param	color	The color to draw the text in. Any valid value for the CSS color attribute is acceptable (ex. "#F00", "red", or "#FF0000").
	 */
	public function new(text:String, font:String, color:String);
	
	
	
	////////////////////
	//   PROPERTIES   //
	////////////////////
	
	/**
	 * The text to display.
	 */
	public var text:String;
	
	/**
	 * The color to draw the text in.
	 * Any valid value for the CSS color attribute is acceptable (ex. "#F00"). 
	 * It will also accept valid canvas fillStyle values.
	 * Default: "#000"
	 */
	public var color:String;
	
	/**
	 * The font style to use.
	 * Any valid value for the CSS font attribute is acceptable (ex. "bold 36px Arial").
	 */
	public var font:String;
	
	/**
	 * Indicates the line height (vertical distance between baselines) for multi-line text.
	 * If null or 0, the value of getMeasuredLineHeight is used.
	 */
	public var lineHeight:Float;
	
	/**
	 * Indicates the maximum width for a line of text before it is wrapped to multiple lines.
	 * If null, the text will not be wrapped.
	 */
	public var lineWidth:Float;
	
	/**
	 * The maximum width to draw the text.
	 * If maxWidth is specified (not null), the text will be condensed or shrunk to make it fit in this width.
	 * For detailed information view the whatwg spec.
	 */
	public var maxWidth:Float;
	
	/**
	 * If greater than 0, the text will be drawn as a stroke (outline) of the specified width.
	 */
	public var outline:Float;
	
	/**
	 * The horizontal text alignment.
	 * Any of "start", "end", "left", "right", and "center".
	 * For detailed information view the whatwg spec.
	 * Default: TextAlign.LEFT
	 */
	public var textAlign:TextAlign;
	
	/**
	 * The vertical alignment point on the font.
	 * Any of "top", "hanging", "middle", "alphabetic", "ideographic", or "bottom".
	 * For detailed information view the whatwg spec.
	 * Default: TextBaseline.TOP
	 */
	public var textBaseline:TextBaseline;
	
	
	
	/////////////////
	//   METHODS   //
	/////////////////
	
	/**
	 * Returns the approximate height of multi-line text by multiplying the number of lines against either the
	 * lineHeight (if specified) or getMeasuredLineHeight.
	 * Note that this operation requires the text flowing logic to run, which has an associated CPU cost.
	 * @return	The approximate height of the untransformed multi-line text.
	 */
	public function getMeasuredHeight():Float;
	
	/**
	 * Returns an approximate line height of the text, ignoring the lineHeight property.
	 * This is based on the measured width of a "M" character multiplied by 1.2, which provides an approximate line height for most fonts.
	 * @return	An approximate line height of the text, ignoring the lineHeight property.
	 * 			This is based on the measured width of a "M" character multiplied by 1.2, which approximates em for most fonts.
	 */
	public function getMeasuredLineHeight():Float;
	
	/**
	 * Returns the measured, untransformed width of the text without wrapping.
	 * Use getBounds for a more robust value.
	 * @return	The measured, untransformed width of the text.
	 */
	public function getMeasuredWidth():Float;
	
	/**
	 * Returns an object with width, height, and lines properties.
	 * The width and height are the visual width and height of the drawn text. The lines property contains an array of strings, one
	 * for each line of text that will be drawn, accounting for line breaks and wrapping. These strings have trailing whitespace removed.
	 * @return	Text metrics.
	 */
	public function getMetrics():Metrics;
	
	
	
	//////////////////
	//   OVERRIDE   //
	//////////////////
	
	/**
	 * Draws the display object into the specified context ignoring its visible, alpha, shadow, and transform.
	 * Returns true if the draw was handled (useful for overriding functionality).
	 * NOTE: This method is mainly for internal use, though it may be useful for advanced uses.
	 * @param	context		The canvas 2D context object to draw into.
	 * @param	ignoreCache	Indicates whether the draw operation should ignore any current cache.
	 * 						For example, used for drawing the cache (to prevent it from simply drawing an existing cache back into itself).
	 * @return	Returns true if the draw was handled (useful for overriding functionality).
	 */
	override public function draw(context:CanvasRenderingContext2D, ignoreCache:Bool = false):Bool;
	
	/**
	 * Returns true or false indicating whether the display object would be visible if drawn to a canvas.
	 * This does not account for whether it would be visible within the boundaries of the stage. NOTE: This method is
	 * mainly for internal use, though it may be useful for advanced uses.
	 * @return	Whether the display object would be visible if drawn to a canvas
	 */
	override public function isVisible():Bool;
	
	/**
	 * Returns a string representation of this Text.
	 * @return A string representation of the instance.
	 */
	override public function toString():String;
}