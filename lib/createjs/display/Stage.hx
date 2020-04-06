package createjs.display;

import createjs.events.Event;
import createjs.geom.Rectangle;
import haxe.extern.EitherType;
import js.html.CanvasElement;
import js.html.CanvasRenderingContext2D;
import js.html.Element;

/**
 * A stage is the root level Container for a display list.
 * Each time its tick method is called, it will render its display list to its target canvas.
 * 
 * This example creates a stage, adds a child to it, then uses Ticker to update the child and redraw the stage using update.
 * <code>
 * var stage = new Stage("canvasElementId");
 * var image = new Bitmap("imagePath.png");
 * stage.addChild(image);
 * Ticker.addEventListener(Event.TICK, handleTick);
 * function handleTick(event) {
 *     image.x += 10;
 *     stage.update();
 * }
 * </code>
 * 
 * EVENTS
 * Event.TICK					Dispatched on each display object on a stage whenever the stage updates. This occurs immediately before the
 * 								rendering (draw) pass. When update is called, first all display objects on the stage dispatch the tick event,
 * 								then all of the display objects are drawn to stage. Children will have their Tick:event event dispatched in
 * 								order of their depth prior to the event being dispatched on their parent.
 * 
 * Event.ADDED					Dispatched when the display object is added to a parent container.
 * 
 * Event.REMOVED				Dispatched when the display object is removed from its parent container.
 * 
 * Event.DRAW_START				Dispatched each update immediately before the canvas is cleared and the display list is drawn to it. You can
 * 								call preventDefault on the event object to cancel the draw.
 * 
 * Event.DRAW_END				Dispatched each update immediately after the display list is drawn to the canvas and the canvas context is restored.
 * 
 * Event.TICK_START				Dispatched each update immediately before the tick event is propagated through the display list. You can call
 * 								preventDefault on the event object to cancel propagating the tick event.
 * 
 * Event.TICK_END				Dispatched each update immediately after the tick event is propagated through the display list. Does not fire if
 * 								tickOnUpdate is false. Precedes the "drawstart" event.
 * 
 * MouseEvent.MOUSE_ENTER		Dispatched when the mouse moves into the canvas area (mouseInBounds == false) from outside it
 * 								(mouseInBounds == true). This is currently only dispatched for mouse input (not touch). See the MouseEvent class
 * 								for a listing of event properties.
 * 
 * MouseEvent.MOUSE_LEAVE		Dispatched when the mouse moves from within the canvas area (mouseInBounds == true) to outside it
 * 								(mouseInBounds == false). This is currently only dispatched for mouse input (not touch). See the MouseEvent class
 * 								for a listing of event properties.
 * 
 * MouseEvent.STAGE_MOUSE_DOWN	Dispatched when the user presses their left mouse button on the canvas. See the MouseEvent class for a listing of
 * 								event properties.
 * 
 * MouseEvent.STAGE_MOUSE_UP	Dispatched when the user the user presses somewhere on the stage, then releases the mouse button anywhere that the
 * 								page can detect it (this varies slightly between browsers). You can use mouseInBounds to check whether the mouse is
 * 								currently within the stage bounds. See the MouseEvent class for a listing of event properties.
 * 
 * MouseEvent.STAGE_MOUSE_MOVE	Dispatched when the user moves the mouse over the canvas. See the MouseEvent class for a listing of event properties.
 * 
 * MouseEvent.CLICK				Dispatched when the user presses their left mouse button and then releases it while over the display object.
 * 								See the MouseEvent class for a listing of event properties.
 * 
 * MouseEvent.DBL_CLICK			Dispatched when the user double clicks their left mouse button over this display object.
 * 								See the MouseEvent class for a listing of event properties.
 * 
 * MouseEvent.MOUSE_DOWN		Dispatched when the user presses their left mouse button over the display object.
 * 								See the MouseEvent class for a listing of event properties.
 * 	
 * MouseEvent.MOUSE_OUT			Dispatched when the user's mouse leaves this display object. This event must be enabled using enableMouseOver.
 * 								See also rollout. See the MouseEvent class for a listing of event properties.
 * 
 * MouseEvent.MOUSE_OVER		Dispatched when the user's mouse enters this display object. This event must be enabled using enableMouseOver.
 * 								See also rollover. See the MouseEvent class for a listing of event properties.
 * 
 * MouseEvent.PRESS_MOVE		After a mousedown occurs on a display object, a pressmove event will be generated on that object whenever the
 * 								mouse moves until the mouse press is released. This can be useful for dragging and similar operations.
 * 								Please note that if the initial mouse target from a mousedown event is removed from the stage after being
 * 								pressed (e.g. during a pressmove event), a pressmove event is still generated. However since it is no longer
 * 								in the display list, the event can not bubble. This means that previous ancestors (parent containers) will
 * 								not receive the event, and therefore can not re-dispatch it. If you intend to listen for pressup or pressmove
 * 								on a dynamic object (such as a MovieClip or Container), then ensure you set mouseChildren to false.
 * 	
 * MouseEvent.PRESS_UP			After a mousedown occurs on a display object, a pressup event will be generated on that object when that mouse
 * 								press is released. This can be useful for dragging and similar operations.
 * 								Please note that if the initial mouse target from a mousedown event is removed from the stage after being
 * 								pressed (e.g. during a pressmove event), a pressup event is still generated. However since it is no longer in
 * 								the display list, the event can not bubble. This means that previous ancestors (parent containers) will not
 * 								receive the event, and therefore can not re-dispatch it. If you intend to listen for pressmove or pressup on
 * 								a dynamic object (such as a MovieClip or Container), then ensure you set mouseChildren to false.
 * 	
 * MouseEvent.ROLL_OVER			This event is similar to mouseover, with the following differences: it does not bubble, and it considers
 * 								Container instances as an aggregate of their content. This event must be enabled using enableMouseOver. See
 * 								the MouseEvent class for a listing of event properties.
 * 	
 * MouseEvent.ROLL_OUT			This event is similar to mouseout, with the following differences: it does not bubble, and it considers Container
 * 								instances as an aggregate of their content. This event must be enabled using enableMouseOver. See the MouseEvent
 * 								class for a listing of event properties.
 * 
 * Documentation: https://www.createjs.com/docs/easeljs/classes/Stage.html
 * @author VolkovRA
 */
