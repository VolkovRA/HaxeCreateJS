package createjs.display;

import createjs.filters.Filter;
import createjs.sheet.FrameIndex;
import createjs.sheet.SpriteSheet;
import js.html.CanvasElement;
import js.html.ImageElement;
import js.html.webgl.Program;
import js.html.webgl.Texture;
import js.html.webgl.WebGL2RenderingContext;

/**
 * A StageGL instance is the root level Container for an WebGL-optimized display list, which is used in place of the usual Stage.
 * This class should behave identically to a Stage except for WebGL-specific functionality.
 * 
 * Each time the tick method is called, the display list is rendered to the target <canvas/> instance, ignoring non-WebGL-compatible
 * display objects. On devices and browsers that don't support WebGL, content will automatically be rendered to canvas 2D context instead.
 * 
 * Limitations
 *   1. Shape, Shadow, and Text are not rendered when added to the display list.
 *   2. To display something StageGL cannot render, cache the object. Caches can be rendered regardless of source.
 *   3. Images are wrapped as a webGL "Texture". Each graphics card has a limit to its concurrent Textures, too many Textures will
 * 		noticeably slow performance.
 *   4. Each cache counts as an individual Texture. As such SpriteSheet and SpriteSheetBuilder are recommended practices to help keep
 * 		texture counts low.
 *   5. To use any image node (DOM Image/Canvas Element) between multiple StageGL instances it must be a clone, otherwise the GPU texture
 * 		loading and tracking will get confused.
 *   6. To avoid an up/down scaled render you must call updateViewport if you resize your canvas after making a StageGL instance, this will
 * 		properly size the WebGL context stored in memory.
 *   7. Best performance in demanding scenarios will come from manual management of texture memory, but it is handled automatically by default.
 * 		See releaseTexture for details.
 * 
 * Example
 * This example creates a StageGL instance, adds a child to it, then uses the EaselJS Ticker to update the child and redraw the stage.
 * <code>
 * var stage = new StageGL("canvasElementId");
 * 
 * var image = new Bitmap("imagePath.png");
 * stage.addChild(image);
 * 
 * Ticker.on(Event.TICK, handleTick);
 * 
 * function handleTick(event) {
 *     image.x += 10;
 *     stage.update();
 * }
 * </code>
 * 
 * Notes
 *   1. StageGL is not currently included in the minified version of EaselJS.
 *   2. SpriteContainer (the previous approach to WebGL with EaselJS) has been deprecated.
 *   3. Earlier versions of WebGL support in EaselJS (SpriteStage and SpriteContainer) had hard limitations on images per container, which have been solved.
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
 * Documentation: https://www.createjs.com/docs/easeljs/classes/StageGL.html
 * @author VolkovRA
 */
@:native("createjs.StageGL")
extern class StageGL extends Stage 
{
	/**
	 * Create a new StageGL.
	 * @param	canvas	A canvas object that StageGL will render to, or the string id of a canvas object in the current DOM.
	 * @param	options	All the option parameters in a reference object, some are not supported by some browsers.
	 */
	@:overload(function(id:String, options:StageGLConfig):Void {})
	public function new(canvas:CanvasElement, options:StageGLConfig);
	
	
	
	////////////////
	//   STATIC   //
	////////////////
	
	/**
	 * Body of the fragment shader.
	 * The cover shader is designed to be a simple vertex/uv only texture render that covers the render surface.
	 * Shader code may contain templates that are replaced pre-compile.
	 */
	static public var COVER_FRAGMENT_BODY(default, null):String;
	
	/**
	 * Actual full header for the fragment shader.
	 * Includes the varying header. The cover shader is designed to be a simple vertex/uv only texture render that covers the render surface.
	 * Shader code may contain templates that are replaced pre-compile.
	 */
	static public var COVER_FRAGMENT_HEADER (default, null):String;
	
	/**
	 * U/V for COVER_VERT.
	 */
	static public var COVER_UV(default, null):Array<Float>;
	
	/**
	 * Flipped U/V for StageGL:COVER_VERT:property.
	 */
	static public var COVER_UV_FLIP(default, null):Array<Float>;
	
	/**
	 * Portion of the shader that contains the "varying" properties required in both vertex and fragment shaders.
	 * The cover shader is designed to be a simple vertex/uv only texture render that covers the render surface.
	 * Shader code may contain templates that are replaced pre-compile.
	 */
	static public var COVER_VARYING_HEADER(default, null):String;
	
	/**
	 * Vertex positions for a card that covers the entire render.
	 * Used with render targets primarily.
	 */
	static public var COVER_VERT(default, null):Array<Float>;
	
	/**
	 * Body of the vertex shader.
	 * The cover shader is designed to be a simple vertex/uv only texture render that covers the render surface.
	 * Shader code may contain templates that are replaced pre-compile.
	 */
	static public var COVER_VERTEX_BODY(default, null):String;
	
	/**
	 * Actual full header for the vertex shader.
	 * Includes the varying header. The cover shader is designed to be a simple vertex/uv only texture render that covers the render surface.
	 * Shader code may contain templates that are replaced pre-compile.
	 */
	static public var COVER_VERTEX_HEADER(default, null):String;
	
	/**
	 * The default value for the maximum number of cards we want to process in a batch.
	 * See WEBGL_MAX_INDEX_NUM for a hard limit.
	 * Default: 10000
	 */
	static public var DEFAULT_MAX_BATCH_SIZE(default, null):Float;
	
	/**
	 * The number of triangle indices it takes to form a Card.
	 * 3 per triangle, 2 triangles.
	 * Default: 6
	 */
	static public var INDICIES_PER_CARD(default, null):Float;
	
	/**
	 * No description.
	 */
	static public var PARTICLE_FRAGMENT_BODY(default, null):String;
	
	/**
	 * No description.
	 */
	static public var PARTICLE_VERTEX_BODY(default, null):String;
	
	/**
	 * Body of the fragment shader.
	 * The regular shader is designed to render all expected objects.
	 * Shader code may contain templates that are replaced pre-compile.
	 */
	static public var REGULAR_FRAGMENT_BODY(default, null):String;
	
	/**
	 * Actual full header for the fragment shader.
	 * Includes the varying header. The regular shader is designed to render all expected objects.
	 * Shader code may contain templates that are replaced pre-compile.
	 */
	static public var REGULAR_FRAGMENT_HEADER(default, null):String;
	
	/**
	 * Portion of the shader that contains the "varying" properties required in both vertex and fragment shaders.
	 * The regular shader is designed to render all expected objects.
	 * Shader code may contain templates that are replaced pre-compile.
	 */
	static public var REGULAR_VARYING_HEADER(default, null):String;
	
	/**
	 * Body of the vertex shader.
	 * The regular shader is designed to render all expected objects.
	 * Shader code may contain templates that are replaced pre-compile.
	 */
	static public var REGULAR_VERTEX_BODY(default, null):String;
	
	/**
	 * Actual full header for the vertex shader.
	 * Includes the varying header. The regular shader is designed to render all expected objects.
	 * Shader code may contain templates that are replaced pre-compile.
	 */
	static public var REGULAR_VERTEX_HEADER(default, null):String;
	
	/**
	 * Default U/V rect for dealing with full coverage from an image source.
	 * Default: {t:0, l:0, b:1, r:1}
	 */
	static public var UV_RECT(default, null):UVRect;
	
	/**
	 * The number of properties defined per vertex (x, y, textureU, textureV, textureIndex, alpha)
	 * Default: 6
	 */
	static public var VERTEX_PROPERTY_COUNT(default, null):Float;
	
	/**
	 * The maximum size WebGL allows for element index numbers.
	 * Uses a 16 bit unsigned integer. It takes 6 indices to make a unique card.
	 * Default: 65536
	 */
	static public var WEBGL_MAX_INDEX_NUM(default, null):Float;
	
	/**
	 * Test a context to see if it has WebGL enabled on it.
	 * @param	context	The context to test
	 * @return	Whether WebGL is enabled
	 */
	static public function isWebGLActive(context:WebGL2RenderingContext):Bool;
	
	
	
	////////////////////
	//   PROPERTIES   //
	////////////////////
	
	/**
	 * Indicates whether WebGL is being used for rendering.
	 * For example, this would be false if WebGL is not supported in the browser.
	 */
	public var isWebGL(default, null):Bool;
	
	/**
	 * Console log potential issues and problems.
	 * This is designed to have minimal performance impact, so if extensive debugging information is required, this may be inadequate.
	 * See WebGLInspector
	 * Default: false
	 */
	public var vocalDebug:Bool;
	
	
	
	/////////////////
	//   METHODS   //
	/////////////////
	
	/**
	 * Calculate the U/V co-ordinate based info for sprite frames. Instead of pixel count it uses a 0-1 space.
	 * Also includes the ability to get info back for a specific frame, or only calculate that one frame.
	 * <code>
	 * //generate UV rects for all entries
	 * StageGL.buildUVRects( spriteSheetA );
	 * //generate all, fetch the first
	 * var firstFrame = StageGL.buildUVRects( spriteSheetB, 0 );
	 * //generate the rect for just a single frame for performance's sake
	 * var newFrame = StageGL.buildUVRects( dynamicSpriteSheet, newFrameIndex, true );
	 * </code>
	 * NOTE: This method is mainly for internal use, though it may be useful for advanced uses.
	 * @param	spritesheet	The spritesheet to find the frames on.
	 * @param	target		The index of the frame to return.
	 * @param	onlyTarget	Whether "target" is the only frame that gets calculated.
	 * @return	The target frame if supplied and present or a generic frame {t, l, b, r}
	 */
	public function buildUVRects(spritesheet:SpriteSheet, target:FrameIndex = -1, onlyTarget:Bool = false):UVRect;
	
	/**
	 * Draws the target into the correct context, be it a canvas or Render Texture using WebGL.
	 * NOTE: This method is mainly for internal use, though it may be useful for advanced uses.
	 * @param	target	The object we're drawing into cache.
	 * 					For example, used for drawing the cache (to prevent it from simply drawing an existing cache back into itself).
	 * @param	filters	The filters we're drawing into cache.
	 * @param	manager	The BitmapCache instance looking after the cache.
	 * @return	If the draw was handled by this function.
	 */
	public function cacheDraw(target:DisplayObject, filters:Array<Filter>, manager:BitmapCache):Bool;
	
	/**
	 * Returns a base texture that has no image or data loaded.
	 * Not intended for loading images. It may return null in some error cases, and trying to use a "null" texture can cause renders to fail.
	 * @param	width	The width of the texture in pixels, defaults to 1
	 * @param	height	The height of the texture in pixels, defaults to 1
	 * @return	A base texture.
	 */
	public function getBaseTexture(width:UInt = 1, height:UInt = 1):Texture;
	
	/**
	 * Fetches the shader compiled and set up to work with the provided filter/object.
	 * The shader is compiled on first use and returned on subsequent calls.
	 * @param	filter	The object which will provide the information needed to construct the filter shader.
	 * @return	WebGL Program.
	 */
	@:overload(function(obj:Dynamic):Program {})
	public function getFilterShader(filter:Filter):Program;
	
	/**
	 * Returns a base texture (see getBaseTexture) for details.
	 * Also includes an attached and linked render buffer in texture._frameBuffer.
	 * RenderTextures can be thought of as an internal canvas on the GPU that can be drawn to.
	 * @param	width	The width of the texture in pixels.
	 * @param	height	The height of the texture in pixels.
	 * @return	The basic texture instance with a render buffer property.
	 */
	public function getRenderBufferTexture(width:UInt, height:UInt):Texture;
	
	/**
	 * Render textures can't draw into themselves so any item being used for renderTextures needs two to alternate between.
	 * This function creates, gets, and toggles the render surface between the two.
	 * NOTE: This method is mainly for internal use, though it may be useful for advanced uses.
	 * @param	target	The object associated with the render textures, usually a cached object.
	 * @param	width	The width to create the texture at.
	 * @param	height	The height to create the texture at.
	 */
	public function getTargetRenderTexture(target:DisplayObject, width:Float, height:Float):Dynamic;
	
	/**
	 * Blocks, or frees a texture "slot" on the GPU.
	 * Can be useful if you are overflowing textures. When overflowing textures they are re-uploaded to the GPU every time
	 * they're encountered, this can be expensive with large textures. By blocking the slot you reduce available slots,
	 * potentially increasing draw calls, but mostly you prevent a texture being re-uploaded if it would have moved slots due to overflow.
	 * 
	 * NOTE: This method is mainly for internal use, though it may be useful for advanced uses. For example, block the slot a
	 * background image is stored in so there is less re-loading of that image.
	 * @param	id		The slot to be affected.
	 * @param	lock	Whether this slot is the one being locked.
	 */
	public function protectTextureSlot(id:Float, lock:Bool = false):Void;
	
	/**
	 * Similar to ReleaseTexture, but this function differs by searching for textures to release.
	 * It works by assuming that it can purge any texture which was last used more than "count" draw calls ago. Because this process
	 * is unaware of the objects and whether they may be used later on your stage, false positives can occur. It is recommended to
	 * manually manage your memory with releaseTexture, however, there are many use cases where this is simpler and error-free.
	 * This process is also run by default under the hood to prevent leaks. To disable it see the autoPurge property.
	 * @param	count	How many renders ago the texture was last used
	 */
	public function purgeTextures(count:Float = 100):Void;
	
	/**
	 * For every image encountered StageGL registers and tracks it automatically.
	 * This tracking can cause memory leaks if not purged. StageGL, by default, automatically purges them. This does have a cost
	 * and may unfortunately find false positives. This function is for manual management of this memory instead of the automatic
	 * system controlled by the autoPurge property.
	 * 
	 * This function will recursively remove all textures found on the object, its children, cache, etc. It will uncache objects
	 * and remove any texture it finds REGARDLESS of whether it is currently in use elsewhere. It is up to the developer to ensure
	 * that a texture in use is not removed.
	 * 
	 * Textures in use, or to be used again shortly, should not be removed. This is simply for performance reasons.
	 * Removing a texture in use will cause the texture to have to be re-uploaded slowing rendering.
	 * @param	item	An object that used the texture to be discarded.
	 * @param	safe	Should the release attempt to be "safe" and only delete this usage.
	 */
	@:overload(function(image:ImageElement, safe:Bool):Void {})
	@:overload(function(canvas:CanvasElement, safe:Bool):Void {})
	@:overload(function(texture:Texture, safe:Bool):Void {})
	public function releaseTexture(item:DisplayObject, safe:Bool):Void;
	
	/**
	 * Changes the webGL clear, aka "background" color to the provided value.
	 * A transparent clear is recommended, as non-transparent colours may create undesired boxes around some visuals.
	 * 
	 * The clear color will also be used for filters and other "render textures". The stage background will ignore the
	 * transparency value and display a solid color normally. For the stage to recognize and use transparency it must
	 * be created with the transparent flag set to true (see StageGL/constructor)).
	 * 
	 * Using "transparent white" to demonstrate, the valid data formats are as follows:
	 *   1. "#FFF"
	 *   2. "#FFFFFF"
	 *   3. "#FFFFFF00"
	 *   4. "rgba(255,255,255,0.0)"
	 * 
	 * @param	color	The new color to use as the background
	 */
	@:overload(function(color:String):Void {})
	public function setClearColor(color:Int = 0x00000000):Void;
	
	/**
	 * Common utility function used to apply the correct texture processing parameters for the bound texture.
	 * @param	context	The canvas WebGL context object to draw into.
	 * @param	isPOT	Marks whether the texture is "Power of Two", this may allow better quality AA.
	 */
	public function setTextureParams(context:WebGL2RenderingContext, isPOT:Bool = false):Void;
	
	/**
	 * Try to set the max textures the system can handle.
	 * It should default to the hardware maximum, and lower values may limit performance.
	 * Some devices have been known to mis-report their max textures, or you may need a standard baseline cross devices for testing.
	 * Barring the previous suggestions, there is little need to call this function as the library will automatically try to find the best value.
	 * 
	 * NOTE: This method is mainly for internal use, though it may be useful for advanced uses.
	 * @param	count	The number of textures intended for simultaneous loading.
	 */
	public function updateSimultaneousTextureCount(count:Float = 1):Void;
	
	/**
	 * Update the WebGL viewport.
	 * Note that this does <b>not</b> update the canvas element's width/height, but the render surface's instead.
	 * This is necessary after manually resizing the canvas element on the DOM to avoid a up/down scaled render.
	 * @param	width	The width of the render surface in pixels.
	 * @param	height	The height of the render surface in pixels.
	 */
	public function updateViewport(width:Int, height:Int):Void;
	
	
	
	//////////////////
	//   OVERRIDE   //
	//////////////////
	
	/**
	 * StageGL instances cannot be cloned.
	 */
	override public function clone(recursive:Bool = false):StageGL;
	
	/**
	 * Returns a string representation of this StageGL.
	 * @return A string representation of the instance.
	 */
	override public function toString():String;
}