@:native("createjs.Stage")
extern class Stage extends Container
{
	/**
	 * Create a new Stage.
	 * @param	canvas	A canvas object that the Stage will render to, or the string id of a canvas object in the current document.
	 */
	public function new(canvas:EitherType<String, Element>);
	
	
	
	////////////////////
	//   PROPERTIES   //
	////////////////////
	
	/**
	 * Indicates whether the stage should automatically clear the canvas before each render.
	 * You can set this to false to manually control clearing (for generative art, or when pointing
	 * multiple stages at the same canvas for example).
	 * <code>
	 * var stage = new Stage("canvasId");
	 * stage.autoClear = false;
	 * </code>
	 * Default: true
	 */
	public var autoClear:Bool;
	
	/**
	 * The canvas the stage will render to.
	 * Multiple stages can share a single canvas, but you must disable autoClear for all but the first
	 * stage that will be ticked (or they will clear each other's render).
	 * 
	 * When changing the canvas property you must disable the events on the old canvas, and enable events
	 * on the new canvas or mouse events will not work as expected. For example:
	 * <code>
	 * myStage.enableDOMEvents(false);
	 * myStage.canvas = anotherCanvas;
	 * myStage.enableDOMEvents(true);
	 * </code>
	 */
	public var canvas:CanvasElement;
	
	/**
	 * Specifies the area of the stage to affect when calling update.
	 * This can be use to selectively re-draw specific regions of the canvas.
	 * If null, the whole canvas area is drawn.
	 */
	public var drawRect:Rectangle;
	
	/**
	 * Default event handler that calls the Stage update method when a tick event is received.
	 * This allows you to register a Stage instance as a event listener on Ticker directly, using:
	 * <code>
	 * Ticker.addEventListener(Event.TICK, myStage);
	 * </code>
	 * Note that if you subscribe to ticks using this pattern, then the tick event object will be passed
	 * through to display object tick handlers, instead of delta and paused parameters.
	 */
	public var handleEvent:Event->Void;
	
	/**
	 * The hitArea property is not supported for Stage.
	 * Default: null
	 */
	override public var hitArea:DisplayObject;
	
	/**
	 * Indicates whether the mouse is currently within the bounds of the canvas.
	 * Default: false
	 */
	public var mouseInBounds:Bool;
	
	/**
	 * If true, mouse move events will continue to be called when the mouse leaves the target canvas.
	 * See mouseInBounds, and MouseEvent x/y/rawX/rawY.
	 * Default: false
	 */
	public var mouseMoveOutside:Bool;
	
	/**
	 * The current mouse X position on the canvas.
	 * If the mouse leaves the canvas, this will indicate the most recent position over the canvas, and mouseInBounds will be set to false.
	 */
	public var mouseX(default, null):Float;
	
	/**
	 * The current mouse Y position on the canvas.
	 * If the mouse leaves the canvas, this will indicate the most recent position over the canvas, and mouseInBounds will be set to false.
	 */
	public var mouseY(default, null):Float;
	
	/**
	 * Specifies a target stage that will have mouse / touch interactions relayed to it after this stage handles them.
	 * This can be useful in cases where you have multiple layered canvases and want user interactions events to pass through. For example,
	 * this would relay mouse events from topStage to bottomStage:
	 * <code>
	 * topStage.nextStage = bottomStage;
	 * </code>
	 * To disable relaying, set nextStage to null.
	 * 
	 */
	public var nextStage:Stage;
	
	/**
	 * Prevents selection of other elements in the html page if the user clicks and drags, or double clicks on the canvas.
	 * This works by calling preventDefault() on any mousedown events (or touch equivalent) originating on the canvas.
	 * Default: true
	 */
	public var preventSelection:Bool;
	
	/**
	 * Indicates whether display objects should be rendered on whole pixels.
	 * You can set the DisplayObject/snapToPixel property of display objects to false to enable/disable this behaviour on a per instance basis.
	 * Default: false
	 */
	public var snapToPixelEnabled:Bool;
	
	/**
	 * If true, tick callbacks will be called on all display objects on the stage prior to rendering to the canvas.
	 * Default: true
	 */
	public var tickOnUpdate:Bool;
	
	
	
	/////////////////
	//   METHODS   //
	/////////////////
	
	/**
	 * Clears the target canvas.
	 * Useful if autoClear is set to false.
	 */
	public function clear():Void;
	
	/**
	 * Enables or disables the event listeners that stage adds to DOM elements (window, document and canvas).
	 * It is good practice to disable events when disposing of a Stage instance, otherwise the stage will
	 * continue to receive events from the page.
	 * 
	 * When changing the canvas property you must disable the events on the old canvas, and enable events on
	 * the new canvas or mouse events will not work as expected. For example:
	 * <code>
	 * myStage.enableDOMEvents(false);
	 * myStage.canvas = anotherCanvas;
	 * myStage.enableDOMEvents(true);
	 * </code>
	 * @param	enable	Indicates whether to enable or disable the events. Default is true.
	 */
	public function enableDOMEvents(enable:Bool = true):Void;
	
	/**
	 * Enables or disables (by passing a frequency of 0) mouse over (mouseover and mouseout) and roll over events
	 * (rollover and rollout) for this stage's display list. These events can be expensive to generate, so they
	 * are disabled by default. The frequency of the events can be controlled independently of mouse move events
	 * via the optional frequency parameter.
	 * <code>
	 * var stage = new Stage("canvasId");
	 * stage.enableMouseOver(10); // 10 updates per second
	 * </code>
	 * @param	frequency	Optional param specifying the maximum number of times per second to broadcast mouse over/out events.
	 * 						Set to 0 to disable mouse over events completely. Maximum is 50. A lower frequency is less responsive,
	 * 						but uses less CPU.
	 */
	public function enableMouseOver(frequency:Float = 20):Void;
	
	/**
	 * Propagates a tick event through the display list.
	 * This is automatically called by update unless tickOnUpdate is set to false.
	 * 
	 * If a props object is passed to tick(), then all of its properties will be copied to the event object that is propagated to listeners.
	 * 
	 * Some time-based features in EaselJS (for example Sprite/framerate require that a tick event object (or equivalent object with a delta
	 * property) be passed as the props parameter to tick(). For example:
	 * <code>
	 * Ticker.on(Event.TICK, handleTick);
	 * function handleTick(evtObj) {
	 *     // clone the event object from Ticker, and add some custom data to it:
	 *     var evt = evtObj.clone().set({greeting:"hello", name:"world"});
	 * 
	 *     // pass it to stage.update():
	 *     myStage.update(evt); // subsequently calls tick() with the same param
	 * }
	 * 
	 * // ...
	 * myDisplayObject.on(Event.TICK, handleDisplayObjectTick);
	 * function handleDisplayObjectTick(evt) {
	 *     console.log(evt.delta); // the delta property from the Ticker tick event object
	 *     console.log(evt.greeting, evt.name); // custom data: "hello world"
	 * }
	 * </code>
	 * @param	properties	An object with properties that should be copied to the event object. Should usually be a Ticker event
	 * 						object, or similar object with a delta property.
	 */
	public function tick(properties:Dynamic = null):Void;
	
	/**
	 * Returns a data url that contains a Base64-encoded image of the contents of the stage.
	 * The returned data url can be specified as the src value of an image element.
	 * @param	backgroundColor	The background color to be used for the generated image. Any valid CSS color value is allowed.
	 * 							The default value is a transparent background.
	 * @param	mimeType		The MIME type of the image format to be create. The default is "image/png". If an unknown MIME type
	 * 							is passed in, or if the browser does not support the specified MIME type, the default value will be used.
	 * @return	A Base64 encoded image.
	 */
	public function toDataURL(backgroundColor:String = null, mimeType:String = "image/png"):String;
	
	/**
	 * Each time the update method is called, the stage will call tick unless tickOnUpdate is set to false,
	 * and then render the display list to the canvas.
	 * @param	properties	Props object to pass to tick(). Should usually be a Ticker event object, or similar object with a delta property.
	 */
	public function update(properties:Dynamic = null):Void;
	
	
	
	//////////////////
	//   OVERRIDE   //
	//////////////////
	
	/**
	 * Draws the display object into the specified context ignoring its visible, alpha, shadow, and transform.
	 * Returns true if the draw was handled (useful for overriding functionality).
	 * 
	 * NOTE: This method is mainly for internal use, though it may be useful for advanced uses.
	 * @param	context		The canvas 2D context object to draw into.
	 * @param	ignoreCache	Indicates whether the draw operation should ignore any current cache.
	 * 						For example, used for drawing the cache (to prevent it from simply drawing an existing cache back into itself).
	 * @return	Returns true if the draw was handled (useful for overriding functionality).
	 */
	override public function draw(context:CanvasRenderingContext2D, ignoreCache:Bool = false):Bool;
	
	/**
	 * Tests whether the display object intersects the specified local point (ie. draws a pixel with alpha > 0 at the specified position).
	 * This ignores the alpha, shadow and compositeOperation of the display object, and all transform properties including regX/Y.
	 * @param	x	The x position to check in the display object's local coordinates.
	 * @param	y	The y position to check in the display object's local coordinates.
	 * @return	A Boolean indicating whether there is a visible section of a DisplayObject that overlaps the specified coordinates.
	 */
	override public function hitTest(x:Float, y:Float):Bool;
	
	/**
	 * Returns true or false indicating whether the display object would be visible if drawn to a canvas.
	 * This does not account for whether it would be visible within the boundaries of the stage.
	 * NOTE: This method is mainly for internal use, though it may be useful for advanced uses.
	 * @return	Boolean indicating whether the display object would be visible if drawn to a canvas
	 */
	override public function isVisible():Bool;
	
	/**
	 * Stage instances cannot be cloned.
	 */
	override public function clone(recursive:Bool = false):Stage;
	
	/**
	 * Returns a string representation of this Stage.
	 * @return A string representation of the instance.
	 */
	override public function toString():String;
}